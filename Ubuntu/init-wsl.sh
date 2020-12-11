#!/bin/bash
# 运行命令前打印
set -x


# 更新文件
cp --recursive --verbose --update scripts/ ~/
cp             --verbose --update makefile ~/
cp             --verbose --update scripts/init.cp.bash_aliases ~/.bash_aliases
cp             --verbose --update scripts/init.cp.wsl.bash_aliases ~/.bash_aliases.WSL
cp             --verbose --update scripts/init.cp.gitconfig ~/.gitconfig
cp             --verbose --update scripts/.vimrc ~/.vimrc
# stop wsl from belling
echo "set bell-style none" > ~/.inputrc


# Update source
sudo cp --verbose scripts/init.cp.sources.list.$(lsb_release -cs) /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade --assume-yes --quiet --with-new-pkgs --auto-remove

# set lang to Chinese
sudo apt-get install language-pack-zh-hans --assume-yes --quiet
sudo update-locale LANG=zh_CN.UTF-8

# latex
bash ./scripts/init.apk.MiKTeX.sh

# Python
sudo apt-get install python3 python3-pip python-is-python3 --assume-yes --quiet
sudo apt-get install python3-scipy python3-matplotlib jupyter --assume-yes --quiet
	# dependence: python3-matplotlib -> python3-numpy

# C++
sudo apt-get install g++ gdb --assume-yes --quiet


# Windows交互文件夹. 当文件夹存在时，--parents抑制报错。
mkdir --parents ~/files


# 这些是虚拟机中用的程序
# cd scripts/ && sh init.apk.rescuetime
# cd scripts/ && sh init.apk.time