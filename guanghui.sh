#!/bin/bash

alias vi='vim'
alias l='ls -lrtahF'
alias ..='cd ..'
alias ...='cd ..;cd ..'

wan_ip=$(ifconfig | grep inet | head -n2 | tail -n1 | cut -d":" -f2 | awk '{print $1}' )
lan_ip=$(ifconfig | grep inet | head -n1 | cut -d":" -f2 | awk '{print $1}' )
export bashrc='/etc/profile.d/guanghui.sh'

PS1='\[\033[01;32m\]\u@$wan_ip\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \j\$ '

ulimit -c unlimited
ulimit -n 1000000

