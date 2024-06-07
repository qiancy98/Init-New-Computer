# Encoding: GB2312

# Please use normal ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

Write-Host "当前时间：$(Get-Date)"
$startTime = Get-Date

# 修改电源设置
Write-Output "修改电源设置……"
powercfg /change standby-timeout-ac 0 # 设置电脑不睡眠
powercfg /change hibernate-timeout-ac 0 # 设置电脑不休眠

# MikTeX配置
winget install -e --id MiKTeX.MiKTeX
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
# 暂时换成南大镜像
mpm --set-repository=https://mirrors.nju.edu.cn/CTAN/systems/win32/miktex/tm/packages/
# mpm --set-repository=https://mirrors.sjtug.sjtu.edu.cn/ctan/systems/win32/miktex/tm/packages/
Write-Output "MiKTeX: 升级软件包..."
miktex packages update-package-database
miktex packages update
Write-Output "MiKTeX: 安装剩余软件包..."
# TODO: 文件待更新: ".\其他脚本\安装\MiKTeX-packages.txt"
# miktex packages require --package-id-file=".\其他脚本\安装\MiKTeX-packages.txt"
Write-Output "MiKTeX: 添加用户文件夹..."
initexmf --register-root="D:\Google 云端硬盘\资料\30 Latex\全局可见宏包"
initexmf --update-fndb
# miktex fndb refresh
Write-Output "MiKTeX: 已完成..."

$endTime = Get-Date
$duringTime = $endTime - $startTime
Write-Output "耗时：$($duringTime.TotalMinutes)分钟"