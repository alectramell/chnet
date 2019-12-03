#!/bin/bash

clear

bash speed.sh

clear

paper=$(tput smso)
bold=$(tput bold)
black=$(tput setaf 0)
white=$(tput setaf 7)
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 6)
sky=$(tput setaf 153)
gold=$(tput setaf 3)
yellow=$(tput setaf 190)
purple=$(tput setaf 5)
reset=$(tput sgr0)

IPADDR=$(curl -s ipinfo.io/ip)
REGION=$(curl -s ipinfo.io/region)
LOCATE=$(curl -s ipinfo.io/loc)
CHSTAT=$(curl -s https://raw.githubusercontent.com/alectramell/chnet/master/netcode)

mv speedstats.txt? speedstats.txt

if [ "$CHSTAT" == "76656761" ]
then
	echo "Your Connection to the WORLD-WIDE-WEB is ACTIVE" > ../$(date +%d-%m-%Y-%S.netlog)
	echo "Your Network-Sub-IP-Address is directed to you by $IPADDR" >> ../$(date +%d-%m-%Y-%S.netlog)
	echo "Your Network-Speed was measured at $(cat speedstats.txt) kbps (kilobytes per second)" >> ../$(date +%d-%m-%Y-%S.netlog)
	echo "Your Network-Region is located in $REGION" >> ../$(date +%d-%m-%Y-%S.netlog)
	echo "Your Network-Base-Coordinates are $LOCATE" >> ../$(date +%d-%m-%Y-%S.netlog)

	echo "${bold}${black}Your ${white}Connection${black} to the ${gold}world-wide-web${black} is ${green}ACTIVE${reset}"
	echo "${bold}${black}Your ${white}Network-Sub-IP-Address${black} is directed to you by ${green}$IPADDR${reset}"
	echo "${bold}${black}Your ${white}Network-Speed${black} was measured at ${green}$(cat speedstats.txt) kbps ${white}(kilobytes per second)${reset}"
	echo "${bold}${black}Your ${white}Network-Region${black} is located in ${gold}$REGION${reset}"
	echo "${bold}${black}Your ${white}Network-Base-Coordinates${black} are ${green}$LOCATE${reset}"
	echo "${bold}${black}Press ${red}[ANY-KEY] ${black}to exit..${reset}"
	sleep 2.5
else
	echo "Your Connection to the WORLD-WIDE-WEB is INACTIVE" > ../$(date +%d-%m-%Y-%S.netlog)
	echo "Your Network-Sub-IP-Address is UNKNOWN" >> ../$(date +%d-%m-%Y-%S.netlog)
	echo "Your Network-Speed was measured at 0.00 kbps (kilobytes per second)" >> ../$(date +%d-%m-%Y-%S.netlog)
	echo "Your Network-Region is UNKNOWN" >> ../$(date +%d-%m-%Y-%S.netlog)
	echo "Your Network-Base-Coordinates are UNKNOWN" >> ../$(date +%d-%m-%Y-%S.netlog)

	echo "${bold}${black}Your ${white}connection${black} to the ${gold}world-wide-web${black} is ${red}INACTIVE${reset}"
	echo "${bold}${black}Your ${white}Network-Speed${black} was measured at ${red}0.00 kbps ${white}(kilobytes per second)${reset}"
	echo "${bold}${black}Press ${red}[ANY-KEY] ${black}to exit..${reset}"
	sleep 2.5
fi

read -s -n1

clear

rm speedstats.txt
rm speeder.tmp

clear
