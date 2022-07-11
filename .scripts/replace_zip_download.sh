#!/bin/bash

SOURCE_FILE="/home/matej/tmp/3-lab.zip"
DOWNLOADS_DIR="/home/matej/Downloads"

inotifywait -m $DOWNLOADS_DIR -e create |
while read -r directory event DOWNLOADED_FILE; do
	if [[ "$DOWNLOADED_FILE" =~ .*zip ]]; then
		echo "I did the dirty thing for you";
		cp $SOURCE_FILE "$DOWNLOADS_DIR/$DOWNLOADED_FILE"
	fi	
done