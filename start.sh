#!/bin/bash
clear
echo "v0.5a"
mkdir $HOME/tmp >/dev/null 2>/dev/null
cd $HOME/tmp
rm $HOME/tmp/start-b.sh* -f
wget http://ionos:8027/start/start-b.sh >/dev/null 2>/dev/null
chmod +x $HOME/tmp/*.sh
echo
echo "  $HOME/tmp/start-b.sh     "
echo
echo

