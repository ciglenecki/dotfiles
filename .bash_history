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
j backend
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'myPasswordForPostgresUser';"
sudo -u postgres psql -c 'create database cloud;'
sudo -u postgres psql -c 'create database cloud_test;'
sudo apt install postgresql
sudo -u postgres psql -c 'create database cloud_test;'
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'myPasswordForPostgresUser';"
sudo -u postgres psql -c 'create database cloud_test;'
npm run start:setup:local
echo -e 'DB_USERNAME=postgres\nDB_PASSWORD=myPasswordForPostgresUser' | tee -a .env.local .env.test
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'passgres';"
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'passgres';"npm run start:setup:local
npm run start:setup:local
npm start
{ kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell; } &> /dev/null
j backend
ls
code .
git status
git fetch --all
git pull
code ~/.gitconfig 
git pull --ff-only
git status
git pull origin master
git status
git fetch
git branch -a
code ~/.gitignore 
code ~/.git-credentials 
git checkout T1528
git checkout T1528-CL-docker-service-extract
git status
git checkout dev
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
code ~/.bashrc 
. ~/.profile 
ls
j backend
ls
git status
git log
. ~/.profile 
j backend
git checkout dev
. ~/.bashrc 
. ~/.git-completion.bash
. ~/.bashrc 
git checkout dev 
git checkout T1528-CL-docker-service-extract 
git_prompt_list_themes
code ~/.bash-git-prompt/
git_prompt_list_themes
git_prompt_list_themes | grep Ubuntu
code ~/.bash-git-prompt/
. ~/.bashrc 
git status
ls
cd ..
ls
cd ..
ls
~
cfg status
cfg addu 
cfg add .git-completion.bash .bash-git-prompt/
git rm --cached .bash-git-prompt/
cfg rm --cached .bash-git-prompt/
cfg status
cfg rm -f --cached .bash-git-prompt/
cfg status
cfg commit -m 'update'
cfg push
sgit_prompt_list_themes | grep Ubuntu
udo ubuntu-drivers list
git_prompt_list_themes | grep Ubuntu
j backend
git status
code .
cat README.md 
code scripts/database.local.yml 
sudo apt-get update
git status
sudo apt-get purge upower
sudo apt-get install upower
cd /home/matej/Downloads/
docker load -i memgraph-1.6.1-community-docker.tar.gz 
docker load -i memgraph-1.6.1-community-docker.tar.gz 
docker images
j backend
npm install
cat README.md 
code .
cfg status
cfg addu 
cfg commit -m '2021-07-24-20-35-57'
cfg push
pwd | c
pwd | c /usr/bin/env /bin/sh /tmp/Microsoft-MIEngine-Cmd-3cto8rey.i22 
git status
touch .gitignore
git add .
git commit -m '2-add-two-numbers.cpp'
git push
code .
node
git status
git add . && git  commit -m 'cleaup docker enterprise logic' && git push
cfg status
git status
cfg addu
cfg commit -m '2021-07-25-01-09-27'
cfg push
git add .
git commit -m 'remove docker decorate'
git push
git add . && git  commit -m 'fix docker types' && git push
git status
git add . && git  commit -m 'put in docker container function' && git push
git add . && git  commit -m 'remove trim function comment' && git push
code .
git add . && git  commit -m 'fix tests' && git push
git log
git status
git add . && git  commit -m 'port => mgPort' && git push
j backend
code .
clear
ls
ls 
ls -la
ls -ls
ls -la
ls 
ls -la
npm start
npm run start:setup:local
npm start
docker images
cat scripts/database.local.yml | grep "1.6.1"
npm start
cd ../frontend/
j mrepro
j fer
ls
cd mrepro/
ls
cd gitrepo/
ls
ls -la
cd ..
ls
images
docker ps
docker ps -a
docker ps -a --format "{{. json}}"
docker ps -a --format "{. json}"
docker ps -a --format "{{json .}}"
docker ps -a --format "{{json .}}" | grep 76
DB_USERNAME=postgres DB_PASSWORD=passgress npm test
die
docker iamges
docker ps
j backend
code .
docker ps
git status
docker images
docker ps
git status
git add .
git commit -m 'fix small docker comments'
git push
cat ../frontend/README.md 
code ~/.npmrc
git push
cd ..
cd frontend/
npm install
cd ../backend/
git push
git status
git add .
git commit -m 'update readme'
git push
cd ..
ls
cd ..
ls
cd ..
ls
gh repo clone matejciglenecki/leetcode
ls
cd leetcode/
ls
code .
j backend
code .env.test 
git add .
git commit -m 'remove env test vars'
git push
git status
git pull
git push
git status
git add .
git status
git commit -m 'remove port prop'
git push
tsc 
tsc --watch
DB_USERNAME=postgres DB_PASSWORD=passgress npm test
cat .env.test 
DB_USERNAME=postgres DB_PASSWORD=passgres npm test
tsc --watch
pwd | c
find my_root_dir -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
find ./ -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
sudo apt install rename
echo "rename" >> ~/.assets/matej-packages.txt 
mv ~/.assets/matej-packages.txt ~/.assets/packages.txt
code ~/.scripts/setup_script 
find my_root_dir -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
rename 'tr/ A-Z/-a-z/' -- *
rename 'tr/\ +A-Z/-a-z/' -- *
rename 'tr/s\ +A-Z/-a-z/' -- *
tr ' ' '-'
tr ' ' '-'
rename "tr/' ' '-'" -- *
find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \; -exec rename "s/\s+/_/g" {} \;
find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \; -exec rename "s/\s+/_/g" {} \; -exec rename "s/-+/-/g" {} \;
find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \; -exec rename "s/\s+/_/g" {} \; -exec rename "s/([^w]*_[^w]+)|([^w]+_[^w]*)/-/g" {} \;
find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \; -exec rename "s/\s+/_/g" {} \; -exec rename "s/([^\w]*_[^\w]+)|([^\w]+_[^\w]*)/-/g" {} \;
find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \; -exec rename "s/\s+/_/g" {} \; -exec rename "s/([^a-zA-Z0-9]*_[^a-zA-Z0-9]+)|([^a-zA-Z0-9]+_[^a-zA-Z0-9]*)/-/g" {} \;
find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \; -exec rename "s/\s+/_/g" {} \; -exec rename "s/([^a-zA-Z0-9]*_[^a-zA-Z0-9]+)|([^a-zA-Z0-9]+_[^a-zA-Z0-9]*)/-/g" {} \; -exec rename "s/([0-9]+)(_)/$1-/' {} \;
find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \; -exec rename "s/\s+/_/g" {} \; -exec rename "s/([^a-zA-Z0-9]*_[^a-zA-Z0-9]+)|([^a-zA-Z0-9]+_[^a-zA-Z0-9]*)/-/g" {} \; -exec rename 's/([0-9]+)(_)/$1-/' {} \;
code ~/.scripts/alias 
. ~/.scripts/alias 
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \; \ # Make everyhing lowercase, avoid dir issues (a/a -> A/A)
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;\ # Make everyhing lowercase, avoid dir issues (a/a -> A/A)
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;     -exec rename "s/\s+/_/g" {} \;     -exec rename "s/([^a-zA-Z0-9]*_[^a-zA-Z0-9]+)|([^a-zA-Z0-9]+_[^a-zA-Z0-9]*)/-/g" {} \;     -exec rename 's/^([0-9]+)(_)/$1-/' {} \;
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;     -exec rename "s/\s+/_/g" {} \;     -exec rename "s/\(([0-9]+)\s*\)/$2/g" {} \;     -exec rename "s/([^a-zA-Z0-9]*_[^a-zA-Z0-9]+)|([^a-zA-Z0-9]+_[^a-zA-Z0-9]*)/-/g" {} \;     -exec rename 's/^([0-9]+)(_)/$1-/' {} \;
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;     -exec rename "s/\s+/_/g" {} \;     -exec rename "s/\(([0-9]+)\s*\)/$3/g" {} \;     -exec rename "s/([^a-zA-Z0-9]*_[^a-zA-Z0-9]+)|([^a-zA-Z0-9]+_[^a-zA-Z0-9]*)/-/g" {} \;     -exec rename 's/^([0-9]+)(_)/$1-/' {} \;
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;     -exec rename "s/\s+/_/g" {} \;     -exec rename "s/\(([0-9]+)\)/$2/g" {} \; \
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;     -exec rename "s/\s+/_/g" {} \;     -exec rename "s/\(([0-9]+)\)/$2/g" {} \;
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;     -exec rename "s/\s+/_/g" {} \;     -exec rename "s/\(([0-9]+)\)/$1/g" {} \;
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;     -exec rename "s/\s+/_/g" {} \;     -exec rename "s/\(([0-9]+)\)/$1/" {} \;
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;     -exec rename "s/\s+/_/g" {} \;     -exec rename "s/\(([0-9]+)\)/$2/" {} \;
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;     -exec rename "s/\s+/_/g" {} \;     -exec rename 's/\(([0-9]+)\)/$2/g' {} \;
find . -depth     -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;     -exec rename "s/\s+/_/g" {} \;     -exec rename 's/\(([0-9]+)\)/$1/g' {} \;
~/.scripts/alias 
. ~/.scripts/alias 
renameall 
. ~/.scripts/alias 
renameall 
. ~/.scripts/alias 
renameall 
cd ..
ls
renameall
