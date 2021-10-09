# Encoding: GB2312

# Please use admin ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

Write-Output "请确认已经打开全局代理^_^"
pause

# Set-ExecutionPolicy AllSigned
# set HTTP_PROXY=http://localhost:10809

# 安装winget
& "D:\Program Files\~安装包\33 微软软件\winget v1.0.appxbundle"

# 软件包安装
& ".\其他脚本\安装\软件包安装.ps1"

# 安装可选功能: 无线显示器
Add-WindowsCapability -Online -Name App.WirelessDisplay*

# 安装可选功能: WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
# dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce -Name "SetWSLVersion" -PropertyType String -Value "wsl --set-default-version 2"

# 更新帮助
Update-Help

# 安装GNU程序
winget install -e --id GnuWin32.Make
winget install -e --id Git.Git
winget install -e --id 7zip.7zip

# 安装VS Code
winget install -e --id  Microsoft.VisualStudioCode
# Copy-Item ".\其他脚本\安装\Code\syncing.json" "$env:APPDATA\Code\User\"

# winget install -e --id Mathpix.MathpixSnippingTool # 安装时会卡住，故不用

# PDF相关
winget install -e --id JohnMacFarlane.Pandoc
winget install -e --id PDFsam.PDFsam
winget install -e --id TikzEdt.TikzEdtBeta

# 编译器
winget install -e --id Python.Python
winget install -e --id StrawberryPerl.StrawberryPerl

# 文件云同步
winget install -e --id Nutstore.Nutstore

# 可选/图片
# winget install -e --id Inkscape.Inkscape
# winget install -e --id ImageMagick.ImageMagick
# winget install -e --id ArtifexSoftware.GhostScript
# 需要改名。此处链接也需更改。
# copy "C:\Program Files\ImageMagick-7.0.10-Q16\convert.exe" "C:\Program Files\ImageMagick-7.0.10-Q16\imgconvert.exe"


# 软件配置 config
# 刷新环境变量
# Update-SessionEnvironment # 安装choco后可使用
[System.Environment]::SetEnvironmentVariable("Path", [System.Environment]::GetEnvironmentVariable("Path","User") + ";D:\Program Files\全局路径文件夹", "User")
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 复制文件
# -recurse 可以用来递归复制; 若目标文件夹不存在, 则创建之.
# $env:USERPROFILE = C:\User\<User Name>
# $env:APPDATA     = C:\User\<User Name>\AppData\Roaming
mkdir "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
Copy-Item ".\其他脚本\安装\Git\zh_cn.msg"       "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
Copy-Item ".\其他脚本\安装\Git\win.gitconfig"   "$env:USERPROFILE\.gitconfig"
Copy-Item ".\其他脚本\安装\Miktex\indentconfig.yaml" "$env:USERPROFILE\"
Copy-Item ".\其他脚本\安装\FreeFileSync\*"      "$env:APPDATA\FreeFileSync\"                           -recurse
mkdir "$env:USERPROFILE\Desktop\快捷方式\"
Copy-Item "D:\Program Files\~快捷方式\*"        "$env:USERPROFILE\Desktop\快捷方式\"                   -recurse
# Copy-Item "D:\Program Files\~安装包\22 文件下载 μTorrent\3.5.5\utorrent.lng" "$env:APPDATA\uTorrent\"

# Python配置
py -m pip config set global.index-url https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple
py -m pip install --upgrade pip # --force-reinstall
# Jupyter
py -m pip install jupyter numpy sympy # scipy matplotlib
# Wolfram
# ref: https://reference.wolfram.com/language/WolframClientForPython/docpages/install.html
py -m pip install wolframclient
# 判断字符集编码: chardet (python自带)

# Perl配置
# Perl主要用作LaTeX编译
# latexindent依赖YAML::Tiny
cpan YAML::Tiny

# For Windows 11
# Get-AppxPackage -Name "MicrosoftWindows.Client.WebExperience" -AllUsers | Remove-AppxPackage -AllUsers