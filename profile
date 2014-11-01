# .profile
#
# Login configuration file
# Copyright (C) 2014 De Meyer Maarten <de.meyer.maarten@gmail.com>
#

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # Source .bashrc in case we are logging into runlevel 3
    test -s ~/.bashrc && source ~/.bashrc || true
fi

# History settings
export HISTSIZE=500
export HISTFILESIZE=1000
# No duplicate lines or lines that start with space
export HISTCONTROL=ignoreboth

# Setup VI
export EDITOR=/usr/bin/vim

# Smaller man pages
export MANWIDTH=70

# Src directory
export SRC=~/src

# Stupid firefox keeps creating Desktop folder in $HOME
export XDG_DESKTOP_DIR="/home/maarten"

