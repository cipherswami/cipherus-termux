# This functions are part of cipherus tool installations
# After installation if you still see this file.
# The package might have been broken. Please contact, the creator.

# Author ->
# Aravind Swami [github: name-is-cipher]
# Twitter: name_is_cipher
# Mail: aravindswami135@gmail.com

## Funtions ##

# Pre Process Functions

function banner_cipherusprime() {

    blue='\033[1;34m'
    light_cyan='\033[1;96m'
    reset='\033[0m'

    clear
    printf "    ${blue}#####################################\n"
    printf "    ${blue}##                                 ##\n"
    printf "    ${blue}##        Cipherus Termux          ##\n"
    printf "    ${blue}##                                 ##\n"
    printf "    ${blue}#####################################\n"
    printf "    ${blue}  |||||||  ${light_cyan}name-is-cipher  ${blue}|||||||\n"
    printf "    ${blue}-------------------------------------${reset}"
    echo " "
    echo " "

}

function ynprompt() {

    echo " "
    read -p "$1 (y/n): " Replay

    while [ true ]; do
        if [ "$Replay" = "Y" ] || [ "$Replay" = "y" ]; then
            Replay=1
            return 0
        elif [ "$Replay" = "N" ] || [ "$Replay" = "n" ]; then
            Replay=0
            return 0
        fi
        read -p "$1, only (y/n): " Replay
        echo " "
    done

}

function clean_cipherus() {

    if [ -f cipherus-libraries.sh ]; then
        rm cipherus-libraries.sh
    fi
}


function ibar {
    # This ibar function is taken from stackoverflow
    # And modified according to ciperus needs.
    FILE=$1
    BAR='##############################'
    FILL='------------------------------'
    Lines=$2  # To No. lines in file that need to be present.
    barLen=30 # Bar Lenght of progressbar.
    count=1

    if [[ $3 -ne 0 ]]; then
        tm=$(awk "BEGIN {print $3/1000}")
    else
        tm=0.1
    fi

    echo " "
    # --- iterate over lines in of passed on file --- #
    while IFS=, read -r line; do
    # update progress bar
    sleep $tm
    count=$(($count + 1))
    percent=$((($count * 100 / $Lines * 100) / 100))
    i=$(($percent * $barLen / 100))
    echo -ne "\r[${BAR:0:$i}${FILL:$i:barLen}] $count/$Lines ($percent %)"
    done < $FILE
    echo " "

    # Integrity checker
    if [ $percent != 100 ]; then
        echo " "
        echo " [!] File is corrupt, Please try to reinstall !!!"
        echo " "
        echo " If you keep seeing this error, contact the Author:-"
        echo " "
        echo " Github: name-is-cipher"
        echo " Twitter: name_is_cipher"
        echo " Mail: aravindswami135@gmail.com"
        clean_cipherus
        read
        exit
    fi

    echo " "
    echo " "

}

# Main Installation Functions

function termux_bashrc() {

    echo " [*] Configuring bashrc ..."
    echo " "
    
    if [[ -f ~/.bashrc ]]; then
        echo "[!] There is already a .bashrc file exists,"
        echo " by installing Termux bashrc, your old. bashrc"
        echo " file will be backed up as bashrc.bak"
        echo " "
        ynprompt " [#] Do you want to install"
        echo " "

        if [[ $Replay == "1" ]]; then
            mv ~/.bashrc ~/.bashrc.bak
        elif [[ $Replay == "0" ]]; then
            clear
            banner_cipherusprime
            echo " [&] Skipped Termux bashrc keys"
            echo " "
            return 0
        fi 

    fi

    curl -Os https://raw.githubusercontent.com/name-is-cipher/cipherus-termux/$BRANCH/assets/bashrc.txt
    read -p "Enter User Name Prompt: " User_Name
    read -p "Enter Device Name Prompt: " Device_Name
    sed -i 's/DefaultPrompt/TermuxPrompt/' bashrc.txt
    sed -i 's/UserName/$User_Name/' bashrc.txt
    sed -i 's/DeviceName/$Device_Name/' bashrc.txt
    mv bashrc.txt ~/.bashrc 

    if [ -d ~/.termux/bin ]; then
        echo >> ~/.bashrc
        echo "# This PATH is for Termux superuser bin folder" >> ~/.bashrc
        echo "export PATH=\$PATH:/data/data/com.termux/files/home/.termux/bin" >> ~/.bashrc
        ibar ~/.bashrc 42
    else
        ibar ~/.bashrc 39
    fi

    if [[ (cat ~/.bashrc | grep Mail) == "# Mail: aravindswami135@gmail.com"]]; then
        echo " [*] Successfully Configured bashrc"
        echo " "
    else
        echo " [!] Installation unsuccessful,"
        echo "     due to some reason."

}

function check_tbin() {

    if [ ! -d ~/.termux/bin ]; then
        
        mkdir ~/.termux/bin
        echo >> ~/.bashrc
        echo "# This PATH is for Termux superuser bin folder" >> ~/.bashrc
        echo "export PATH=\$PATH:/data/data/com.termux/files/home/.termux/bin" >> ~/.bashrc

    fi

}

function termux_extra-keys() {

    echo " "
    echo " [*] Adding Termux Extra Keys !!!"
    echo " "

    if [[ -f ~/.termux/termux.properties ]]; then
        echo "[!] There is already one version found,"
        echo " by installing this Termux Extra keys"
        echo " old one will be removed."
        ynprompt " [#] Do you want to install"
        echo " "

        if [[ $Replay == "1" ]]; then
            rm ~/.termux/termux.properties
        elif [[ $Replay == "0" ]]; then
            clear
            banner_cipherusprime
            echo " [&] Skipped Termux extra keys"
            echo " "
            return 0
        fi  

    fi

    curl -Os https://raw.githubusercontent.com/name-is-cipher/cipherus-termux/$BRANCH/assets/termux.properties.txt
    ibar ~/.termux/termux.properties 92
    mv termux.properties.txt ~/.termux/termux.properties


    if [[ (cat ~/.termux/termux.properties | grep Mail) == "# Mail: aravindswami135@gmail.com"]]; then
        echo " "
        echo " > Successfully added extra Keys to Termux !!!"
        echo " "
    else
        echo " "
        echo " [!] Installation unsuccessful,"
        echo "     due to some reason."
    fi

}

function termux_sshd() {

    echo " "
    echo " [*] Installing sshd !!!"
    echo " "
    sleep 2
    apt install openssh -y
    sleep 1
    clear
    banner_cipherusprime
    echo " > Set the Passwaord for current user,"
    echo "   in order to Login to ssh..."
    echo " "
    passwd
    echo " "
    echo " > Successfully installed sshd !!!"
    echo " "
    echo "   -> start : $ sshd"
    echo "   -> stop  : $ pkill sshd"
    echo " "

}

function install_termux-rootuser() {

    echo " [*] Installing Termux's Root User..."
    echo " "
    sleep 2
    apt install tsu -y

    if [[ ! -d ~/.suroot ]]; then
        mkdir ~/.suroot
    fi

    if [[ ! -f ~/.bashrc ]]; then
        curl -os ~/.bashrc https://raw.githubusercontent.com/name-is-cipher/cipherus-termux/$BRANCH/assets/bashrc.txt
    fi

    if [ ! -f ~/.suroot/.bashrc ]; then
        cp ~/.bashrc ~/.suroot/
    fi

    echo " "
    echo " [*] Installation successful !!!"
    echo " "
    echo "> Run 'tsu' anywhere to start Termux's Root User."
    echo " "

}

function install_boot-nethunter() {

    echo " [*] Installing Boot Nethunter ..."
    echo " "

    if [[ -f ~/.termux/bin/boot-kali.sh ]]; then
        echo "[!] There is already one version installed,"
        echo " removing and reinstalling the latest ..."   
        rm -f ~/.termux/bin/boot-kali.sh
    fi

    # This one fetches the latest version boot-kali.sh
    # You can check source code at: https://github.com/name-is-cipher/boot-nethunter

    curl -Os https://raw.githubusercontent.com/name-is-cipher/boot-nethunter/$BRANCH/assets/boot-kali.sh
    mv boot-kali.sh ~/.termux/bin
    chmod +x ~/.termux/bin/boot-kali.sh
    ibar ~/.termux/bin/boot-kali.sh 30

    if [[ (cat ~/.termux/bin/boot-kali.sh | grep Mail) == "# Mail: aravindswami135@gmail.com"]]; then
        echo " "
        echo " [*] Installation successful !!!"
        echo " "
        echo "> Run 'boot-kali.sh' anywhere to start Kali Chroot."
        echo " "
    else
        echo " "
        echo " [!] Installation unsuccessful,"
        echo "     due to some reason."
    fi

}

function install_termux-superuser() {

    echo " [*] Installing Termux superuser ..."
    echo " "

    if [[ -f ~/.termux/bin/xsu.sh ]]; then
        echo "[!] There is already one version installed," 
        echo " removing and reinstalling the latest ..."
        rm -f ~/.termux/bin/xsu.sh
    fi

    # This one fetches the latest version xsu.sh
    # You can check source code at: https://github.com/name-is-cipher/termux-superuser

    curl -Os https://raw.githubusercontent.com/name-is-cipher/termux-superuser/$BRANCH/assets/xsu.sh
    mv xsu.sh ~/.termux/bin
    chmod +x ~/.termux/bin/xsu.sh
    ibar ~/.termux/bin/xsu.sh 10

    if [[ (cat ~/.termux/bin/xsu.sh | grep Mail) == "# Mail: aravindswami135@gmail.com"]]; then
        echo " "
        echo " [*] Installation successful !!!"
        echo " "
        echo "> Run 'xsu' anywhere to start Termux Superuser."
        echo " "
    else
        echo " "
        echo " [!] Installation unsuccessful,"
        echo "     due to some reason."
    fi

}

function storage_api() {

    echo " [*] Connecting Phones storage to Termux..."
    echo " "
    sleep 2
    termux-setup-storage
    sleep 2
    ln -s /storage/emulated/999/ ~/storage/DualStorage

    if [[ -d ~/storage ]]; then
        echo " "
        echo " [*] Installation successful !!!"
        echo " "
        echo "> Phone storage is now linked to sdcard"
        echo " "
    else
        echo " "
        echo " [!] There was some problem"
        echo "     linking storage."
    fi



}