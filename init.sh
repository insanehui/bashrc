#!/bin/bash

# TODO: 初始化的脚本，考虑一下，今后有没有必要用node来写？
# 现在暂时把本文件当作一个阅读文档来参考

# 备份原有的.bashrc
if [ -e ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.bak
fi

# 生成新的.bashrc
cat << EOF > ~/.bashrc
. ~/bashrc/guanghui.sh
EOF

# 初始化vim
git clone https://github.com/insanehui/vimfiles.git ~/vimfiles
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

