#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  Backup files to external hard disk
#               1. Mount veracrypt container
#               2. Rsync files defined in exclude and include lists
#               3. Unmount veracrypt container
#################################

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  return 
fi

HOME="/home/matej"
. $HOME/.scripts/env.sh
SRC=$HOME/*; # files inside of home
DEST=$DIR_SAM

### Mount veracrypt
DEST_MOUNT_LOCATION="/media/matej/veracrypt"
sudo mkdir -p $DEST_MOUNT_LOCATION

veracrypt -d
veracrypt \
-t -k "" --pim=0 --protect-hidden=no \
--mount "$DEST/home-backup" $DEST_MOUNT_LOCATION

if [ $? -eq 0 ]; then
    echo "Veracrypt mounted at $DEST_MOUNT_LOCATION";
else
    echo "Veracrypt coudln't be monuted at $DEST_MOUNT_LOCATION";
    return $?;
fi


EXCLUDE_LIST=$HOME/.assets/backup_exclude_pattern.txt
INCLUDE_LIST=$HOME/.assets/backup_include_pattern.txt

LOG="$HOME/.log/";
mkdir -p $LOG;
LOG="$LOG/backup-hdd.log"
echo $(date +"$TIMEFL") >> $LOG;

notify-send "Starting backup!" "src\t$SRC\ndest\t$DEST";

# take into account .gitignore in each subdirectory. If gitignore exists dont copy file specified in that gitignore
# --filter='dir-merge,- .gitignore'

rsync --archive --verbose --update --times --recursive --progress --human-readable \
--exclude-from $EXCLUDE_LIST \
--include-from $INCLUDE_LIST \
--exclude="*" \
$HOME/* $DEST_MOUNT_LOCATION

veracrypt -d
notify-send "Backup done!" "src\t$SRC\ndest\t$DEST\nlog file\t$LOG";


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