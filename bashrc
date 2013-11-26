#! /bin/bash
#
# Bash configuration file
# Copyright (C) 2013 De Meyer Maarten <de.meyer.maarten@gmail.com>
#


# Setup VI
export EDITOR=/usr/bin/vim

# Include bash functions
test -s ~/.functions && source ~/.functions || true

# Include the alias file
test -s ~/.alias && source ~/.alias || true

# Set the system up for kde development
test -s ~/.bash_kde && source ~/.bash_kde || true

# Fancy prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# Src directory
export SRC=~/src
export XDG_CACHE_HOME=~/.cache

# Start KDE on startup
# This needs ~/.xinit
if [ -f ~/.xinit ] ; then
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi

