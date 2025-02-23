#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  Script that executes on login.
#################################


sleep 3
# flameshot &
sxhkd &

#$BROWSERUSER $BROWSERASAPP$CAL &
#$BROWSERUSER $BROWSERASAPP$TODO_TODAY &
#$BROWSERUSER $BROWSERASAPP$POMODORO &

# barrier &
trickle -s -u 6250 -d 6250 insync start &
# thunderbird &
# qbittorrent &
syncthing -no-browser &
yakuake &

sshfs tp-relu-playground:/ $HOME/remote/tp-relu-playground
sshfs gym-lecun:/ $HOME/remote/gym-lecun

# /usr/sbin/anacron -s -t $HOME/.anacron/etc/anacrontab -S $HOME/.anacron/spool &

$HOME/.scripts/move_downloads_to_subdirectories.sh &
