# .bashrc
#
# Bash configuration file
# Copyright (C) 2013 De Meyer Maarten <de.meyer.maarten@gmail.com>
#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Update window size after every command
shopt -s checkwinsize

# Filename completion with variables
shopt -s direxpand

# History settings
HISTSIZE=500
HISTFILESIZE=5000
HISTCONTROL=erasedups:ignorespace
HISTIGNORE='clear:exit:pwd:ls'
shopt -s histappend

for file in $HOME/.rc.d/* ; do
    if [ -f "$file" ] ; then
        . "$file"
    fi
done

# Use bash-completion, if available
if [ -f "/usr/share/bash-completion/bash_completion" ] ; then
    . "/usr/share/bash-completion/bash_completion"
fi

# Fancy prompt
WHITE='\[\e[1;37m\]'
RED='\[\e[1;31m\]'
GREEN='\[\e[1;32m\]'
YELLOW='\[\e[1;33m\]'
BLUE='\[\e[1;34m\]'
END='\[\e[0m\]'

# Make the prompt red when running as root
if [ "$UID" -eq 0 ]; then
    USER="${RED}\u${END}"
    USER_PROMPT="${RED}#${END}"
else
    USER="${GREEN}\u${END}"
    USER_PROMPT="${GREEN}\$${END}"
fi

# Show the host on remote connection
if [ -n "$SSH_CLIENT" ]; then
    REMOTE="${BLUE}@${YELLOW}\h${END}"
else
    REMOTE=""
fi

PS1="${BLUE}\n\$PWD\n${BLUE}[${END}${USER}${REMOTE}${BLUE}]${END}${USER_PROMPT} "

unset -v USER

# vim: ft=sh :

