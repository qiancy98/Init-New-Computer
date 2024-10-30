# Encoding: GB2312

# Please use admin ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

Write-Host "当前时间：$(Get-Date)"
Write-Output "请确认关闭全局代理^_^"
pause
$startTime = Get-Date

# Set-ExecutionPolicy AllSigned
# set HTTP_PROXY=http://localhost:10809

# 软件包安装
# & ".\其他脚本\安装\软件包安装.ps1"
& "D:\Program Files\~安装包\23 数据备份 FreeFileSync\FreeFileSync_13.1_Windows_Setup.exe"
& "D:\Program Files\~安装包\31 腾讯软件\QQ9.9.1.15820_x64.exe"

# 安装可选功能: 无线显示器
Add-WindowsCapability -Online -Name App.WirelessDisplay*

# 更新帮助
Update-Help

# 安装可选功能: WSL
# ref: https://docs.microsoft.com/zh-cn/windows/wsl/install
wsl --install

# winget 换源
# https://unicom.mirrors.ustc.edu.cn/help/winget-source.html
winget source remove winget
winget source add winget https://mirrors.ustc.edu.cn/winget-source

# 安装Microsoft程序
winget install -e --id Microsoft.DotNet.DesktopRuntime.8 # vpn软件要用 # 有bug

# 安装GNU程序
winget install -e --id GnuWin32.Make
winget install -e --id 7zip.7zip
winget install -e --id mbuilov.sed

# 安装VS Code
winget install -e --id Microsoft.VisualStudioCode

# 字节跳动
winget install -e --id ByteDance.Doubao

# 安装腾讯软件
# winget install -e --id Tencent.QQ
winget install -e --id Tencent.WeChat
winget install -e --id Tencent.QQMusic
winget install -e --id Tencent.QQPlayer
winget install -e --id Tencent.TencentMeeting

# 阿里千牛
winget install -e --id Alibaba.AliWorkbench

# PDF相关
winget install -e --id TikzEdt.TikzEdtBeta
winget install -e --id Mathpix.MathpixSnippingTool

# 编译器
winget install -e --id Python.Python.3.12
winget install -e --id StrawberryPerl.StrawberryPerl
# winget install -e --id Anaconda.Miniconda3

# 文件云同步
winget install -e --id Nutstore.Nutstore

# 可选/图片
# winget install -e --id Inkscape.Inkscape
# winget install -e --id ImageMagick.ImageMagick
# winget install -e --id ArtifexSoftware.GhostScript
# 需要改名。此处链接也需更改。
# copy "C:\Program Files\ImageMagick-7.0.10-Q16\convert.exe" "C:\Program Files\ImageMagick-7.0.10-Q16\imgconvert.exe"

# proxy needed
Write-Output "现在，请打开全局代理^_^"
& "D:\Program Files\VPN\v2rayN-With-Core\v2rayN.exe"
$endTime = Get-Date
$duringTime = $endTime - $startTime
Write-Output "当前耗时：$($duringTime.TotalMinutes)分钟"
pause
$startTime = Get-Date

# 安装Microsoft程序
winget install -e --id Microsoft.PowerToys

# 安装GNU程序
winget install -e --id Git.Git

# PDF相关
winget install -e --id JohnMacFarlane.Pandoc
winget install -e --id PDFsam.PDFsam

$endTime = Get-Date
$duringTime = $endTime - $startTime + $duringTime
Write-Output "当前耗时：$($duringTime.TotalMinutes)分钟"
Write-Output "请确认关闭全局代理^_^"
pause
$startTime = Get-Date

# 软件配置 config
# 刷新环境变量
# Update-SessionEnvironment # 安装choco后可使用
[System.Environment]::SetEnvironmentVariable("Path", [System.Environment]::GetEnvironmentVariable("Path","User") + ";D:\Program Files\全局路径文件夹", "User")
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
New-Item -ItemType SymbolicLink -Path "D:\Program Files\全局路径文件夹" -Name make.exe -Target "C:\Program Files (x86)\GnuWin32\bin\make.exe"

# 复制文件
# -recurse 可以用来递归复制; 若目标文件夹不存在, 则创建之.
# $env:USERPROFILE  = C:\User\<User Name>
# $env:APPDATA      = C:\User\<User Name>\AppData\Roaming
# $env:LOCALAPPDATA = C:\User\<User Name>\AppData\Local
mkdir "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
Copy-Item ".\其他脚本\安装\Git\zh_cn.msg"       "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.gitconfig" -Target ".\其他脚本\安装\Git\win.gitconfig"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\indentconfig.yaml" -Target ".\其他脚本\安装\Miktex\indentconfig.yaml"
mkdir "$env:APPDATA\FreeFileSync\"
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\FreeFileSync\GlobalSettings.xml" -Target ".\其他脚本\安装\FreeFileSync\GlobalSettings.xml"
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\FreeFileSync\LastRun.ffs_gui"    -Target ".\其他脚本\安装\FreeFileSync\LastRun.ffs_gui"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.ssh" -Target ".\其他脚本\安装\ssh"
# Set-Service -Name ssh-agent -StartupType Manual # 设置允许启动ssh-agent
mkdir "$env:USERPROFILE\Desktop\快捷方式\"
Copy-Item "D:\Program Files\~快捷方式\*"        "$env:USERPROFILE\Desktop\快捷方式\"                   -recurse
# Copy-Item "D:\Program Files\~安装包\22 文件下载 μTorrent\3.5.5\utorrent.lng" "$env:APPDATA\uTorrent\"

# Python配置
py -m pip config set global.index-url https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple
# pip config set global.index-url https://mirrors.aliyun.com/pypi/simple # 临时
py -m pip install --upgrade pip # --force-reinstall
# Jupyter
# py -m pip install jupyter numpy sympy # scipy matplotlib
# 重建家园脚本
# py -m pip install requests
# for PIL
py -m pip install pillow
# gpt-academic
py -m pip install -r "D:\Program Files\gpt-academic\requirements.txt"
# Wolfram
# ref: https://reference.wolfram.com/language/WolframClientForPython/docpages/install.html
# py -m pip install wolframclient
# 判断字符集编码: chardet (python自带)

# Perl配置
# Perl主要用作LaTeX编译
# latexindent依赖YAML::Tiny
cpan YAML::Tiny

# 下次启动时运行
# New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce -Name "SetWSLVersion" -PropertyType String -Value "wsl --set-default-version 2"

# For Windows 11
# Get-AppxPackage -Name "MicrosoftWindows.Client.WebExperience" -AllUsers | Remove-AppxPackage -AllUsers

$endTime = Get-Date
$duringTime = $endTime - $startTime + $duringTime
Write-Output "总计耗时：$($duringTime.TotalMinutes)分钟"