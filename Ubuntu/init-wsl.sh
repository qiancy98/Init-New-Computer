#!/bin/bash

# 输出当前时间
echo "脚本启动，当前时间：$(date)"

# 更新文件
echo "更新文件..."
cp --recursive --verbose --update scripts/ ~/
cp             --verbose --update makefile ~/
cp             --verbose --update scripts/init.cp.bash_aliases ~/.bash_aliases
cp             --verbose --update scripts/init.cp.wsl.bash_aliases ~/.bash_aliases.WSL
cp             --verbose --update scripts/init.cp.gitconfig ~/.gitconfig
cp             --verbose --update scripts/.vimrc ~/.vimrc
# stop wsl from belling
echo "set bell-style none" > ~/.inputrc
# Windows交互文件夹. 当文件夹存在时，--parents抑制报错。
mkdir --parents ~/files

# 设置权限为600 （文件夹700）
echo "设置文件权限..."
find ~/scripts -type f -exec chmod 600 {} \; -o -type d -exec chmod 700 {} \;
chmod 600 ~/makefile
chmod 600 ~/.bash_aliases
chmod 600 ~/.bash_aliases.WSL
chmod 600 ~/.gitconfig
chmod 600 ~/.vimrc
chmod 600 ~/.inputrc
chmod 700 ~/files

# 运行命令前打印
set -x

# Update source
sudo cp --verbose scripts/init.cp.sources.list.$(lsb_release -cs) /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade --assume-yes --quiet --with-new-pkgs --auto-remove

# set lang to Chinese
sudo apt-get install language-pack-zh-hans --assume-yes --quiet
sudo update-locale LANG=zh_CN.UTF-8

# Python
sudo apt-get install python3 python3-pip python-is-python3 --assume-yes --quiet
sudo apt-get install python3-matplotlib --assume-yes --quiet
	# dependence: python3-matplotlib -> python3-numpy, python3-scipy

# C++
sudo apt-get install g++ --assume-yes --quiet
# sudo apt-get install gdb --assume-yes --quiet

# LaTeX
bash ./scripts/init.install.MiKTeX.sh

# Jekyll
bash ./scripts/init.install.ruby.sh

echo "脚本终止，当前时间：$(date)"