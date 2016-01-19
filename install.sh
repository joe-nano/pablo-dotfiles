#!/bin/bash
declare -r GITHUB_REPO="msis/dotfiles"

if ! (command -v 'git' &> /dev/null); then 

    sudo apt-get install git-core -y

fi

git clone https://github.com/$GITHUB_REPO ~/.dotfiles
cd ~/.dotfiles

bash conf.sh 
