# Encoding: GB2312
# Please use admin ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

Write-Host "当前时间：$(Get-Date)"
$startTime = Get-Date

# 打开代理
& "D:\Program Files\VPN\v2rayN-With-Core\v2rayN.exe"

# todo: Start-Process -NoNewWindow

# 以非管理员身份运行./b安装-普通.ps1
Start-Process PowerShell -ArgumentList "-File ./b安装-普通.ps1" -Verb RunAsUser

# 以管理员身份运行./d注册表配置.ps1
Start-Process PowerShell -ArgumentList "-File ./d注册表配置.ps1" -Verb RunAs

# 软件包安装
& "D:\Program Files\~安装包\23 数据备份 FreeFileSync\FreeFileSync_13.1_Windows_Setup.exe"

# 以管理员身份运行./c安装-winget.ps1
Start-Process PowerShell -ArgumentList "-File ./c安装-winget.ps1" -Verb RunAs

# 更新帮助 Update-Help
# 使用新进程运行, 方便并行
Start-Process PowerShell -ArgumentList "-Command Update-Help" -Verb RunAs

# 安装可选功能: 无线显示器
Add-WindowsCapability -Online -Name App.WirelessDisplay*

# 安装可选功能: WSL
# ref: https://docs.microsoft.com/zh-cn/windows/wsl/install
wsl --install Ubuntu-22.04

# 软件配置 config
# 刷新环境变量
# Update-SessionEnvironment # 安装choco后可使用
[System.Environment]::SetEnvironmentVariable("Path", [System.Environment]::GetEnvironmentVariable("Path","User") + ";D:\Program Files\全局路径文件夹", "User")
New-Item -ItemType SymbolicLink -Path "D:\Program Files\全局路径文件夹" -Name make.exe -Target "C:\Program Files (x86)\GnuWin32\bin\make.exe"

# 复制文件
# -recurse 可以用来递归复制; 若目标文件夹不存在, 则创建之.
# $env:USERPROFILE  = C:\User\<User Name>
# $env:APPDATA      = C:\User\<User Name>\AppData\Roaming
# $env:LOCALAPPDATA = C:\User\<User Name>\AppData\Local
mkdir "$env:APPDATA\FreeFileSync\"
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\FreeFileSync\GlobalSettings.xml" -Target ".\其他脚本\安装\FreeFileSync\GlobalSettings.xml"
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\FreeFileSync\LastRun.ffs_gui"    -Target ".\其他脚本\安装\FreeFileSync\LastRun.ffs_gui"
Copy-Item -recurse ".\其他脚本\安装\ssh" "$env:USERPROFILE\.ssh" # 好像SSH禁止用软链接了, 还要求必须只有当前用户有权限
mkdir "$env:USERPROFILE\Desktop\快捷方式\"
Copy-Item "D:\Program Files\~快捷方式\*"        "$env:USERPROFILE\Desktop\快捷方式\"                   -recurse
# Copy-Item "D:\Program Files\~安装包\22 文件下载 μTorrent\3.5.5\utorrent.lng" "$env:APPDATA\uTorrent\"

# For Windows 11
# Get-AppxPackage -Name "MicrosoftWindows.Client.WebExperience" -AllUsers | Remove-AppxPackage -AllUsers

$endTime = Get-Date
$duringTime = $endTime - $startTime
Write-Output "总计耗时：$($duringTime.TotalMinutes)分钟"