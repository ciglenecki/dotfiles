#!/bin/bash

sxhkd &
yakuake &

#$BROWSERUSER $BROWSERASAPP$CAL &
#$BROWSERUSER $BROWSERASAPP$TODO_TODAY &
#$BROWSERUSER $BROWSERASAPP$POMODORO &

# barrier &
trickle -s -u 6250 -d 6250 insync start &
thunderbird &
# qbittorrent &
syncthing -no-browser &
shutter --min_at_startup &

/usr/sbin/anacron -s -t $HOME/.anacron/etc/anacrontab -S $HOME/.anacron/spool &
/home/matej/.scripts/move_downloads_to_subdirectories.sh &