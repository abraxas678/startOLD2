#!/bin/bash
echo ">>>>  sudo apt install aptitude   ON ALL MACHINES FIRST  <<<<"
ansible-playbook playbook.yml -i inventory.yaml -u abraxas $@
