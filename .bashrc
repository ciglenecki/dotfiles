# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
echo "Sourcing .bashrc"

# Run tmux only if parent process is not Dolphin
# Changing directory in Dolphin doesn't work if tmux is running

parent_proc=$(ps -f $PPID | tail -n 1 | tr -s ' ' | cut -f9 -d ' ')
if [[ "$parent_proc" != *"dolphin"* ]] ;then # determine if parent process is not Dolphin
    if [[ -z "$TMUX" ]] ;then # Check if tmux variable is blank
        if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
        exec tmux new-session -A -s main
        fi
    fi
fi


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

DOTFILES_DIR="$HOME/.scripts"
for DOTFILE in $DOTFILES_DIR/{env.sh,alias.sh}; do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done


# don't put duplicate lines in the history
HISTCONTROL=ignoredups:erasedups
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=9999999999  # the number of lines or commands that are stored in memory in a history list while your bash session is ongoing.
HISTFILESIZE=9999999999 # is the number of lines or commands that (a) are allowed in the history file at startup time of a session, and (b) are stored in the history file at the end of your bash session for use in future sessions.

# When the shell exits, append to the history file instead of overwriting it
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
    PS1='\D{%H:%M} ${debian_chroot:+($debian_chroot)}\['${prompt_color}'\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset prompt_color


# Git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

bind -f  ~/.inputrc

# Autojump
AUTOJUMP=/usr/share/autojump/autojump.sh
if [ -f "$AUTOJUMP" ]; then
    source $AUTOJUMP
fi

# Details about system
if command -v neofetch &> /dev/null; then
    neofetch
    yes '' | sed 8q # add some extra space
fi;

# Reverse history foward enable (Ctrl +S)
stty -ixon

# bash prompt
GIT_PROMPT_THEME=Single_line_Ubuntu
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_THEME=Custom
    GIT_PROMPT_THEME_FILE=$HOME/.git-prompt-colors.sh
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


alias k='kubectl'export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
