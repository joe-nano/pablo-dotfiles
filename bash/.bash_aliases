#!/bin/bash

# ----------------------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..'

# ----------------------------------------------------------------------

alias c='clear'
alias ch='history -c && > ~/.bash_history'
alias g='git'
alias m='man'
alias md='mkdir -p'
alias :q='exit'
alias q='exit'
# alias rm='rm -rf'

# ----------------------------------------------------------------------
# Advanced Packaging Tool

alias apti='sudo apt install'
alias aptr='sudo apt remove'
alias apts='sudo apt-cache search'
alias aptu='sudo apt update \
             && sudo apt full-upgrade'

# ----------------------------------------------------------------------
# Empty Trash

alias empty-trash='rm -rf ~/.local/share/Trash/files/*'

# ----------------------------------------------------------------------
# Get local IP

alias local-ip="ifconfig | \
                | grep 'inet addr' \
                | grep -v '127.0.0.1' \
                | cut -d: -f2 \
                | cut -d' ' -f1"

# ----------------------------------------------------------------------
# Update

alias u='sudo apt update \
            && sudo apt full-upgrade'

# ----------------------------------------------------------------------
# Default that comes w/ xubuntu
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -Ah'
alias l='ls -CFh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Lock the screen
alias afk='i3lock -c 000000'

