#!/usr/bin/bash

source /home/matej/.scripts/env


SRC=$HOME/*; # files inside of home
DEST="$DIR_HDD_EXT/.backup-CD/D/"
LOG="$HOME/.log/"; mkdir -p $LOG;
LOG="$LOG/backup-hdd.log"
echo $(date +"$TIMEFL") >> $LOG;

notify-send "Starting backup!" "src\t$SRC\ndest\t$DEST";

# What to back up ?
DIR_NOTES=$(basename $DIR_NOTES);
DIR_DOCUMENTS=$(basename $DIR_DOCUMENTS);
DIR_FER=$(basename $DIR_FER);
DIR_ARCHIVE=$(basename $DIR_ARCHIVE);
DIR_BACKUP=$(basename $DIR_BACKUP);
DIR_PICTURES=$(basename $DIR_PICTURES);
DIR_DOWNLOADS=$(basename $DIR_DOWNLOADS);

rsync --archive --verbose --update --times --recursive --progress --human-readable \
--exclude=".DS_Store" \
--exclude=".DS_Store?" \
--exclude="._*" \
--exclude=".Trashes" \
--exclude="ehthumbs.db" \
--exclude="Thumbs.db" \
--exclude="TEOINF/" \
--exclude="gitrepo/" \
--exclude="**/.git/" \
--exclude="venv/" \
--exclude="*__pycache__*" \
--include="$DIR_NOTES/***" \
--include="$DIR_DOCUMENTS/***" \
--include="$DIR_FER/***" \
--include="$DIR_PICTURES/***" \
--include="$DIR_DOWNLOADS/***" \
--exclude="*" \
$HOME/* $DEST &>> $LOG

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