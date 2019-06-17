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

