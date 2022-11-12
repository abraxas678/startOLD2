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
sudo apt update
curl -L check-user.yyps.de | bash
