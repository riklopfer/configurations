#
# Environment Variables
export CLICOLOR=1
PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
export EDITOR=subl
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

if [ -d $HOME/bin ]; then
	export PATH="$HOME/bin:$PATH"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

#
# Aliases
alias ll='ls -l'

#
# Functions
export HG_HOME=~/Work/Source/Hg
function pullAllHg() {
    if [ $1 ]; then
        TOP=$@
    elif [ ${HG_HOME} ]; then
        TOP=${HG_HOME}
    else
        TOP=.
    fi
    
    for HG_DIR in $(/usr/bin/find ${TOP} -maxdepth 3 -type d -name ".hg"); do
        REPO_DIR=$(dirname $HG_DIR)
        if hg incoming -R $REPO_DIR > /dev/null ; then
            echo "Pulling changes to $REPO_DIR"
            (hg pull -u -R $REPO_DIR > /dev/null &)
        fi
        # else
        #     echo "No changes to $REPO_DIR"
        # fi
    done
}
