#!/bin/bash

case "$1" in
    -d|--daemon)
        $0 < /dev/null &> /dev/null & disown
        exit 0
        ;;
    *)
        ;;
esac

inotifywait -r -m $HOME/3-base/9-phone -e close_write | while read file; do mv $HOME/3-base/9-phone/*.{jpg,png,jpeg,gif} $DIR_SCREENSHOTS; done