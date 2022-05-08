#!/bin/bash

echo "Updating zsh autosuggestions"
cd /home/azriel/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git pull
echo "Updating zsh syntax highlighting"
cd /home/azriel/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git pull
echo "Updating zsh powerlevel10k"
cd /home/azriel/.oh-my-zsh/custom/themes/powerlevel10k
git pull

echo "run 'p10k configure' to reconfigure powerlevel10k"

#doesn't actually work - p10k is not a proper command but a script
#echo -n "Update powerlevel10k (y/n)?"
#read VAR
#
#if [[ $VAR = "y" ]] || [[ $VAR = "Y" ]]
#then
#    p10k configure
#fi
