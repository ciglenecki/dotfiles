#!/bin/bash

#echo "$(date) $PATH " > /home/matej/tmp/bash_logout_log.txt

killall firefox
killall keepassxc

# Clean Firefox APP session
# rm -rf $HOME/.mozilla/firefox/kki1yhhb.app-1585008690661/sessionstore-backups/*
# rm $HOME/.mozilla/firefox/kki1yhhb.app-1585008690661/places.sqlite-wal
# rm -rf $HOME/.mozilla/firefox/kki1yhhb.app-1585008690661/datareporting/*

# Clean tmp files older than 30 days
# find $HOME/tmp -type f -mtime +30 -exec rm -f {} \;

# Clean tmp files
rm -rf $HOME/tmp/*

if [ "$SHLVL" = 1 ]; then
    [ -x clear_console ] && clear_console -q
fi