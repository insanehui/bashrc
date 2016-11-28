#!/bin/bash

# 备份原有的.bashrc
if [ -e ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.bak
fi

# 生成新的.bashrc
cat << EOF > ~/.bashrc
. ~/bashrc/guanghui.sh
EOF

# 初始化vim
git clone https://github.com/insanehui/vimfiles.git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

