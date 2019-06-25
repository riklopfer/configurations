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

# Shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#
# Aliases
alias ll='ls -l'

#
# Functions
function _ensure_bw() {
    if [ $BW_SESSION ]; then
        return 0
    fi

    if bw login --check >& /dev/null ; then
        echo "Unlocking BitWarden..."
        export BW_SESSION=$(bw unlock --raw)
    else
        echo "Logging into BitWarden..."
        export BW_SESSION=$(bw login russell@klopfer.us --raw)
    fi
    return $?
}

function ssudo() {
    if sudo -n true 2>/dev/null; then 
        # already have sudo
        sudo "$@"
    else
        # make srue we're logged in
        _ensure_bw
        # execute sudo 
        bw get password sts.mmm.com | sudo -S -p "" "$@"
    fi
}

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
