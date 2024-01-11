# Encoding: GB2312

# Please use normal ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

# MikTeX配置
winget install -e --id MiKTeX.MiKTeX
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
mpm --set-repository=https://mirrors.sjtug.sjtu.edu.cn/ctan/systems/win32/miktex/tm/packages/
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
