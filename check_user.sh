#!/bin/bash
USER=$(whoami)
echo "#####################################################################"
echo "                      CHECKING USER DETAILS"
echo "#####################################################################"
echo; sleep 1
echo "CURRENT USER: $USER"
read -t 1 me
echo  >/home/abraxas/mysudo
[[ $USER != "abraxas" ]] && [[ ! $(id -u abraxas) ]] && adduser abraxas &&  passwd abraxas &&  usermod -aG sudo  abraxas && su abraxas
[[ $USER != "abraxas" ]] && su abraxas
[[ $USER != "abraxas" ]] && echo BUTTON && read me || read -t 1 me

sudo ls >/dev/null 2>/dev/null
