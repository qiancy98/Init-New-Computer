#!/usr/bin/bash
# 运行命令前打印
set -x

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
echo "deb http://miktex.org/download/ubuntu "$(lsb_release -cs)" universe" | sudo tee /etc/apt/sources.list.d/miktex.list
sudo apt-get update
sudo apt-get install miktex --assume-yes
miktexsetup finish
initexmf --set-config-value [MPM]AutoInstall=1

# 创建硬链接，这样Windows中就可以直接使用。
sudo ln ~/bin/latexmk /usr/local/bin/
sudo ln ~/bin/xelatex /usr/local/bin/
sudo ln ~/bin/bibtex  /usr/local/bin/
sudo ln ~/bin/xdvipdfmx  /usr/local/bin/
