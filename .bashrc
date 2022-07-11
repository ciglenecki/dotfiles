# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth


for DOTFILE in $DOTFILES_DIR/{env.sh,alias.sh}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE";
done


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=-1
HISTFILESIZE=-1

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# https://askubuntu.com/a/372862
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi


#\033[01;32m
[ "$PS1" ] || return 0                           # continue only when interactive
# case $(hostname -s) in
# mempan*)
#     prompt_color='\033[48;5;16m\033[38;5;46m'    # green(46) on black(16)
#     ;;
# server*)
#     prompt_color='\033[48;5;16m\033[38;5;46m'   # red(196) on black(16)
#     ;;
# ip*)
#     prompt_color='\033[48;5;16m\033[38;5;46m'   # red(196) on black(16)
#     ;;
# esac

prompt_color='\033[01;32m'

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\['${prompt_color}'\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset prompt_color


# Git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

bind -f  ~/.inputrc

# Use autojump
. /usr/share/autojump/autojump.sh

# Details about system
neofetch

# Reverse history foward enable (Ctrl +S)
stty -ixon


# bash prompt
GIT_PROMPT_THEME=Single_line_Ubuntu
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
