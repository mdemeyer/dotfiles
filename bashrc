#! /bin/bash
#
# Bash configuration file
# Copyright (C) 2013 De Meyer Maarten <de.meyer.maarten@gmail.com>
#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Update window size after every command
shopt -s checkwinsize

# Include bash functions
test -s ~/.functions && source ~/.functions || true

# Include the alias file
test -s ~/.alias && source ~/.alias || true

# Set the system up for kde development
test -s ~/.kf5 && source ~/.kf5 || true

# Fancy prompt
WHITE="\[\e[1;37m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
BLUE="\[\e[1;34m\]"
END="\[\033[0m\]"

# Make the prompt red when running as root
if [ $(id -u) -eq 0 ]; then
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

PS1="${BLUE}\n\$(pwd)\n${BLUE}[${END}${USER}${REMOTE}${BLUE}]${END}${USER_PROMPT} "

# Use bash-completion, if available
if [ -f /usr/share/bash-completion/bash_completion ] ; then
    test -n "$PS1" && . /usr/share/bash-completion/bash_completion
fi

# Start KDE on startup
# This needs ~/.xinit
if [ -f ~/.xinit ] ; then
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi

