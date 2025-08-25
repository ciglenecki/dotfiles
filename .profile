# ~/.profile: executed by the command interpreter for login shells.

# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set home if unset
# if [ -z ${HOME+x} ]; then export HOME="~matej"; fi

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0). CAn be run here because .profile executes .bashrc

echo "Sourcing .profile"
# if command -v ssh-agent &> /dev/null
# then
#     eval "$(ssh-agent -s)"
# fi


if [ -d "$HOME" ]; then
  export DOTFILES_DIR="$HOME/.scripts"
fi

for dotfile in $DOTFILES_DIR/{env.sh,alias.sh}; do
  echo "Sourcing $dotfile"
  [ -f "$dotfile" ] && . "$dotfile";
done

# if [ -f $DOTFILES_DIR/login.sh ]; then
#   source $DOTFILES_DIR/login.sh
# fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
