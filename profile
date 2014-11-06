# .profile
#
# Login configuration file
# Copyright (C) 2014 De Meyer Maarten <de.meyer.maarten@gmail.com>
#

# History settings
export HISTSIZE=500
export HISTFILESIZE=1000
# No duplicate lines or lines that start with space
export HISTCONTROL=ignoreboth

# Setup VI
export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR

# Better man pages
export MANWIDTH=70
export PAGER=/usr/bin/less

# Src directory
export SRC="$HOME/src"

# Stupid firefox keeps creating Desktop folder in $HOME
export XDG_DESKTOP_DIR=$HOME

# Disable messages to root
test $(id -u) -eq 0 && mesg n || true

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # Source .bashrc in case we are logging into runlevel 3
    test -s "$HOME/.bashrc" && . "$HOME/.bashrc" || true
fi

# vim: ft=sh :

