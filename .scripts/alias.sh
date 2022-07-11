#!/bin/bash

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias a="cd ~"
alias -- -="cd -"
alias cd='cd -P' # autofollow symlinks
function cs() { cd $1;ls -1 --color=auto; } # cd + ls

# f = show dir ending "/", symlinks "*"...

alias l="ls -lF --group-directories-first" # List all files
alias la="ls -laF  --group-directories-first" # List all files excluding . and ..
alias lt="ls -lt " # List all files excluding . and ..
alias lsd="ls -lF | grep --color=never '^d'" # List only directories
alias lsf="ls -p | grep -v /"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert="notify-send"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
if [ ! $(uname -s) = 'Darwin' ]; then
	if grep -q Microsoft /proc/version; then
		# Ubuntu on Windows using the Linux subsystem
		alias open='explorer.exe';
	else
		alias open='xdg-open';
	fi
fi

# commands
alias nap="sudo systemctl hibernate" # hibernate pc
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # add file to config repo
alias update='sudo apt update; sudo apt upgrade -y; sudo apt -y autoremove' # update all
alias c="xclip -selection clipboard" # easy clipboard pipe
alias path='echo -e ${PATH//:/\\n}' # Print each PATH entry on a separate line
alias k='killall'
alias bat='batcat'
alias wttr='curl wttr.in/Zagreb?format=v2'
alias clear='\clear;source ~/.bashrc'
alias clipboard="xclip -o -selection clipboard"
shopt -s extglob

function die(){
    $DOTFILES_DIR/logout.sh;
    shutdown now;
}

function memesrename(){
    for f in *; do
    if [[ $f != 20* ]]
    then
        fn=$(basename "$f")
        extension="${f##*.}"
        mv -n "$fn" "$(date -r "$f" +"%Y-%m-%d-%H-%M-%S").$extension"
    fi
    done
}

# `o` opens the current directory or opens argument
function o() {
	if [ $# -eq 0 ]; then
		open . ;
	else
        for file in "$@"
        do
            open $file > /dev/null 2>&1;
        done		
	fi;
}
### GTD ###

alias study="$BROWSERUSER $BROWSERASAPP$STUDY_SHEET &"
alias cal="$BROWSERUSER $BROWSERASAPP$CAL &"
alias pomo="$BROWSERUSER $BROWSERASAPP$POMODORO &"

function todo() {
    # Get ENV's and pick ones that start with TODO_NAME
    # NAME is saved in array
    todos=$(printenv | sed -nE 's/^TODO_(.*)=.*/\1/p')
    if [ "$#" -ne 1 ]; then
        $BROWSERUSER $BROWSERASAPP$TODO_TODAY &
        return 1
    fi
    uppercase_arg="$(echo $1 | tr a-z A-Z)"
    link=TODO_${uppercase_arg}
    $BROWSERUSER $BROWSERASAPP${!link} &
    unset uppercase_arg
    unset link
    unset todos
    return 1
}
if [ -d "$DIR_FER" ]; then
    for subject in $(ls $DIR_FER | sed -nE 's/^([a-zA-Z].*)/\1/p'); do
        alias $subject="cs $DIR_FER/$subject"
    done
fi


# crypt / decrypt files
function cry() {
    if [ "$#" -ne 1 ]; then
        echo "GPG/UnGpg which file?";
        return -1;
    fi
    if [[ $1 == *.gpg ]]; then
        echo "Decrypting file $1"
        gpg -d $1 > $(basename $1 .gpg) && rm "$1" || echo "Error, $1 did not decrypt";
    else
        echo "Encrypting file $1"
        gpg -r matej.ciglenecki@gmail.com -e $1 && rm "$1" || echo "Error, $1 did not encrypt";
    fi;

}

# Install .deb from web
function debfromweb() {
    url_regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
    if [[ $1 =~ $regex ]]; then
        echo "Link valid, installing from url '$1'"
        TEMP_DEB="$(mktemp)" &&
        wget -O "$TEMP_DEB" $1 2>&1 | tee &&
        sudo dpkg -i "$TEMP_DEB"
        rm -f "$TEMP_DEB"
    else
        echo "Link not valid"
    fi
}

function addpackage() {
    echo -e "$1" >> $HOME/.config/matej-packages.txt
}

# run set of commands with nohup
function run() {
    nohup "$@" >/dev/null 2>&1 &
}


function renameall() {
    rename "y/A-Z/a-z/" *
    rename "s/\s+/-/g" *
    rename 's/\((.*?)\)\./-$1/g' * # (abc).txt -> -abc.txt
    rename 's/\((.*?)\)[^\.]/-$1-/g' * # x(abc)x -> x-abc-x
    rename "s/(:|\(|\)|\[|\]|'|,)//g" * # a()[],b'c" -> abc
    rename 's/"//g' *

    # files will contain _
    rename 's/-+/_/g if -f;' *
    rename "s/_+/_/g if -f;" *

    # directories will contain -
    rename "s/_+/-/g if -d;" *
    rename 's/-+/-/g if -d;' *
}

function note() {
    echo "$@"
    str="'$*'"
    if [ $# -eq 0 ]; then
        cat $DIR_NOTES/notes.md
        return
    fi
    echo "$@"
    str="'$*'"

    echo "$str"
    echo -e "\n$str" >> $DIR_NOTES/notes.md
    echo "Noted to $DIR_NOTES/notes.md"
}


# Favourite
# function fav() {
#     for var in "$@"
#     do
#         ln -rs $var $DIR_FAV
#     done

# }

# alias x='cs $DIR_FAV'