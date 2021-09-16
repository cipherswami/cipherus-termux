    function bashrc() {
        echo "### This is cipher's bashrc configuration ###" > ~/bashrc
        echo "# termux prompt" >> ~/bashrc
        echo >> ~/bashrc
        echo "color_prompt=yes" >> ~/bashrc
        echo  >> ~/bashrc
        echo "if [[ $(whoami) == u0_a379 ]]; then" >> ~/bashrc
        echo "    user=raphaelin" >> ~/bashrc
        echo "    device=MiPhone" >> ~/bashrc
        echo "else" >> ~/bashrc
        echo "    user=termux" >> ~/bashrc
        echo "    device=localhost" >> ~/bashrc
        echo "fi" >> ~/bashrc
        echo "if [ "\$color_prompt" = yes ]; then" >> ~/bashrc
        echo "    prompt_color='\[\033[;32m\]'" >> ~/bashrc
        echo "    info_color='\[\033[1;34m\]'" >> ~/bashrc
        echo "    prompt_symbol=👽" >> ~/bashrc
        echo "    if [ "\$EUID" -eq 0 ]; then # Change prompt colors for root user" >> ~/bashrc
        echo "            prompt_color='\[\033[;94m\]'" >> ~/bashrc
        echo "            info_color='\[\033[1;31m\]'" >> ~/bashrc
        echo "            prompt_symbol=💀" >> ~/bashrc
        echo "            user=root" >> ~/bashrc
        echo "    fi" >> ~/bashrc
        # echo "    PS1=\$prompt_color'┌──('\$info_color'\${user}\${prompt_symbol}\${device}'\$prompt_color')-[\[\033[0;1m\]echo "\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] ' " >> ~/bashrc
        echo "fi" >> ~/bashrc
        echo "unset color_prompt force_color_prompt" >> ~/bashrc
        echo "" >> ~/bashrc
        echo "" >> ~/bashrc
        echo "# aliases" >> ~/bashrc
        echo "" >> ~/bashrc
        echo "alias lsa="ls -AlF"" >> ~/bashrc
        echo "alias ll="ls -l"" >> ~/bashrc
    }

read -p "Enter Prompt User Name: " User_Name
echo 
read -p "Enter Prompt Device Name: " Device_Name
echo
bashrc $User_Name $Device_Name