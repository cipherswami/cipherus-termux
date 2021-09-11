#! /data/data/com.termux/files/usr/bin/bash

# The is cipher's Termux configurations:

if [ ! -d ~/.termux ]; then

    clear
    echo " "
    echo " [!] Your are on older version of Termux !!!"
    echo "     Please update and re run the Installation"
    exit;
fi

clear

## Pre variable initiations ##
Dev=1

if [[ Dev == 0 ]]; then
    export BRANCH=main
else
    export BRANCH=development
fi

###   Downloading installation Libraries   ###

if [[ ! -f cipherus-libraries.sh ]]; then
curl -Os https://raw.githubusercontent.com/name-is-cipher/cipherus-termux/$BRANCH/cipherus-libraries.sh
fi

source cipherus-libraries.sh

###################### main ##########################

### Termux bashrc ###
banner_cipherusprime
termux_bashrc
check_tbin
echo " "
echo " Press ENTER to continue ..."
read
#####################

### Termux Extra keys ###
banner_cipherusprime
termux_extra-keys
echo " "
echo " Press ENTER to continue ..."
read
########################

### Termux sshd ###
banner_cipherusprime
termux_sshd
echo " "
echo " Press ENTER to continue ..."
read
##################

### Termux's Root User ###
banner_cipherusprime
install_termux-rootuser
echo " "
echo " Press ENTER to continue ..."
read
exit
##########################

### Boot nethunter ###
# banner_cipherusprime
# install_boot-nethunter
# echo " "
# echo " Press ENTER to continue ..."
# read
######################

### Termux superuser ###
# banner_cipherusprime
# install_termux-superuser
# echo " "
# echo " Press ENTER to continue ..."
# read
########################

### Storage API ###
banner_cipherusprime
storage_api
echo " "
echo " Press ENTER to continue ..."
read
###################

##### cleaning #####
banner_cipherusprime
clean_cipherus
####################

# Succssful Installation Screen
echo " "
echo " [*] Successfully configured Termux, as per "
echo "     cipher's configruation..."
echo " "
echo " [!] Termux needs to be restarted, for installation"
echo "     to work properly, Please restart !!!"
echo " "
read