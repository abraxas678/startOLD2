#!/bin/bash
clear
echo "v0.8"
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
#sleep 2
#sudo apt update
[[ $(git --version) != *"git version"* ]] && sudo apt install -y git curl
cd $HOME/tmp
rm -rf $HOME/tmp/start
git clone https://github.com/abraxas678/start.git

#curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --ssh
echo
tailscale ip
tailscale status
echo
read -p BUTTON me
$HOME/tmp/start/check_user.sh
echo
read -p "hostname: >> " MY_HOSTNAME
echo MY_HOSTNAME $MY_HOSTNAME
echo
if [[ $(hostname) != *"$MY_HOSTNAME"* ]]; then
  $HOME/tmp/start/change-hostname.sh
fi
echo
sleep 5; read -p BUTTON me
sudo apt update && sudo apt upgrade -y

if [[ unison -version != *"2.52"* ]]; then
  mkdir $HOME/tmp/unison
  cd $HOME/tmp/unison
  wget https://github.com/bcpierce00/unison/releases/download/v2.52.1/unison-v2.52.1+ocaml-4.04.2+x86_64.linux.tar.gz
  sudo mv bin/uni* /usr/bin
fi

cd $HOME/tmp/start
chmod +x *.sh
./pueue-setup.sh
./install_brew_original.sh 
./install_brew_original2.sh 
./apt-install.sh
