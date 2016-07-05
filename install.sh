#!/bin/bash
declare -r GITHUB_REPO="moos-ivp/pablo-dotfiles"

if ! [[ $(whoami) == student ]]; then
    echo "You are logged in as $(whoami). Please create a student user:"
    echo "$ sudo adduser --system --shell /bin/bash --group student\n"
    echo "$ echo \"student:student\" | chpasswd\n"
    exit 1
fi

if ! (command -v 'git' &> /dev/null); then

    sudo apt-get install git-core -y

fi

git clone https://github.com/$GITHUB_REPO ~/.dotfiles
cd ~/.dotfiles

bash conf.sh
