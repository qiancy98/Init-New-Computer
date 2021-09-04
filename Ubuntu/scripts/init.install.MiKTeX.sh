#!/usr/bin/bash
# 运行命令前打印
set -x

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
# echo "deb http://miktex.org/download/ubuntu "$(lsb_release -cs)" universe" | sudo tee /etc/apt/sources.list.d/miktex.list
echo "deb https://mirrors.sjtug.sjtu.edu.cn/CTAN/systems/win32/miktex/setup/deb "$(lsb_release -cs)" universe" | sudo tee /etc/apt/sources.list.d/miktex.list
sudo apt-get update
sudo apt-get install miktex --assume-yes
miktexsetup finish
initexmf --set-config-value [MPM]AutoInstall=1
initexmf --register-root="/mnt/d/Google 云端硬盘/资料/30 Latex/全局可见宏包"
initexmf --update-fndb

# 创建软链接，这样Windows中就可以直接使用。
sudo ln --symbolic ~/bin/latexmk /usr/local/bin/
sudo ln --symbolic ~/bin/xelatex /usr/local/bin/
sudo ln --symbolic ~/bin/bibtex  /usr/local/bin/
sudo ln --symbolic ~/bin/xdvipdfmx  /usr/local/bin/
sudo ln --symbolic ~/bin/extractbb  /usr/local/bin/
sudo ln --symbolic ~/bin/biber  /usr/local/bin/
