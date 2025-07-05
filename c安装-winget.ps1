# Encoding: GB2312
# Please use admin ps.

Write-Host "当前时间：$(Get-Date)"
$startTime = Get-Date

# winget 换源
# https://unicom.mirrors.ustc.edu.cn/help/winget-source.html
winget source remove winget
winget source add winget https://mirrors.ustc.edu.cn/winget-source

# winget Tab补全
# ref: https://learn.microsoft.com/zh-cn/windows/package-manager/winget/tab-completion
# 将 ./其他脚本/安装/WinGet/winget Tab补全.ps1 内容追加到 $PROFILE
Get-Content -Path "./其他脚本/安装/WinGet/winget Tab补全.ps1" -Raw | Add-Content -Path $PROFILE

# winget 允许代理
winget settings --enable ProxyCommandLineOptions

winget import -i "./其他脚本/安装/WinGet/winget-packages.json"

# 安装软件 (需要代理)

# 安装Microsoft程序
winget install --proxy http://localhost:10808 -e --id Microsoft.PowerToys
winget install --proxy http://localhost:10808 -e --id Microsoft.PowerShell

# 安装GNU程序
winget install --proxy http://localhost:10808 -e --id Git.Git

# PDF相关
winget install --proxy http://localhost:10808 -e --id JohnMacFarlane.Pandoc
winget install --proxy http://localhost:10808 -e --id PDFsam.PDFsam

# 刷新环境变量
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Git配置
mkdir "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
Copy-Item ".\其他脚本\安装\Git\zh_cn.msg"       "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.gitconfig" -Target ".\其他脚本\安装\Git\win.gitconfig"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\indentconfig.yaml" -Target ".\其他脚本\安装\Miktex\indentconfig.yaml"

# Python配置
py -m pip config set global.index-url https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple
# pip config set global.index-url https://mirrors.aliyun.com/pypi/simple # 临时
py -m pip install --upgrade pip # --force-reinstall
# 我的Python环境
py -m pip install -r ".\其他脚本\安装\python-requirements.txt"
# gpt-academic
py -m pip install -r "D:\Program Files\gpt-academic\requirements.txt"

# Perl配置
# Perl主要用作LaTeX编译
# latexindent依赖YAML::Tiny
cpan YAML::Tiny

$endTime = Get-Date
$duringTime = $endTime - $startTime
Write-Output "总计耗时：$($duringTime.TotalMinutes)分钟"
pause