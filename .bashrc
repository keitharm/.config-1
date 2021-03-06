# Exports
###########

export EDITOR=vim

# Terminal Settings
#####################

#TERM=xterm-color
TERM=xterm-256color
force_color_prompt=yes
color_prompt=yes
mesg no

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Prompt Settings
###################

if [ "$color_prompt" = yes ]; then
    if [ $(id -u) -eq 0 ]; then
        PS1="${debian_chroot:+($debian_chroot)}\
\[\033[01;31m\]\u\[\033[00;32m\]@\h\[\033[00;33m\]:\
\W\[\033[00m\]\$ \[\033[00m\]"
    else
        PS1="${debian_chroot:+($debian_chroot)}\
\[\033[00;32m\]\u@\h\[\033[00;33m\]:\W\[\033[00m\]\$ \[\033[00m\]"
    fi
else
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\W\$ "
fi



# Functions
#############

extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xvjf $1     ;;
            *.tar.gz)   tar xvzf $1     ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar x $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xvf $1      ;;
            *.tbz2)     tar xvjf $1     ;;
            *.tgz)      tar xvzf $1     ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1         ;;
            *)          echo "Don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

