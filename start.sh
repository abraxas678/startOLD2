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
sudo apt get install curl -y
curl -L check-user.yyps.de | bash
if [[ $(hostname) != *"$MY_HOSTNAME"* ]]; then
  curl -L "change-hostname.yyps.de" | bash
fi
sudo apt update && sudo apt upgrade -y

mkdir $HOME/tmp
mkdir $HOME/tmp/unison
cd $HOME/tmp/unison
wet https://github.com/bcpierce00/unison/releases/download/v2.52.1/unison-v2.52.1+ocaml-4.04.2+x86_64.linux.tar.gz
sudo mv bin/uni* /usr/bin
sudo apt get install git -y
cd $HOME/tmp
git clone https://github.com/abraxas678/start.git
cd start
chmod +x *.sh
./pueue-setup.sh
./install_brew_original.sh 
./install_brew_original2.sh 
./apt-install.sh
