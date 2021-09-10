#! /data/data/com.termux/files/usr/bin/bash

clear
echo 
echo -ne "\r [!] Cleaning all cipherus Termux configs ."
sleep 1

if [ -d ~/.termux/bin ]; then
    rm -rf ~/.termux/bin
fi

if [ -f ~/.bashrc ]; then
    rm ~/.bashrc
fi

echo -ne "\r [!] Cleaning all cipherus Termux configs .."
sleep 1

if [ -f /data/data/com.termux/files/usr/bin/hid-gadget-test ]; then
    rm /data/data/com.termux/files/usr/bin/hid-gadget-test
fi

wget -q https://github.com/name-is-cipher/name-is-cipher/raw/main/assets/termux.properties.txt
cat termux.properties.txt > ~/.termux/termux.properties
rm termux.properties.txt

echo -ne "\r [!] Cleaning all cipherus Termux configs ..." 
sleep 1 

if [ -f ~/.wget-hsts ]; then
    rm ~/.wget-hsts
fi

echo 
echo " [*] Clean successfull !!!"
echo 
