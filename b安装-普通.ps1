# Encoding: GB2312

# Please use normal ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

# MikTeX配置
#winget install -e --id ChristianSchenk.MiKTeX
& "D:\Program Files\~安装包\01 LaTeX编译器\basic-miktex-2.9.7219-x64.exe" --auto-install=yes --unattended
Pause
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
mpm --set-repository=https://mirrors.sjtug.sjtu.edu.cn/ctan/systems/win32/miktex/tm/packages/
Write-Output "MiKTeX: 升级软件包..."
mpm --update
Write-Output "MiKTeX: 安装剩余软件包..."
mpm --require=@".\其他脚本\安装\MiKTeX-packages.txt"
Write-Output "MiKTeX: 已完成..."
