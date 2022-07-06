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

# 安装jekyll
gem install jekyll bundler

# 用来使yekyll支持UTF+8编码.
s=$(ruby -v)
sudo cp --verbose init.install.ruby.filehandler.rb /usr/lib/ruby/${s:5:5}/webrick/httpservlet/filehandler.rb

# 编译网页以更至最新
echo "更新Ruby中，稍等约10分钟……"
cd /mnt/d/Google\ 云端硬盘/资料/14\ 个人网页/ && bundle install