#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  Backup files to external hard disk
#               1. Mount veracrypt container
#               2. Rsync files defined in exclude and include lists
#               3. Unmount veracrypt container
#################################

function notify-send() {
    #Detect the name of the display in use
    local display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"

    #Detect the user using such display
    local user=$(who | grep '('$display')' | awk '{print $1}' | head -n 1)

    #Detect the id of the user
    local uid=$(id -u $user)

    sudo -u $user DISPLAY=$display DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus notify-send "$@"
}

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

HOME="/home/matej"
. $HOME/.scripts/env.sh
SRC=$HOME/*; # files inside of home
FILE_BACKUP=$FILE_BACKUP

### Mount veracrypt
DEST_MOUNT_LOCATION=$DIR_BACKUP_DEST
sudo mkdir -p $DEST_MOUNT_LOCATION

echo "Unmounting any pervious virtual disks...";
veracrypt -d

if [ $? -ne 0 ]; then
    echo "Canceling backup because existing virtual disk cannot be unmounted.";
    exit $?;
fi

echo "Mounting a new disk...";

veracrypt -t -k "" --pim=0 --protect-hidden=no --mount $FILE_BACKUP $DEST_MOUNT_LOCATION

if [ $? -eq 0 ]; then
    echo "Veracrypt mounted at $DEST_MOUNT_LOCATION";
else
    echo "Veracrypt couldn't be monuted at $DEST_MOUNT_LOCATION";
    return $?;
fi


EXCLUDE_LIST=$HOME/.assets/backup_exclude_pattern.txt
INCLUDE_LIST=$HOME/.assets/backup_include_pattern.txt

LOG="$HOME/.log/";
mkdir -p $LOG;
LOG="$LOG/backup-hdd.log"
echo $(date +"$TIMEFL") >> $LOG;

notify-send "Starting backup!" "src\t$SRC\ndest\t$DEST_HDD";

echo "Starting file transfer...";

# take into account .gitignore in each subdirectory. If gitignore exists dont copy file specified in that gitignore
# --filter='dir-merge,- .gitignore'

rsync --archive --verbose --update --times --recursive --progress --human-readable \
--exclude-from $EXCLUDE_LIST \
--include-from $INCLUDE_LIST \
--exclude="*" \
$HOME/* $DEST_MOUNT_LOCATION

echo "File transfer ended.";
echo "Unmount the virtual disk...";

sleep 2
veracrypt -d

echo "Unmounting done.";

notify-send "Backup done!" "src\t$SRC\ndest\t$DEST_HDD\nlog file\t$LOG";

exit 0

# /usr/bin/unison /home/matej /media/matej/ex-gep/test-backup\
# 	-prefer "newer"\
# 	-ignore "Path .?*"\
# 	-ignore "Path ?*"\
# 	-ignore "Name .DS_Store"\
# 	-ignore "Name .DS_Store?"\
# 	-ignore "Name ._*"\
# 	-ignore "Name .Spotlight-V100"\
# 	-ignore "Name .Trashes"\
# 	-ignore "Name ehthumbs.db"\
# 	-ignore "Name Thumbs.db"\
# 	-ignore "Name **/TEOINF"\
# 	-ignore "Name **/gitrepo"\
# 	-ignore "Name **/.git"\
# 	-ignore "Name **/venv"\
# 	-ignore "Name **/__pycache__"\
# 	-ignorenot "Path $DIR_NOTES"\
# 	-ignorenot "Path $DIR_DOCUMENTS"\
# 	-ignorenot "Path $DIR_DOWNLOADS"\
# 	-batch
# -ignorenot "Path $DIR_DOCUMENTS"\
# -ignorenot "Path $DIR_DOCUMENTS"\
# -ignorenot "Path $DIR_FER"\
# -ignorenot "Path $DIR_PICTURES"\
# -ignorenot "Path $DIR_DOWNLOADS"\