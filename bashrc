# ~/.bashrc

export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/nvim
export HISTFILESIZE=-1
export HISTSIZE=-1
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
tput smkx

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto --group-directories-first'
alias ll='ls $LS_OPTIONS -l --group-directories-first'
alias l='ls $LS_OPTIONS -lA --group-directories-first'
alias showdf='clear && df -Th -x tmpfs -x devtmpfs'
alias showhosts='clear && cat /etc/hosts | egrep -v "^#|^\:|\:\:|^[[:space:]]*$"'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias updt='sudo pacman -Suy --noconfirm'
alias apdt="yaourt -Syu --aur --noconfirm"
alias apl='ansible-playbook'
alias vim='nvim'
alias tt='tmux a'

