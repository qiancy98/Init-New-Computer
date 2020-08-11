#!/bin/bash
# 运行命令前打印
set -x


# 更新文件
cp -r -v -u scripts/ ~/
cp    -v -u makefile ~/
cp    -v -u scripts/init.cp.aliases.bash_aliases ~/.bash_aliases
cp    -v -u scripts/init.cp.wsl.bash_aliases ~/.bash_aliases.WSL
cp    -v -u scripts/init.cp.gitconfig ~/.gitconfig
sudo cp -v -u scripts/vimrc /etc/vim/vimrc
# stop wsl from belling
echo "set bell-style none" > ~/.inputrc


# Update source
sudo cp -v -u scripts/init.cp.sources.list.$(lsb_release -cs) /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade --assume-yes --quiet --with-new-pkgs --auto-remove

# set lang to Chinese
sudo apt-get install language-pack-zh-hans --assume-yes --quiet
sudo update-locale LANG=zh_CN.UTF-8

# latex
sudo apt-get install texlive texlive-xelatex latexmk texlive-extra-utils texlive-lang-chinese --assume-yes --quiet
	# dependence: texlive-extra-utils FOR texliveonfly

# Python
sudo apt-get install python3 python3-pip python-is-python3 --assume-yes --quiet
sudo apt-get install python3-scipy python3-matplotlib jupyter --assume-yes --quiet
	# dependence: python3-matplotlib -> python3-numpy

# C++
sudo apt-get install g++ gdb --assume-yes --quiet


# Windows交互文件夹. 当文件夹存在时，-p抑制报错。
mkdir -p ~/files


# 这些是虚拟机中用的程序
# cd scripts/ && sh init.apk.rescuetime
# cd scripts/ && sh init.apk.time