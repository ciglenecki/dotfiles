#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  Script that sets up everything on the new machine.
#               
#################################

# chmod +x setup_script.sh
# sudo ./setup_script.sh

sudo echo "Script now has sudo permissions"

# Backup config file

rm -rf $HOME/Documents $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos
mkdir -p $HOME/tmp $HOME/projects

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y git curl

# Setup git info
git config --global user.email "matej.ciglenecki@gmail.com"
git config --global user.name "Matej Ciglenečki"

if [ ! -d "$HOME/.cfg" ]; then
  cp -r ~/.config ~/.config-backup-$(date +%s)
  bash <(curl -s https://raw.githubusercontent.com/ciglenecki/dotfiles/master/.scripts/clone_github_dotfiles.sh)
fi

# Make scripts executable
chmod +x $HOME/.scripts/*

# Install discord https://discord.com/download
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" 'https://discord.com/api/download?platform=linux&format=deb' &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"

# Create a dir for vlc's plugin to work properly
mkdir ~/.cache/vlc


# Set GpG agent to CLI instead of GUI
sudo apt install -y pinentry-tty
sudo update-alternatives --config pinentry

# Install bash git prompt, only git pull, that's it
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Install docker https://github.com/docker/docker-install#usage
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
dockerd-rootless-setuptool.sh install

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O $DOTFILES_DIR/.git-completion.bash
############

# install code extensions
bash $HOME/.scripts/setup_code_ext.sh


source $HOME/.profile
source $HOME/.scripts/login.sh


# Startup script chmod +x
chmod +x $HOME/.config/autostart/*

killall dolphin
nohup sxhkd &


# Install packages from package list, loop skips unlocated packages
for i in $(grep -vE "^\s*#" $HOME/5-assets/packages.txt  | tr "\n" " "); do
  sudo apt install -y $i
done