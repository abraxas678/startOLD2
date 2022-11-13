#!/bin/bash
clear
#echo "v0.5"
mkdir $HOME/tmp >/dev/null 2>/dev/null
cd $HOME/tmp
wget http://ionos:8027/start/start-b.sh >/dev/null 2>/dev/null
chmod +x $HOME/tmp/*.sh
echo
echo "  $HOME/tmp/start-b.sh     "
echo
echo
