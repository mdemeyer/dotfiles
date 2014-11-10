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
# Don't show these commands in history
export HISTIGNORE='[bf]g *:jobs:clear:exit:pwd:ls *:cd *:man *'

# Setup VI
export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR

# Better man pages
export MANWIDTH=70
export PAGER=/usr/bin/less
# Don't store less history (.lesshst file)
export LESSHISTFILE=-
# Less options
# -i ignore case in searches if the search is lowercase
# -FX Close less if the output fits on one page
# -R Show color output from grep --color=always
# -P Use custom path
less_path='?f%f:Standard input.?m (file %i of %m). ?e(END) ?x- Next\: %x.:?pB%pB\%..%t'
export LESS="-iRP$less_path"

# Enable color output for grep
export GREP_OPTIONS='--color-auto'

# Src directory
export SRC="$HOME/src"

# Stupid firefox keeps creating Desktop folder in $HOME
export XDG_DESKTOP_DIR=$HOME

# Disable messages to root
test $(id -u) -eq 0 && mesg n || true

# Source .bashrc in case we are logging into runlevel 3
if [ -n "$BASH_VERSION" ]; then
    test -s "$HOME/.bashrc" && . "$HOME/.bashrc" || true
fi

# vim: ft=sh :

