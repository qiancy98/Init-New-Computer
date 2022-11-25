#!/usr/bin/bash
# 运行命令前打印
set -x

# 安装ruby
sudo apt-get install ruby-full build-essential -y # zlib1g-dev

# 添加根目录
echo '' >> ~/.bashrc
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# 更换gem源
# gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/

# 安装jekyll
gem install jekyll bundler

# 用来使jekyll支持UTF+8编码.
# 由于现在webrick已迁移至~/gems，本命令作废。
# 使用如下命令检查，似乎已修复编码问题。
# diff init.install.ruby.filehandler.rb ~/gems/gems/webrick-1.7.0/lib/webrick/httpservlet/filehandler.rb

# 更换bundle源
# 已经在"14\ 个人网页"中配置过了
# bundle config mirror.https://rubygems.org https://gems.ruby-china.com

# 编译网页以更至最新
echo "更新Ruby中，稍等约10分钟……"
cd /mnt/d/Google\ 云端硬盘/资料/14\ 个人网页/ && bundle install