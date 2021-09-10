#! /data/data/com.termux/files/usr/bin/bash

# This adds extra Row of keys to Termux
# Needs Resatart of Termux !!!

function check_update() {

if [ ! -d ~/.termux ]; then

    clear
    echo " "
    echo " [!] Your are on older version of Termux !!!"
    echo "     Updating Termux...."
    sleep 4
    apt update
    clear
    echo " [!] if 'y/n' prompted any, hit -> y"
    sleep 5
    apt upgrade -y
    apt install wget -y
    clear
    echo " "
    echo " [*] You need to completly restart the termux, "
    echo "     And start the installation again !!!"
    echo " "
    exit;
fi

}

check_update

if [ ! -f cipherus-libraries.sh ]; then
wget -q https://github.com/name-is-cipher/name-is-cipher/raw/main/cipherus-libraries.sh
fi

source cipherus-libraries.sh

clear

termux_extra-keys

clean_cipherus

echo " "
echo " [!] Termux needs to be restarted, for installation"
echo "     to work properly, Please restart !!!"
echo " "
read
