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
#export TERM=xterm-256color
eval "`dircolors`"

#for root
#PS1='\[\e[1;31m\]\u:\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;34m\]\$ \[\e[m\]\[\e[0;37m\]'
#for user
PS1='\[\033[01;32m\]\u@\h:\[\e[m\] \[\e[1;34m\]\W\[\e[m\]\[\e[1;34m\] \$\[\e[m\] '

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

