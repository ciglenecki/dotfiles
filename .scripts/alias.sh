#!/bin/bash

#################################
# Author:       Matej Ciglenečki
# Description:  script which sets aliases and functions so they can be used in the terminal
#               some variables depend on ~/.script/env.sh 
#################################

HOME=$(eval echo "~matej")

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

# Add an "alert" alias for long running commands. Use like so: sleep 10; alert
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

# "open" alias will automatically open file(s) in the default application based on their file extension
if [ ! $(uname -s) = 'Darwin' ]; then
	if grep -q Microsoft /proc/version; then
		# Ubuntu on Windows using the Linux subsystem
		alias open='explorer.exe';
	else
		alias open='xdg-open';
	fi
fi


alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # git alias for my presonal config repoitory based on this guide https://www.atlassian.com/git/tutorials/dotfiles
alias nap="sudo systemctl hibernate" # hibernate pc
alias update='sudo apt update; sudo apt upgrade -y; sudo apt -y autoremove' # update and clean all packages
alias c="xclip -selection clipboard" # copy input to clipboard: cat file.txt | c
alias path='echo -e ${PATH//:/\\n}' # print each PATH entry on a separate line
alias k='killall'
alias bat='batcat'
alias wttr='curl wttr.in/Zagreb?format=v2'
# alias clear='\clear;source ~/.bashrc' # clear the terminal and source (execute) bashrc
alias clipboard="xclip -o -selection clipboard" # paste the clipboard entry
alias de="deactivate"
alias study="$BROWSERUSER $BROWSERASAPP$STUDY_SHEET &"
alias cal="$BROWSERUSER $BROWSERASAPP$CAL &"
alias pomo="$BROWSERUSER $BROWSERASAPP$POMODORO &"
alias poe="poetry"

# extglob If set, the extended pattern matching features described above under Pathname Expansion are enabled.
shopt -s extglob


# Set dynamic subject names alias 
# if [ -d "$DIR_FER" ]; then
#     for subject in $(ls $DIR_FER | sed -nE 's/^([a-zA-Z].*)/\1/p'); do
#         alias $subject="cs $DIR_FER/$subject"
#     done
# fi

################
# FUNCTIONS 
################

function v(){
    if [ -d "venv" ]; then
        source venv/bin/activate
    elif [ -d ".venv" ]; then
        source .venv/bin/activate
    else
        python3 -m venv venv
        source venv/bin/activate
    fi
    
}

# shutdown the system
function die(){
    $DOTFILES_DIR/logout.sh;
    shutdown now;
}

# rename images to a date format
function rename_images(){
    for f in *; do
    if [[ $f != 20* ]]
    then
        fn=$(basename "$f")
        extension="${f##*.}"
        mv -n "$fn" "$(date -r "$f" +"%Y-%m-%d-%H-%M-%S").$extension"
    fi
    done
}

# `o` opens the current directory or opens the argument (file)
function o() {
	if [ $# -eq 0 ]; then
		open .
	else
        for file in "$@"
        do
            open "$file" > /dev/null 2>&1;
        done		
	fi;
}

# Starts Todoist in browser. It will open different filter/project based on the argument
# usage:    todo
#           todo projects
#           todo fer
#           ...
function todo() {
    
    # If no argument was provided just open Todoist
    if [ "$#" -ne 1 ]; then
        $BROWSERUSER $BROWSERASAPP$TODO_TODAY &
        return 1
    fi

    # Get ENV's and pick ones that start with TODO_<NAME> (TODO_PROJECTS, TODO_TODAY...)
    # <NAME>s are saved in array
    todo_names=$(printenv | sed -nE 's/^TODO_(.*)=.*/\1/p' | tr A-Z a-z)

    SAVEIFS=$IFS   # Save current IFS (Internal Field Separator)
    IFS=$'\n'      # Change IFS to newline char
    todo_names=($todo_names) # split the `names` string into an array by the same name
    IFS=$SAVEIFS   # Restore original IFS

    lowercase_arg="$(echo $1 | tr A-Z a-z)"

    if [[ ! "${todo_names[*]}" =~ "${lowercase_arg}" ]]; then # if todo_names doesn't contain the argument
        names_concat=$(join_by "|" "${todo_names[@]}")

        echo "usage: todo [$names_concat]"
        unset lowercase_arg
        unset link
        return 1
    fi

    link=TODO_${lowercase_arg}
    $BROWSERUSER $BROWSERASAPP${!link} &

    unset lowercase_arg
    unset link
    unset todo_names
    return 0
}




# Encrypt or decrypt files
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

# Join array by a delimiter
# arr = (1 2 3)
# join_by "|" "${todo_names[@]}" => 1|2|3
function join_by() {
  local d=${1-} f=${2-}
  if shift 2; then
    printf %s "$f" "${@/#/$d}"
  fi
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

# Append package name to the txt list of packages
function addpackage() {
    echo -e "$1" >> $FILE_PACKAGES
}

# run set of commands with nohup
function run() {
    nohup "$@" >/dev/null 2>&1 &
    disown
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
    note_file=$DIR_NOTES/notes.txt
    str="$*"
    if [ $# -eq 0 ]; then
        cat $note_file
        return
    fi
    str="$*"

    echo "$str"
    echo -e "\n$str" >> $note_file
    echo "Noted to $note_file"
}

function focus_all_windows_on_current_desktop() {
    . $HOME/.scripts/focus_all_windows_on_current_desktop.sh
}

function extendpdf() {
    cp $1 $1.old
    pdfcrop --margins '350 50 350 50' "$1" "$1"
}

function cp_compile {
    g++ -Wall -Wextra -Wshadow -D_GLIBCXX_ASSERTIONS -ggdb3 -fmax-errors=2 -o a $1
}

function cp_compile_dbg {
    g++ -Wall -Wextra -Wshadow -D_GLIBCXX_ASSERTIONS -DDEBUG -ggdb3 -fmax-errors=2 -o  a $1
}

function cp_test {
    . $HOME/projects/codeforces-testcases-parser/test.sh
}


function code_uri  {
    local hex_=$(echo '+{"containerName":"/'$2'","settings":{"host":"ssh://'$1'"}}' | od -A n -t x1 | tr -d '[\n\t ]')
    local folder_uri="vscode-remote://attached-container%$hex_:$3"
    echo $folder_uri
}

function slep {
    systemctl suspend
}

function video {
    ffmpeg -i $1 -vcodec libx264 -crf 28 convert-$1
}
