#!/bin/bash

alias vi='vi -u ~/vimfiles/vimrc'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias l='ls -lrtahF'
alias ..='cd ..'
alias ...='cd ..;cd ..'
if uname -a | grep MINGW > /dev/null; then
    alias gt='go test -run'
else
    ip=$(ifconfig | grep -w inet | awk '{ print $2 }' | sed 's/addr://' | grep -v 127.0.0.1 | grep -v ^172\. | grep -v ^10\. | head -n1 )

    if [ -z "$ip" ]; then
        ip=$(ifconfig | grep -w inet | awk '{ print $2 }' | sed 's/addr://' | grep -v 127.0.0.1 | grep -v ^172\. |  head -n1 )
    fi

    if [ -z "$ip" ]; then
        ip=$(ifconfig | grep -w inet | awk '{ print $2 }' | sed 's/addr://' | grep -v 127.0.0.1 |  head -n1 )
    fi
fi

#wan_ip=$(ifconfig | grep inet | head -n2 | tail -n1 | cut -d":" -f2 | awk '{print $1}' )
#lan_ip=$(ifconfig | grep inet | head -n1 | cut -d":" -f2 | awk '{print $1}' )

PS1='\[\033[01;32m\]\u@$ip\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \j\$ '

ulimit -c unlimited
if uname | grep Linux; then
    ulimit -n 1000000
fi
