#!/bin/bash
echo
read -p "is this a WSL? (y/n)" MY_WSL
[[ ! $MY_HOSTNAME ]] && read -p "new hostname: >>> " MY_HOSTNAME

if [[ $MY_WSL = "y" ]]; then
# https://www.srccodes.com/change-hostname-ubuntu-microsoft-windows-subsystem-for-linux-wsl-wsl2-wsl-conf-unable-resolve-hosts-name-service-not-known-list-running-shutdown-vm-srccodes/
echo "ORIGINAL HOSTNAME: $(hostname)"
echo "$(hostname)" >$HOME/ORIGINAL_HOSTNAME
sudo touch /etc/wsl.conf
sudo echo "[network]" >>/etc/wsl.conf
sudo echo "hostname = $MY_HOSTNAME" >>/etc/wsl.conf
sudo echo "generateHosts = false" >>/etc/wsl.conf
echo; echo "sed on: /etc/hosts"
sudo sed -i "s/$(cat $HOME/ORIGINAL_HOSTNAME)/$MY_HOSTNAME/g" /etc/hosts
echo
sudo cat /ets/wsl.conf
echo
sudo cat /etc/hosts
echo ">>> now reboot <<<"
read me
else
sudo nano /etc/hostname
sudo nano /etc/hosts
echo ">>> now reboot <<<"
read me
fi
