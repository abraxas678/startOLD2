#!/bin/bash
clear
echo "
- apt update
- check user
- check hostname
- apt update & upgrade
- unison
- pueue
- brew setup
- apt install
- dotfiles
"
### USER -INPUT
read -p "hostname: >> " MY_HOSTNAME
read -p "is this a WSL?: >> " MY_WSL

sudo apt update
curl -L check-user.yyps.de | bash
if [[ $(hostname) != *"$MY_HOSTNAME"* ]]; then
  [[ $MY_WSL = "y" ]] &&  $HOME/bin/change-hostname-wsl.sh            
fi
