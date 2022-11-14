#!/bin/bash
clear
echo "v0.5a"
mkdir $HOME/tmp >/dev/null 2>/dev/null
cd $HOME/tmp
rm $HOME/tmp/start-b.sh* -f
wget http://ionos:8027/start/start-b.sh >/dev/null 2>/dev/null
chmod +x $HOME/tmp/*.sh
echo
echo "Manual steps:"
echo "============="
echo
echo sudo apt update && curl -fsSL https://tailscale.com/install.sh | sh
echo
echo https://login.tailscale.com/admin/machines #modify name
echo
echo sudo apt get install -y aptitude && /bin/bash $HOME/tmp/start-b.sh
echo
echo

