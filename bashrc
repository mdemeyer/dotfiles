# .bashrc
#
# Bash configuration file
# Copyright (C) 2013 De Meyer Maarten <de.meyer.maarten@gmail.com>
#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Update window size after every command
shopt -s checkwinsize

# Private function to source files if they are valid
_source_if_exists() {
    test -s "$1" && . "$1" || true
}

# Include bash functions
_source_if_exists "$HOME/.functions"
# Include the alias file
_source_if_exists "$HOME/.alias"
# Set the system up for kde development
_source_if_exists "$HOME/.kf5"
# Use bash-completion, if available
_source_if_exists /usr/share/bash-completions/bash_completion

# Fancy prompt
WHITE='\[\e[1;37m\]'
RED='\[\e[1;31m\]'
GREEN='\[\e[1;32m\]'
YELLOW='\[\e[1;33m\]'
BLUE='\[\e[1;34m\]'
END='\[\033[0m\]'

# Make the prompt red when running as root
if [ "$(id -u)" -eq 0 ]; then
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

unset -f _source_if_exists

# vim: ft=sh :

