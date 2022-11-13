#!/bin/bash
clear
echo "v0.6"
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
sleep 1
### USER -INPUT
mkdir $HOME/tmp
cd $HOME/tmp
read -p "hostname: >> " MY_HOSTNAME
read -p "is this a WSL?: >> " MY_WSL

sleep 2
sudo apt update
sudo apt get install curl -y
curl -L https://tailscale/install.sh | bash
curl -L check-user.yyps.de | bash
if [[ $(hostname) != *"$MY_HOSTNAME"* ]]; then
  curl -L "change-hostname.yyps.de" >change-hostname.sh
  source change-hostname.sh
fi
sudo apt update && sudo apt upgrade -y

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
