# .profile
#
# Login configuration file
# Copyright (C) 2014 De Meyer Maarten <de.meyer.maarten@gmail.com>
#

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
less_path='?f %f.?m (file %i of %m). ?e(END)?x- Next\: %x.:?pB%pB\%..?n (press h for help or q to quit).%t'
export LESS="-iRP$less_path"
# Load the full file in memory. Needed for % in prompt
# G go to end of file, g go back to beginning
export MANPAGER='less -s +Gg'
# Prompt for man pages
export MANLESS="\$MAN_PN\ ?e(END):?pB%pB\%..?n (press h for help or q to quit).%t"
# Always open first manpage
export MAN_POSIXLY_CORRECT=1

# Common directories
export src="$HOME/src"
export notes="$HOME/documents/notes"

# Stupid firefox keeps creating Desktop folder in $HOME
export XDG_DESKTOP_DIR=$HOME

# Disable messages to root
test "$(id -u)" -eq 0 && mesg n || true

# Read the custom profile config files
for file in $HOME/.customprofile.d/* ; do
    if [ -s "$file" ] ; then
        . "$file"
    fi
done

# Source .bashrc in case we are logging into runlevel 3
if [ -n "$BASH_VERSION" ]; then
    test -s "$HOME/.bashrc" && . "$HOME/.bashrc" || true
fi

# vim: ft=sh :

