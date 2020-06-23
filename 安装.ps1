# Please use admin ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy Unrestricted -Scope Process

Set-ExecutionPolicy AllSigned
# set HTTP_PROXY=http://localhost:10809

# 安装winget
& "D:\Program Files\~安装包\33 微软软件\winget v0.1.appxbundle"

.\安装（手动）.ps1

# 安装可选功能: 无线显示器
Add-WindowsCapability -Online -Name App.WirelessDisplay*

# 安装可选功能: WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
# dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# 更新帮助
Update-Help

# 安装GNU程序
winget install -e --id GnuWin32.Make
winget install -e --id Git.Git
winget install -e --id 7zip.7zip

# 安装诸程序
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Mathpix.MathpixSnippingTool

# PDF相关
winget install -e --id JohnMacFarlane.Pandoc
winget install -e --id PDFsam.PDFsam

# 编译器
winget install -e --id Python.Python
winget install -e --id StrawberryPerl.StrawberryPerl
winget install -e --id ChristianSchenk.MiKTeX

# 可选/图片
# winget install -e --id Inkscape.Inkscape
# winget install -e --id ImageMagick.ImageMagick
# winget install -e --id ArtifexSoftware.GhostScript
# 需要改名。此处链接也需更改。
# copy "C:\Program Files\ImageMagick-7.0.10-Q16\convert.exe" "C:\Program Files\ImageMagick-7.0.10-Q16\imgconvert.exe"

# 设置环境变量
[environment]::SetEnvironmentvariable("Path",[environment]::GetEnvironmentvariable("Path", "User")+";C:\Program Files\Python38\Scripts", "User")

# 刷新环境变量
RefreshEnv

# Git配置
git config --global user.email "q-young@qq.com"
git config --global user.name "QianCY"
git config --global core.editor "code --wait"
git config --global credential.helper "wincred"
git config --global gui.encoding "utf-8"
git config --global gui.tabsize 4

# Python配置
py -m pip --proxy http://127.0.0.1:10809 install --upgrade pip # --force-reinstall
# Jupyter
py -m pip --proxy http://127.0.0.1:10809 install jupyter numpy sympy # scipy matplotlib
# Wolfram
# ref: https://reference.wolfram.com/language/WolframClientForPython/docpages/install.html
py -m pip --proxy http://127.0.0.1:10809 install wolframclient
# QQ bot
py -m pip --proxy http://127.0.0.1:10809 install nonebot xlrd
# 判断字符集编码
# 不知道是否系统自带所以先注释
# py -m pip --proxy http://127.0.0.1:10809 install chardet

# Perl配置
# Perl主要用作LaTeX编译
cpan Log::Dispatch::File
cpan YAML::Tiny
cpan File::HomeDir
cpan Unicode::GCString
cpan Log::Log4perl
# If failed, pls use "cpan -fi Log::Log4perl".
