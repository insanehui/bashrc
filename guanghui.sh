#!/bin/bash

alias vi='vi -u ~/vimfiles/vimrc'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rm='rm -i'
alias l='ls -lrtahF'
alias ..='cd ..'
alias ...='cd ..;cd ..'

# git 相关
alias gh='git push'
alias gs='git status'

# docker相关
alias dk='docker'
alias dd='docker run -d --restart=always' #以服务运行，会覆盖linux原有的dd命令
alias dt='docker run -it --rm'
alias dlogs='docker logs -t'

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

# 如果有MSYSTEM，则认为是在windows git bash环境中
if [ $MSYSTEM ]; then
    PS1='\[\033[01;32m\]\u@$ip\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[36m\]`__git_ps1`\[\033[0m\]\$ '
else
    PS1='\[\033[01;32m\]\u@$ip\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \j\$ '
fi

function title() { 
  echo -ne "\033]0;${1}\007" 
}

ulimit -c unlimited
if uname | grep Linux; then
    ulimit -n 1000000
fi
