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

# Private function to source files if they are valid
_source_if_exists() {
    test -s "$1" && . "$1" || true
}

# History settings
HISTSIZE=500
HISTFILESIZE=5000
HISTCONTROL=erasedups:ignorespace
HISTIGNORE='clear:exit:pwd:ls'
shopt -s histappend


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

unset -f _source_if_exists
unset -v USER

# vim: ft=sh :

