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

