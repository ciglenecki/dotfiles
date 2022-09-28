#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  Script that sets up everything on the new machine.
#               
#################################

# chmod +x setup_script.sh
# sudo ./setup_script.sh


: '
Things to do after running this script:

1. download other packages by hand
cat ~/$DIR_ASSETS packages.txt

2. start insync and paste ignore files from
cat ~/$DIR_ASSETS insync.ignoreme

3. copy brave code from https://drive.google.com/drive

4. setup shortcuts

5. setup samba on old device
sudo apt install samba
right click on directory in dolphin
create password and share it

come to new machine in dolphin and go to smb://

6. smbget -R smb://hotpan.local/.thunderbird/ ~/.thunderbird

7. install vscode extensions

8.
cd ~/projects %% git clone https://github.com/matejciglenecki/spotify-random-saved-album.git
pip install spotipy python-dotenv
'


sudo echo "Script now has sudo permissions"

HOME="/home/matej"

rm -rf $HOME/Documents $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos

mkdir $HOME/tmp

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y git


# Install packages from package list, loop skips unlocated packages
for i in $(grep -vE "^\s*#" $HOME/.assets/packages.txt  | tr "\n" " "); do
  sudo apt-get install -y $i
done

if [ $DESKTOP_SESSION == "plasma" ]; then
  sudo apt install node-typescript
  git clone https://github.com/esjeon/krohnkite.git $HOME/tmp/krohnkite
  cd $HOME/tmp/krohnkite
  make install

  mkdir -p $HOME/.local/share/kservices5/
  ln -s $HOME/.local/share/kwin/scripts/krohnkite/metadata.desktop ~/.local/share/kservices5/krohnkite.desktop

  kwriteconfig5 --file kwinrc --group Plugins --key krohnkiteEnabled "true"

  rm -rf $HOME/tmp/krohnkite

  cd $HOME

  git clone https://github.com/wsdfhjxc/virtual-desktop-bar.git $HOME/tmp/virtual-desktop-bar
  cd $HOME/tmp/virtual-desktop-bar
  ./scripts/install-dependencies-ubuntu.sh
  ./scripts/install-applet.sh
  cd $HOME
  rm -rf $HOME/tmp/virtual-desktop-bar

  kwin --replace &
fi



# Install shutter https://shutter-project.org/downloads/
sudo add-apt-repository -y ppa:linuxuprising/shutter
sudo apt-get update && sudo apt-get install -y shutter

# Install discord https://discord.com/download
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" 'https://discord.com/api/download?platform=linux&format=deb' &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"

# Create a dir for vlc's plugin to work properly
mkdir ~/.cache/vlc


# Setup github
git config --global user.email "matej.ciglenecki@gmail.com"
git config --global user.name "Matej Ciglenečki"

source $HOME/.profile
source $HOME/.scripts/login.sh
