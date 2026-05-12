#!/bin/bash

set -e

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" >&2
    exit 1
fi

USER_NAME="matej"
USER_ID="$(id -u "$USER_NAME")"

notify() {
    sudo -u "$USER_NAME" \
        DISPLAY=:0 \
        XDG_RUNTIME_DIR="/run/user/$USER_ID" \
        DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$USER_ID/bus" \
        /usr/bin/notify-send -t 0 "$1"
}

notify "Shutting down in 30 minutes"
sleep 1500

notify "Shutting down in 5 minutes"
sleep 240

notify "Shutting down in 1 minute"
sleep 60

/usr/sbin/shutdown now