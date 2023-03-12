#!/bin/bash

echo "Updating vimrc"
cd ~/.vim_runtime
git reset --hard
git clean -d --force
git pull --rebase
python update_plugins.py

echo "Updating zsh autosuggestions"
cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git pull
echo "Updating zsh syntax highlighting"
cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git pull
echo "Updating zsh powerlevel10k"
cd ~/.oh-my-zsh/custom/themes/powerlevel10k
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
