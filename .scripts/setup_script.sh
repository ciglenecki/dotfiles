#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  Script that sets up everything on the new machine.
#               
#################################

# chmod +x setup_script.sh
# sudo ./setup_script.sh


: '

bash <(curl -s https://raw.githubusercontent.com/ciglenecki/dotfiles/master/.scripts/setup_script.sh)


Things to do after running this script:

1. download other packages by hand
cat ~/$DIR_ASSETS packages.txt

2. start insync and paste ignore files from
cat ~/$DIR_ASSETS insync.ignoreme

3. copy brave code from https://drive.google.com/drive
use last word from here https://alexeybarabash.github.io/25th-brave-sync-word/

4. setup shortcuts

5. setup samba on old device
sudo apt install samba
right click on directory in dolphin
create password and share it

come to new machine in dolphin and go to smb://

6. smbget -R smb://hotpan.local/.thunderbird/ ~/.thunderbird

7. copy gpg private key by running
gpg --import private.key
'


sudo echo "Script now has sudo permissions"

rm -rf $HOME/Documents $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos

mkdir $HOME/tmp

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y git curl

bash <(curl -s https://raw.githubusercontent.com/ciglenecki/dotfiles/master/.scripts/clone_github_dotfiles.sh)


# Install packages from package list, loop skips unlocated packages
for i in $(grep -vE "^\s*#" $HOME/.assets/packages.txt  | tr "\n" " "); do
  sudo apt-get install -y $i
done

if [ $DESKTOP_SESSION == "plasma" ]; then
  sudo apt install -y node-typescript
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

# Install spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# Create a dir for vlc's plugin to work properly
mkdir ~/.cache/vlc


# Setup github
git config --global user.email "matej.ciglenecki@gmail.com"
git config --global user.name "Matej Ciglenečki"

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
bash <(curl -s https://raw.githubusercontent.com/ciglenecki/dotfiles/master/.scripts/setup_code_ext.sh)

# Pull spotify random album
cd ~/projects %% git clone https://github.com/matejciglenecki/spotify-random-saved-album.git
pip install spotipy python-dotenv

source $HOME/.profile
source $HOME/.scripts/login.sh

# Install insync
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" https://cdn.insynchq.com/builds/linux/insync_3.8.6.50504-lunar_amd64.deb 2>&1 | tee &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"

run sxhkd