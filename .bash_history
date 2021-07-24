echo ".cfg" >> $HOME/.gitignore
echo "setup_script.sh" >> $HOME/.gitignore
git clone --bare https://github.com/matejciglenecki/dotfiles $HOME/.cfg
rm -rf .cfg/
mkdir -p $HOME/.cfg
echo ".cfg" >> $HOME/.gitignore
echo "setup_script.sh" >> $HOME/.gitignore
git clone --bare https://github.com/matejciglenecki/dotfiles $HOME/.cfg
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
mkdir -p .config-backup
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep "^\s+" | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep "\s+" | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep "\h+" | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep "\s+" | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep "\h+" | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep "\t+" | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep "\t+" 
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep '\t+'
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E "\s+"
man grep
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E "\t+"
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E "/t+"
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E "(\t)+"
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep #"\s+" | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep $"\s+" | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep $'\s+' | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep $'\t+' | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep '\t+' | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep #'\t+' | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep $'\t+' | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep $'^\t+' | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep $^'\t+' | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'\t+' | awk {'print $1'}
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'^\t+' | awk {'print $1'}
mkdir -p .config-backup
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'^\t+' | awk {'print $1'} | xargs dirname | sort -u | xargs -I{} mkdir -p {} $HOME/.config-backup/{};
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'^\t+' | awk {'print $1'} | xargs -I{} mv {} .config-backup/{};
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout;
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no;
git status
cfg status
cfg pull
ls
ls -la
cfg status
cd .local/
ls
cd share/
ls
cd konsole/
l
cfg add matej-pink* konsole-matej.profile 
cd ..
cd color-schemes/
cfg status
ls
cfg add matej-pink*
cfg status
cfg commit -m 'add colors'
cfg push
cfg push --set-upstream origin master
reboot
cd ~/tmp/
ls
cd dotfiles/
git status
git pull
git fetch 
git stauts
git status
ls
cd .config/
ls -la
ls
ls -l
find . -t file
find . -f file
find . -type file
man find
find .
find . -file
find . -f 
find . -t
ls -d
ls ls -a
ls -a
ls -R
find . -type f
find ./. -type f
find ./ -type f
find ./* -type f
find ./. -type f
find . -type f
ls -la
ls
cd ..
find . -t file
find . -type f
ls
ls -la
cd .local/
ls
cd share/
ls
cd ..
ls 
cd ..
find . -type f
cp .local ~/
cp -r .local ~/
kwin --replace &
settings
o
reboot
update
shutdown 0
logout
{ kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell; } &> /dev/null
kwin --replace &
gunzip virtual-desktop-bar-1.4.tar.gz 
untar virtual-desktop-bar-1.4.tar 
sudo apt install untar
unzip virtual-desktop-bar-1.4.tar 
tar xvf virtual-desktop-bar-1.4.tar 
./install-dependencies-ubuntu.sh 
./install-applet.sh 
./scripts/install-applet.sh 
git clone https://invent.kde.org/plasma/latte-dock.git
./install.sh 
ls
cfg status
code ~/.scripts/setup_script 
cd ~/Downloads/
ls
o
sudo add-apt-repository ppa:kubuntu-ppa/backports
sudo apt update
sudo apt dist-upgrade
130pastashotaux
sudo apt install cmake extra-cmake-modules qtdeclarative5-dev libqt5x11extras5-dev libkf5iconthemes-dev libkf5plasma-dev libkf5windowsystem-dev libkf5declarative-dev libkf5xmlgui-dev libkf5activities-dev build-essential libxcb-util-dev libkf5wayland-dev git gettext libkf5archive-dev libkf5notifications-dev libxcb-util0-dev libsm-dev libkf5crash-dev libkf5newstuff-dev libxcb-shape0-dev libxcb-randr0-dev libx11-dev libx11-xcb-dev kirigami2-dev
ls
{ kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell; } &> /dev/null
latte-dock
latte-dock &
kwin --replace &
sudo apt install libunitydev
sudo apt install libunity-dev
kwin --replace &
killall latte
killall lattedock
killall latte-dock
reboot
cd tmp/
ls
cd ..
cd Downloads/
ls
cd latte-dock
ls
./uninstall.sh 
kwin --replace &
killall latte-dock
./uninstall.sh 
{ kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell; } &> /dev/null
rm -rf  ~/.local/share/kscreen/
reboot 
sudo apt update
update
code ~/.scripts/alias 
code ~/.config/kwinrc 
{ kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell; } &> /dev/null
kwin -- replace &> /dev null
kwin -- replace &> /dev/null
update
;s
ls
cd ..
ls
cd matej/
ls
code ~/.config/kglobalshortcutsrc 
kwin --replace &
code ~/.config/kwinrc 
kwin --replace &
killall latte-dock
killall lattedock
code ~/.config/kwinrc 
run kin --replace
run kwin --replace
kwin --replace &
kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.plasmashell,/PlasmaShell,org.kde.PlasmaShell,activateLauncherMenu"
qdbus org.kde.KWin /KWin reconfigure
kwin --replace *
killall keepassxc
killall qbittorrent
sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean
sudo ubuntu-drivers list
sudo apt install git
cd Downloads/
ls
chmod +x clone_config 
./clone_config 
chmod +x clone_config 
./clone_config 
dirname
xargs
man xargs
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'^\t+' | awk {'print $1'} | xargs dirname | sort -u | xargs -I{} mkdir -p {} $HOME/.config-backup/{};
./clone_config 
ediet clone_config 
open clone_config 
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'^\t+' | awk {'print $1'} | xargs dirname | sort -u | xargs -I{} mkdir -p {} $HOME/.config-backup/{};
./clone_config 
ls -la
ls -la ~
cd ..
ls
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'^\t+' | awk {'print $1'} | xargs dirname | sort -u | xargs -I{} mkdir -p {} $HOME/.config-backup/{};
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'^\t+' | awk {'print $1'} | xargs -I{} mv {} $HOME/.config-backup/{};
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout;
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no;
mv ~/Downloads/ ../
mv ~/Downloads/clone_config ../
sudo mv ~/Downloads/clone_config ../
ls
cd ..
ls
mv clone_config matej/
sudo mv clone_config matej/
cd matej/
./clone_config 
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'^\t+' | awk {'print $1'} 
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | grep -E $'^\t+'
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout;
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no;
cfg status
./.scripts/setup_script 
sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean
sudo apt --fix-broken install
[200~mkdir ~/.cache/vlc
# Setup github
git config --global user.email "matej.ciglenecki@gmail.com"
git config --global user.name "Matej Ciglenečki"
source $HOME/.profile
source $HOME/.scripts/login
reboot
ls
cd .config
ls
cd plasma-workspace/env/
ls
cd .
..
cd shutdown/
l
cfg add logout 
cd ..
ls
cd ..
ls
cd autostart
ls
ls -la
cd ~/.config/plasma-workspace/env/
ls
ls -la
yakuake
ls -la
cfg status
cfg commit -m 'add logout kde'
cfg push
cfg push --set-upstream origin master
cfg pull
cfg status
cfg push --set-upstream origin master
cfg pull
cfg status
cfg commit 
cfg commit -F nano
cfg commit -m nano
cfg status
cfg push
cfg push --set-upstream origin master
cfg status
reboot
sudo apt install node-typescript
cd ~/tmp/
ls
ls -la
git clone https://github.com/wsdfhjxc/virtual-desktop-bar.git $HOME/tmp/virtual-desktop-bar
sudo apt install yakuake
code ~/.scripts/login 
open ~/.scripts/login 
echo $$DESKTOP_SESSION
echo $DESKTOP_SESSION
if [ $DESKTOP_SESSION == "plasma" ]; then 	yakuake & fi;
sudo apt install brave-browser
ls
cd ~/.config
ls
cfg add powermanagementprofilesrc 
cfg status
cfg commit -m 'add powers'
cfg push
ls
sudo gdebi rstudio-server-1.4.1717-amd64.deb
sudo apt purge rstudio-server
sudo apt purge rstudio-server-1.4.1717-amd64.deb 
sudo apt purge rstudio-server
sudo apt remove --purge rstudio-server
code ~/.assets/matej-packages.txt 
sudo apt install postgresql
sudo apt install pgadmin4
#
# Setup the repository
#
# Install the public key for the repository (if not done previously):
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
# Create the repository configuration file:
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
#
# Install pgAdmin
#
# Install for both desktop and web modes:
sudo apt install pgadmin4
~/.local/share/mime/application/
cd ~/.local/share/mime/application/
ls
cat vnd.sun.xml.base.xml 
cd ~/.local/share/mime/
cd ~/.local/share/mime/aliases 
ls
cat globs
cat types 
cat types
ls
cd a
cd app
cd application/l
cd application/
ls
cat pkcs12.xml 
cat x-
cd ..
ls
ls *
cat *
cat * | grep firefox
cat *
cat $XDG_CONFIG_HOME
echo $XDG_CONFIG_HOME
ls ~/.kde/share/config/
cat mime.cache 
ls
cd ~/.config
ls
ls | grep mime
cat mimeapps.list 
cfg add mimeapps.list 
cfg commit -m 'add mimeapps'
cfg push
sudo apt install postgresql
code insync-ignore
chmod -x anki-addons.txt 
ls
cd ..
ls
chmod -R -x 0-notes/ 2-fer/ 1-documents/ 3-archive/ 4-pictures/ 5-backup/ 6-literature/
sudo chmod -R -x 0-notes/ 2-fer/ 1-documents/ 3-archive/ 4-pictures/ 5-backup/ 6-literature/
cd 0-notes/
sudo chown matej:matej 0-notes/ 2-fer/ 1-documents/ 3-archive/ 4-pictures/ 5-backup/ 6-literature/
ls
cd 0-notes/
mkdir test
chmod -R g+w test/
chmod -R g+w 0-notes/ 2-fer/ 1-documents/ 3-archive/ 4-pictures/ 5-backup/ 6-literature/
sudo chmod -R g+w 0-notes/ 2-fer/ 1-documents/ 3-archive/ 4-pictures/ 5-backup/ 6-literature/
cd 0-notes/
ls
cd ..
ls
sudo chmod -R g+w 0-notes/ 2-fer/ 1-documents/ 3-archive/ 4-pictures/ 5-backup/ 6-literature/
ls 
ls -la
cd .torrent/
ls -la
sudo chmod -R 0775 0-notes/ 2-fer/ 1-documents/ 3-archive/ 4-pictures/ 5-backup/ 6-literature/
sudo chmod -R -x 0-notes/ 2-fer/ 1-documents/ 3-archive/ 4-pictures/ 5-backup/ 6-literature/
sudo chmod -R 0775 0-notes/ 2-fer/ 1-documents/ 3-archive/ 4-pictures/ 5-backup/ 6-literature/
sudo chmod -R -x+X 0-notes/ 2-fer/ 1-documents/ 3-archive/ 4-pictures/ 5-backup/ 6-literature/
ls -la
cat ~/.kde/share/config/kdeglobals 
cat ~/.kde/share/config/kdeglobals | grep test
cd ~/.kde/share/config
ls
cd ..
ls
cd apps/
ls
cd ..
ls
cd ..
ls
cd share/config/
ls
cat ~/.config/kdeglobals 
cat ~/.config/kde.org/systemsettings.conf 
cat ~/.local/share/user-places.xbel
cat ~/.local/share/user-places.xbel | grep test
cfg add ~/.local/share/user-places.xbel
cfg commit -m 'add places
cfg commit -m 'add places'
cfg status
cfg addu 
cfg add ~/.config/Insync/
cfg commit -m 'insync and places'
cfg push
j projects
ls
cd ~
ls
ls -la
cd 0-notes/
ls -la
cd ..
cd 0-notes/
touch a.md
ls
ls -la
cd ..
ls
cd 3-archive/
ls
ls -la
cd webs/
ls -la
cd ..
ls 
cd 1-documents/
ls
ls -la
o signature.png 
cd ..
ls
cd 5-backup/
ls
o password-database.kdbx 
o anki-addons.txt 
ls -la
o
j cloud
mkdir -p ~/projects/memgraph
gh clone memgraph/cloud
gh repo memgraph/cloud
gh repo clone memgraph/cloud
gh auth login
ls
sudo chmod -R g+w ~/5-backup/
ls
ls -la
ls
ls -la
ls
ls -la
cd a
ls
cd ..
ls
cd 2-fer/
ls
_pi
cd pis/
ls
cd 1-presentations/
l
rm PIS-01\ -\ Uvod_Poslovni\ sustav_2020
ls
rm 'PIS-01 - Uvod_Poslovni sustav_2020'
rm 'PIS-01 - Uvod_Poslovni sustav_2020_samo prvi dio.ppt' 
ls
ls -la
o
cfg status
cfg addu
cfg commit -m 'yakuake'
cfg push
j
j cloud
cfg status
cat ~/.config/dolphinrc 
cat ~/.config/dolphinrc  | grep test
ls
cat kdeglobals 
cat kdeglobals  | grep brave
cat kdeglobals  | grep firefox
cat kdeglobals  | grep qt
cat kdeglobals  
cat ~/.assets/insync-ignore 
cat ~/.assets/insync-ignore  | c
cat ~/.assets/insync-ignore 
cat ~/.assets/insync-ignore  | c
cat ~/.config/matej-packages.txt 
cfg status
cat ~/.config/plasma-workspace/env/
cat ~/.config/autostart-scripts/login 
cd ~/.config/autostart-scripts/
ls
ls -la
git add login 
cfg add login 
cd ..
~
ls
cfg status
mkdir ./assets
mv dconf-* assets/
ls
cd .config
ls
mv matej-packages.txt my_crontab.backup ~/.assets/
ls
open ~/.scripts/setup_script 
cfg status
cd ..
mv assets/ .assets
cfg add .assets/
cfg status
cfg addu 
cfg status
cfg push
cfg commit -m 'create assets dir'
cfg push
cfg status
cd ~/.config
ls
ls -la
cfg add kwinrc kwinrulesrc 
cfg status
cfg addu 
cfg commit -m 'add shortcuts'
cfg status
cfg addu
cfg commit -m 'shortcuts'
cfg push
cat ~/.assets/matej-packages.txt 
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install apt-get install -y build-essential
sudo apt install  build-essential
y
sudo apt update
sudo apt install gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1717-amd64.deb
sudo gdebi rstudio-server-1.4.1717-amd64.deb
sudo apt install brave-browser
sudo snap install postman
~
ls
cd 3-archive/
ls
j projects
ls
cd ~/projects/
ls
cd ,
cd memgraph/
gh repo clone
gh repo clone memgraph/cloud
cd ~/t
cd ~/tmp/
ls
cd ~/_tmp/
ls
rm -rf 20*
rm -rf crikvenica/
rm -rf 'island gyals'/
rm -rf 'Untitled spreadsheet.gdsheet' 
killall insync
rm -rf ~/.config/Insync/
~
ls
cd 0-notes/
ls
cd ..
ls
cd 4-pictures/
ls
cd avi/
l
cd ..
cd ~/3-archive/
ls
cd 2020-
ls
cd conty/o
l
cd conty/
l
sl
l
cd ..
ls
cd docs/
ls
cat ~/.scripts/log
cat ~/.scripts/login 
trickle -s -u 70 -d 300 insync start &
killall insync
trickle -s -u 70 -d 300 insync start &
j cloud
cd ~/projects/memgraph/cloud/
ls
cd frontend/
npm install
code ~/.assets/matej-packages.txt 
cat ~/.assets/assets/
ls
ls ~/.assets/assets/
mv ~/.assets/assets/* ~/.assets/
rm -rf ~/.assets/assets/
sudo apt install npm
npm
npm -v
node -v
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
cat ~/0-notes/cs-linux.md 
cat ~/0-notes/cs-linux.md  | grep node
sudo apt-get install -y nodejs
cat ~/5-backup/browser/brave-sync-code.txt 
cat ~/5-backup/browser/brave-sync-code.txt  | c
cat ~/5-backup/browser/brave-sync-code-memgraph.txt.txt  | c
cat ~/5-backup/browser/brave-sync-code-memgraph.txt  | c
cfg status
cfg addu 
cfg status
cfg addu 
cfg add .assets/ .git-credentials .config/dolphinrc .config/keepassxc/keepassxc.ini .config/kglobalshortcutsrc 
cfg status
cfg add .bash_history 
cfg status
cfg commit -m 'backup'
cfg push
kwin -- replace &
kwin --replace &
ls
kwin --replace 
kwin --replace &
j frontend
npm install
cat ~/.config/plasma-org.kde.plasma.desktop-appletsrc 
cfg add ~/.config/plasma-org.kde.plasma.desktop-appletsrc 
cfg status
cfg addu 
cd ~/.config/Insync/
ls
cfg add .
cfg status
cfg add live/
cfg add logs.db 
cfg out.txt 
cfg add out.txt 
cfg rm --cached logs.db 
cfg add .
cfg addu
cfg status
cfg commit -m 'add kde panel and insync'
cfg push
j backend
cd ~/projects/memgraph/cloud/
cd backend/
npm install
{ kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell; } &> /dev/null
reboot 
sudo apt-get install build-essential
npm update
sudo apt-get install -y nodejs
sudo dpkg -i --force-overwrite  /var/cache/apt/archives/nodejs_14.17.2-deb-1nodesource1_amd64.deb
sudo apt-get install -y nodejs
sudo apt autoremove && sudo apt autoclean
j cloud
ls
npm install
docker load -i memgraph-1.6.1-community-docker.tar.gz 
