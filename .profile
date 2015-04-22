# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

echo "PATH at this beginning of .profile : $PATH"
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
#    PATH="$HOME/bin:$PATH"
#fi

#PYTHONPATH="/home/jhelmus/python/netcdf4-python-read-only:$PYTHONPATH"
#export PYTHONPATH
#PATH="/home/jhelmus/bin/epd_free-7.3-2-rh5-x86_64/bin:$PATH"

# For CyLP
#LD_LIBRARY_PATH="/home/jhelmus/Code/Cbc/Cbc-2.8.5/lib:$LD_LIBRARY_PATH"
