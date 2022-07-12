#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  pushes dotfiles to github. Anacron calls this script daily
#################################

notify-send "Pushing dotfiles to Github!";

shopt -s expand_aliases
source /home/matej/.scripts/alias.sh;

(cfg addu && cfg commit -m "daily $(date +%F-%H-%M-%S)" && cfg push) >/home/matej/.log/anacron.log 2>&1