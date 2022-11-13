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
[[ ! -d $HOME/tmp ]] && mkdir $HOME/tmp
#read -p "hostname: >> " MY_HOSTNAME
#sleep 2
sudo apt update
[[ $(git --version) != *"git version"* ]] && sudo apt install -y git curl -y
cd $HOME/tmp
rm -rf $HOME/tmp/start
git clone https://github.com/abraxas678/start.git

#curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --ssh
echo
tailscale ip
tailscale status
echo
$HOME/tmp/start/check_user.sh

if [[ $(hostname) != *"$MY_HOSTNAME"* ]]; then
  $HOME/tmp/start/change-hostname.sh
fi
sudo apt update && sudo apt upgrade -y

mkdir $HOME/tmp/unison
cd $HOME/tmp/unison
wget https://github.com/bcpierce00/unison/releases/download/v2.52.1/unison-v2.52.1+ocaml-4.04.2+x86_64.linux.tar.gz
sudo mv bin/uni* /usr/bin
sudo apt get install git -y
cd start
chmod +x *.sh
./pueue-setup.sh
./install_brew_original.sh 
./install_brew_original2.sh 
./apt-install.sh
