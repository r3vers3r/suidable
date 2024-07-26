#!/bin/bash

# suidable, author r3vers3r (Telmo Edurza)

#colors

greenColor="\e[0;32m\033[1m"
endColor="\033[0m\e[0m"
redColor="\e[0;31m\033[1m"
blueColor="\e[0;34m\033[1m"
yellowColor="\e[0;33m\033[1m"
purpleColor="\e[0;35m\033[1m"
turquoiseColor="\e[0;36m\033[1m"
grayColor="\e[0;37m\033[1m"

#ctrl+c capture

trap ctrl_c INT

function ctrl_c(){
  echo -e "\n[!] Exiting...\n"
  tput cnorm; exit 1
}

#global variables

main_url="https://gtfobins.github.io"

#functions

function helpPanel(){
  echo -e "\n  #####  #     # ### ######     #    ######  #       ####### "
  sleep 0.05
  echo -e " #     # #     #  #  #     #   # #   #     # #       #       "
  sleep 0.05
  echo -e " #       #     #  #  #     #  #   #  #     # #       #       "
  sleep 0.05
  echo -e "  #####  #     #  #  #     # #     # ######  #       #####"
  sleep 0.05
  echo -e "       # #     #  #  #     # ####### #     # #       #       "
  sleep 0.05
  echo -e " #     # #     #  #  #     # #     # #     # #       #       "
  sleep 0.05
  echo -e "  #####   #####  ### ######  #     # ######  ####### ####### \n\n"
  sleep 0.05
  echo -e "CREATED BY: @r3vers3r (Telmo Edurza) - From the community for the community\n"
  echo -e "\t${purpleColor}[<3]${endColor}${turquoiseColor} THANKS:${endColor}${blueColor} Thanks from heart to ${endColor}${yellowColor}GTFOBINS (https://gtfobins.github.io/) creators Emilio Pinna / Andrea Cardaci and all collaborators ${endColor}${blueColor}for sharing with all of us such an amazing tool that was the starting point of this humble project${endColor}\n"
  echo -e "\t${purpleColor}[i]${endColor} ${turquoiseColor}GENERAL INFO: ${endColor}${yellowColor}SUIDABLE ${endColor}${blueColor}is a simple Bash script that is thought to be sent to a Linux victim machine once it is compromised and foothold is gained. ${endColor}${yellowColor}This tool checks on an automated way if any of the binaries that is present on the system and counts with an SUID bit set is included on GTFOBINS as a binary that might lead to a user pivoting or privilege escalation.${endColor}${blueColor} The aim of this tool is to save some precious time to its user. Time that would be otherwise lost checking each SUID binary one by one${endColor}\n"
  echo -e "\t${purpleColor}[!]${endColor} ${turquoiseColor}IMPORTANT ACTIONS: ${endColor}${blueColor}Make sure to always update the necessary using parameter ${endColor}${yellowColor}-u ${endColor}${blueColor}before every use to make sure the data collected on the system is up to date and matches the latest findings stored on GTFOBINS${endColor}\n"
  echo -e "\t${purpleColor}[*]${endColor} ${turquoiseColor}CYBERSECURITY TOOL ACKNOWLEDGEMENT: ${endColor}${blueColor}By using this cybersecurity tool, you acknowledge and agree to the following terms: ${endColor}${yellowColor}1. Responsible Use: ${endColor}${blueColor}This tool is intended for controlled environments, such as labs and agreed-upon penetration tests. You must use it responsibly and legally. ${endColor}${yellowColor}2. No Illicit Activities: ${endColor}${blueColor}The developer (me) is not responsible for any illicit or unauthorized use of this tool. You agree not to engage in any illegal activities. ${endColor}${yellowColor}3. Disclaimer: ${endColor}${blueColor}This tool is provided "as is," without warranties or guarantees. The developer disclaims any liability for damages, losses, or consequences arising from its use${endColor}\n"
  echo -e "\t${purpleColor}[·]${endColor} ${turquoiseColor}USAGE:${endColor}"
  echo -e "\t\t${purpleColor}-u${endColor} ${blueColor}Download or update necessary files${endColor}"
  echo -e "\t\t${purpleColor}-s${endColor} ${blueColor}Search if any of the binaries present on the victim system count with an SUID bit set that might lead to user pivoting or privilege escalation${endColor}"
  echo -e "\t\t${purpleColor}-h${endColor} ${blueColor}Show help panel${endColor}\n"
}

function updateFiles(){
  if [ ! -f gtfobins.html ]; then
    tput civis
    echo -e "\n${purpleColor}[+]${endColor}${blueColor} Downloading all necessary files...${endColor}\n"
    curl -s $main_url > gtfobins.html
    echo -e "\n${purpleColor}[+]${endColor}${blueColor} All necessary files have been downloaded successfully${endColor}"
    tput cnorm
  else
    tput civis
    echo -e "\n${purpleColor}[+]${endColor}${blueColor} Checking if all necessary files are up to date...${endColor}\n"
    curl -s $main_url > temp_gtfobins.html
    md5sum_old_value=$(md5sum gtfobins.html | awk '{print $1}')
    md5sum_temp_value=$(md5sum temp_gtfobins.html | awk '{print $1}')
    if [ "$md5sum_old_value" == "$md5sum_temp_value" ]; then
      echo -e "\n${purpleColor}[+]${endColor}${blueColor} All necessary files are up to date${endColor}\n"
        rm temp_gtfobins.html
    else
      echo -e "\n${purpleColor}[+]${endColor}${blueColor} Deprecated files will be updated${endColor}\n"
      sleep 1
      echo -e "\n${purpleColor}[+]${endColor}${blueColor} Deprecated files have been updated successfully\n"
      rm gtfobins.html && mv temp_gtfobins.html gtfobins.html
      tput cnorm
    fi
  fi
}

function suidMatcher(){ 
  tput civis
  echo -e "\n${purpleColor}[+]${endColor}${blueColor} Cheking if any of the binaries present on the current system counts with a binary SUID bit set that may lead to a user pivoting or privilege escalation...${endColor}\n"
  cat gtfobins.html | grep "suid" | awk "/aa-exec/,/zsoelim/" | grep -v "Limited" | cut -d '/' -f 3 > temp_vulnerable_suid.txt
  find /bin /sbin /usr/bin/ /usr/sbin /usr/local/bin -type f -perm -4000 | cut -d '/' -f 4 > temp_system_suid.txt
  suid_matcher="$(grep -x -Ff temp_vulnerable_suid.txt temp_system_suid.txt)"
  tput cnorm
  if [ $suid_matcher ]; then
    tput civis
    echo -e "\n${purpleColor}[+]${endColor}${greenColor} These are the binaries which are present on this system and count with an SUID bit set that may lead to user pivoting or privilege escalation :) (Please go check this binary on https://gtfobins.github.io for more info on how to use it with this purpose):${endColor}\n"
    grep -x -Ff temp_vulnerable_suid.txt temp_system_suid.txt
  else
    tput civis
    echo -e "\n${purpleColor}[+]${endColor}${redColor} No binaries on this system count with an SUID bit set that may lead to user pivoting or privilege escalation :(${endColor}\n"
    tput cnorm
    rm temp_system_suid.txt temp_vulnerable_suid.txt
  fi 2>/dev/null
fi
}

#menu

declare -i parameter_counter=0

while getopts "ush" arg; do
  case $arg in
    u) parameter_counter+=1;;
    s) parameter_counter+=2;;
    h) ;;
  esac
done

if [ $parameter_counter -eq 1 ]; then
  updateFiles
elif [ $parameter_counter -eq 2 ]; then
  suidMatcher
else
  helpPanel
fi
