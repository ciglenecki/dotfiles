# dotfiles - mainly for Kubuntu

```
sudo apt install -y curl
bash <(curl -s https://raw.githubusercontent.com/ciglenecki/dotfiles/master/.scripts/clone_github_dotfiles.sh)
```

files I curated/collected/configured

## Assets

`.assets/packages.txt` - list of packages that will be installed during the setup

`.assets/insync-ignore` - ignore list for insync (google drive syncing)

`.assets/dconf*` - gnome settings (if ever needed)

## Config

`.config/Code` - vscode snippets and settings

`.config/sxhkd` - (keyboard shortcuts) - simple x hotkey deamon

`.config/kglobalshortcutsrc` - kde shortcuts

`.config/kwinrc` - kde window manager shortcuts

`.config/mimeapps.list` - favorite directories used in Dolphin

`.config/plasma-org.kde.plasma.desktop-appletsrc` - kde pannel

`.configpowermanagementprofilesrc` - "don't do anything when i close my laptop lid'

`.config/yakuakerc` - dropdown terminal`

## Scripts

`.scripts/alias` - useful aliases and functions which I use in terminal

`.scripts/backup-hdd` - script to automatically backup files to external hdd as soon as it's mounted

`.scripts/clone_config` - download this repo and all the files to $HOME

`.scripts/downloads-move-to-subdirs` - move files to subdirectories like `docs`, `zips`, `pics`...

`.scripts/env` - load enviorment variables

`.scripts/login` - script that executes on login

`.scripts/logout` - scripts that executes on logout 

`.scripts/setup_script` - main setup script for newly installed kubuntu

## Device transfer checklist

### Old device


(1)
```
cd ~/5-assets && code --list-extensions > vscode-extensions.txt
```

(2)

Go over your system files and add anything that needs to be backed up in the `/home/matej/5-assets/backup_include_pattern.txt`


(3) Backup whole home directory 

Option A:
```
sudo ./backup_veracrypt.sh -n  /media/matej/sam/home-backup.hc /media/matej/veracrypt
```

Option B
```
export EXCLUDE_LIST=/home/matej/5-assets/backup_exclude_pattern.txt
export INCLUDE_LIST=/home/matej/5-assets/backup_include_pattern.txt
export DEST_MOUNT_LOCATION=/mnt/sam/2026-05-26-spire-backup

rsync --archive --verbose --update --times --recursive --progress --human-readable \
--exclude-from $EXCLUDE_LIST \
--include-from $INCLUDE_LIST \
--exclude="*" \
$HOME/* $DEST_MOUNT_LOCATION
```

### New device

1. Setup and insync
- [ ] download https://www.insynchq.com/downloads/linux
- [ ] paste ignore rules from `5-assets/insync.ignore`
bash <(curl -s https://raw.githubusercontent.com/ciglenecki/dotfiles/master/.scripts/setup_script.sh)

2. Setup brave
- [ ] https://brave.com/download/
- [ ] sync with last word from here https://alexeybarabash.github.io/25th-brave-sync-word/


3. Download manually
- vscode https://code.visualstudio.com/sha/download?build=stable&- os=linux-deb-x64
- veracrypt https://www.veracrypt.fr/en/Downloads.html
- discord https://discord.com/download
- docker https://docs.docker.com/engine/install/ubuntu/
- pgadmin https://www.pgadmin.org/download/pgadmin-4-apt/1
- postman - sudo snap install postman
- fnm (npm in rust): https://github.com/Schniz/fnm
- uv: https://docs.astral.sh/uv/getting-started/installation/

4. Copy files from veracrypt to new system (!!!MAKE SURE YOU DO NOT COPY FILES THAT WILL BE SYNCED BY INSYNC!!!)

5. Run setup script

### VeraCrypt

veracrypt -k "" --pim=0 --protect-hidden=no -m=nokernelcrypto --mount "$CONTAINER" "$MOUNT_POINT"

sudo veracrypt -u "$MOUNT_POINT"
6. Install fnm (node)


https://github.com/Schniz/fnm

```
curl -fsSL https://fnm.vercel.app/install | bash
```

```
fnm install --lts
```

### keyd and ydotool

```
sudo apt install keyd
```

```
sudo systemctl edit keyd
```


at the top
```
[Service]
ExecStart=
ExecStart=/bin/bash -lc 'source /home/matej/.scripts/env.sh && exec /usr/bin/keyd.rvaiya'
```

```
sudo usermod -aG keyd "$USER"
sudo usermod -aG input "$USER"

```

```
newgrp keyd
```

```
sudo systemctl enable --now keyd
```

```
sudo nano /etc/keyd/default.conf
```


check config files

```
sudo /usr/bin/keyd.rvaiya check /etc/keyd/default.conf
```

reload config files
```
sudo /usr/bin/keyd.rvaiya reload
```

```
journalctl --user -u ydotool.service -b --no-page
```

ydotool

```
sudo -b ydotoold --socket-path="$HOME/.ydotool_socket" --socket-own="$(id -u):$(id -g)"
```
