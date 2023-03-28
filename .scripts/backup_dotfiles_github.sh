#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  pushes dotfiles to github. Anacron calls this script daily
#################################

shopt -s expand_aliases
source $HOME/.scripts/alias.sh

(cfg add -u && cfg commit -m "daily $(date +%F-%H-%M-%S)" && cfg push) >$HOME/.log/anacron.log 2>&1