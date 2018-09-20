#!/usr/bin/env bash

# Install Powerline fonts
# git clone https://github.com/powerline/fonts.git --depth=1
# ./install.sh
#

set -e
# Setting variables
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bld=`tput bold`
fmt="%-12s%-12s\n"
backdir=~/dotfiles-bak
curdate=`date +%Y%m%d`

function show_usage()
{
    echo -e "\nUsage: install.sh [PARAMETER]...\nScript for installing my default dotfiles\n"
    echo -e "dotfiles\t-- Install bashrc, tmux.conf, Xresources, psqlrc"
    echo ""
    exit 1
}

# Checking if needed progs installed
function program_is_installed()
{
    echo "Checking installed tools..."
    local count=0
    echo ""
    for i in "$@"
    do
        type $i >/dev/null 2>&1 && printf " $fmt" "$i" "${bld}${green}+${reset}"\
        || { printf " $fmt" "$i" "${bld}${red}-${reset}"; count=$((count+1)); }
    done
    if [ ! $count == 0 ]
    then
        echo -e "\nSome tools are missing, install them!\n"
    fi
    echo ""
}

# Function for backing up and installing config files
function syncf()
{
    if [ ! -d "$backdir" ]
    then
        mkdir $backdir
    fi

    for i in "$@"
    do
        if [ -f ~/.$i ]
        then
            local count=`ls -l $backdir| grep $i-$curdate | wc -l`
            if [ "$count" == 0 ]
            then
                cp -a ~/.$i $backdir/$i-$curdate
            else
                cp -a ~/.$i $backdir/$i-$curdate-${count}
            fi
            rsync $i ~/.$i 1>/dev/null
        else
            rsync $i ~/.$i 1>/dev/null
        fi
    done
}

# Function for backing up and installing app config dirs
function syncd()
{
    if [ ! -d "$backdir/.config" ]
    then
        mkdir $backdir/.config
    fi

    for i in "$@"
    do
        if [ -d $HOME/.config/$i ]
        then
            local count=`ls -l $backdir/.config/| grep $i-$curdate | wc -l`
            if [ "$count" == 0 ]
            then
                cp -ar $HOME/.config/$i $backdir/.config/$i-$curdate
            else
                cp -ar $HOME/.config/$i $backdir/.config/$i-$curdate-${count}
            fi
            rsync -r config/$i $HOME/.config/$i 1>/dev/null
        else
            rsync -r config/$i $HOME/.config/$i 1>/dev/null
        fi
    done
}

# Check for root
[ $USER == "root" ] && { echo "Do NOT run as root!!!"; exit 1; }

# Check for arguments and show usage
[ ! -n "$1" ] && { program_is_installed rsync fc-cache nvim tmux xrdb; show_usage; }

# Creating traps, just in case...
trap 'echo ""; echo "Exiting script..."; exit 1;' SIGINT SIGQUIT SIGTSTP

# Installing things
while [ -n "$1" ]
do
case $1 in
"dotfiles" )
    echo -n "Installing dotfiles..."
    syncf bashrc psqlrc Xresources tmux.conf
    syncd nvim rofi
    source ~/.bashrc
    xrdb -merge ~/.Xresources
    echo " ${bld}${green}+${reset}"
    echo "You should also install Powerline fonts for vim-powerline plugin"
    ;;
"appconf" )
    echo -n "Installing applications configs..."
    syncd rofi polybar nvim i3 mc
    echo " ${bld}${green}+${reset}"
    ;;
* )
    show_usage
    ;;
esac
shift
done

# Releasing traps
trap - SIGINT SIGQUIT SIGTSTP
exit 0
