#!/bin/bash
# Jekyll Installer For Bash On Ubuntu On Windows 10
# By Patrick Wu
# Based On:http://biserkov.com/blog/2016/06/04/Steps-to-install-Jekyll-on-Ubuntu-on-Windows/
red=`tput setaf 1`
green=`tput setaf 2`
cyan=`tput setaf 6`
bold=`tput bold`
reset=`tput sgr0`
echo "${cyan}******************************************"
echo "*                                        *"
echo "*           ${bold}Jekyll Installation${reset}${cyan}          *"
echo "*    ${bold}For Bash On Ubuntu On Windows 10${reset}${cyan}    *"
echo "*              ${bold}By Patrick Wu${reset}${cyan}             *"
echo "*                                        *"
echo "******************************************"
echo ""
echo "Based On:"
echo "http://biserkov.com/blog/2016/06/04/"
echo "Steps-to-install-Jekyll-on-Ubuntu-on-Windows/"
echo ""
echo "${red}*****************${bold}WARNING!${reset}${red}*****************"
echo "Before running this script, you have to:"
echo ""
echo "1.Make sure you have not apt-get install jekyll;"
echo "2.Make sure you have not apt-get install ruby;"
echo "3.Don’t run jekyll with –watch - inotify is"
echo "  not (yet) working properly, Please use"
echo "  the command 'jek' instead.${reset}"
echo ""
echo "Select the following option:"
echo "------------------------------------------"
echo "n:Normal Install(With Ruby 2.3)"
echo "np:Install With Pagination(With Ruby 2.3)"
echo "e:Exit"
echo "------------------------------------------"
read -p ">" option
if [ "${option}" == "n" ] || [ "${option}" == "np" ]; then
    echo "${green}Add repository to apt-get...${reset}"
    sudo apt-add-repository ppa:brightbox/ruby-ng
    echo "${green}Updating apt-get...${reset}"
    sudo apt-get update
    echo "${green}Installing ruby...${reset}"
    sudo apt-get install ruby2.3 ruby2.3-dev -y
    echo "${green}Updating gem...${reset}"
    sudo gem update --system
    echo "${green}Installing build-essential...${reset}"
    sudo apt-get install build-essential --no-install-recommends -y
    echo "${green}Installing Jekyll...${reset}"
    sudo gem install jekyll
    if [ "${option}" == "np" ]; then
        echo "${green}Installing Pagination...${reset}"
        sudo gem install jekyll-paginate
    fi
    echo "${green}Updating .bashrc...${reset}"
    echo "alias jek='jekyll serve --force_polling --incremental'" >> ~/.bashrc
    echo ""
    echo "${cyan}******************************************"
    echo "You have successfully installed Jekyll."
    echo "${bold}ruby version${reset}${cyan}:`ruby -v`"
    echo "${bold}jekyll version${reset}${cyan}:`jekyll -v`${reset}"   
else
    echo "${red}operation cancelled.${reset}"
fi
