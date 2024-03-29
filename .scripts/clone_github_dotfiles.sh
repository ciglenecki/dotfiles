#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  Clone dotfiles from github, a bare git repository (based on this guide https://www.atlassian.com/git/tutorials/dotfiles)
#################################

sudo apt install -y git

cd $HOME
mkdir -p $HOME/.cfg

echo ".cfg" >> $HOME/.gitignore
echo "setup_script.sh" >> $HOME/.gitignore

git clone --recurse-submodules --bare https://github.com/ciglenecki/dotfiles $HOME/.cfg

# Make all dirs for conflicted files
mkdir -p .config-backup

/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'^\t+' | awk {'print $1'} | xargs dirname | sort -u | xargs -I{} mkdir -p {} $HOME/.config-backup/{};

/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'^\t+' | awk {'print $1'} | xargs -I{} mv {} $HOME/.config-backup/{};

/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout;

/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no;
