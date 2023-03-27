#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  Set variables which are used across the system and other scripts
#################################

# if [ -z ${HOME+x} ]; then export HOME="/home/matej"; fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$HOME/.local/bin:"
fi

if [ -d "/bin/include" ] ; then
    PATH="$PATH:/bin/include"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.npm-global/bin" ] ; then
    PATH="$HOME/.npm-global/bin:$PATH"
fi

if [ -d "/usr/sbin:/sbin" ] ; then
    export PATH=$PATH:/usr/sbin:/sbin
fi

if [ -d "$HOME/anaconda3/bin" ] ; then
    export PATH=$PATH:$HOME/anaconda3/bin
fi

if [ -d "/usr/local/cuda-11.8/bin" ] ; then
    export PATH=$PATH:/usr/local/cuda-11.8/bin
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    export PATH=$PATH:$HOME/.cargo/bin
fi

if [ -d "/opt/blender-3.4.1-linux-x64" ] ; then
    export PATH=$PATH:/opt/blender-3.4.1-linux-x64
fi

if [ -d "/opt/blender-3.4.1-linux-x64" ] ; then
    export PATH=$PATH:/opt/blender-3.4.1-linux-x64
fi

export PYENV_ROOT="$HOME/.pyenv"
export CUDA_HOME=/usr/local/cuda-11.8


export EDITOR="nano"
export VISUAL="code"
export BROWSER="brave-browser"
export BROWSERASAPP="--app="
export BROWSERUSER="$BROWSER --profile-directory=Default"
export BROWSERWORK="$BROWSER --profile-directory=memgraph"
export BROWSERMUSIC="$BROWSER --profile-directory=music"
export BROWSERAPP="${BROWSERUSER} ${BROWSERASAPP}"
export SPOTIFY="${BROWSERMUSIC} --new-window ${BROWSERASAPP}https://open.spotify.com/collection/albums"
export SPOTIFY_RAND_PREFIX="${BROWSERMUSIC} --new-window ${BROWSERASAPP}"

export CAL="${BROWSERUSER} ${BROWSERASAPP}https://calendar.google.com/calendar/r"
export ASOFTMURMUR="${BROWSERMUSIC} ${BROWSERASAPP}https://asoftmurmur.com/"
export POMODORO="${BROWSERUSER} ${BROWSERASAPP}https://pomofocus.io/"
export FILEMANAGER="dolphin"
export BAT_THEME="OneHalfLight" #bat -> cat with wings


# urls
export TODO_TODAY='https://todoist.com/app/#upcoming'
export TODO_FER="https://todoist.com/app#project%2F2207071836"
export TODO_DO="https://todoist.com/app#project%2F1808310462"
export TODO_PROJECTS="https://todoist.com/app#project%2F2221923577%2Ffull"
export STUDY_SHEET="https://docs.google.com/spreadsheets/d/11UlxBM-DTHeX6rWfuDKuoaKp-lOP1sK10xJGQKnsqMU"
export URL_WHATSAPP="https://web.whatsapp.com/"


# paths
export INPUTRC="$HOME/.inputrc"
export DIR_FER="$HOME/fer"
export DIR_NOTES="$HOME/0-notes"
export DIR_DOCUMENTS="$HOME/1-documents"
export DIR_PICTURES="$HOME/2-media"
    export DIR_SCREENSHOTS="$DIR_PICTURES/screenshots/"
export DIR_AUDIO="$HOME/3-audio"
export DIR_EDUCATION="$HOME/4-education"
export DIR_ASSETS="$HOME/5-assets"
export DIR_DOWNLOADS="$HOME/Downloads"
export DIR_PROJECTS="$HOME/projects"

export DIR_GEP="/media/matej/ex-gep"
export DIR_SAM="/media/matej/sam"

export FILE_PACKAGES="$HOME/.assets/packages.txt"
export DIR_BACKUP_DEST="/tmp/backup-veracrypt"
export FILE_BACKUP="$DIR_SAM/home-backup.hc"

#etc
export TIMEFS="%F"
export TIMEFL="%F-%H-%M-%S"
export DATENOW='date +"$TIMEFL"'
export SOUND_LEVEL=20
