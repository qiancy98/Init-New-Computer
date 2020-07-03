# Encoding: GB2312

# Please use normal ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

# 复制文件
# -recurse 可以用来递归复制; 若目标文件夹不存在, 则创建之.
# $env:USERPROFILE = C:\User\<User Name>
# $env:APPDATA     = C:\User\<User Name>\AppData\Roaming
Copy-Item ".\其他脚本\安装\Git\.gitconfig"      "$env:USERPROFILE\"
mkdir "$env:APPDATA\jupyter\kernels\wolframlanguage12\"
Copy-Item ".\其他脚本\安装\Jupyter\kernel.json" "$env:APPDATA\jupyter\kernels\wolframlanguage12\"      -recurse
Copy-Item ".\其他脚本\安装\FreeFileSync\*"      "$env:APPDATA\FreeFileSync\"                           -recurse
mkdir "$env:USERPROFILE\Desktop\快捷方式\"
Copy-Item "D:\Program Files\~快捷方式\*"        "$env:USERPROFILE\Desktop\快捷方式\"                   -recurse

# MikTeX配置
winget install -e --id ChristianSchenk.MiKTeX
mpm --repository=http://mirrors.sjtug.sjtu.edu.cn/ctan/systems/win32/miktex/tm/packages/
mpm --update
Write-Output "Updating MiKTeX..."
mpm --require=@".\其他脚本\安装\MiKTeX-packages.txt"
Write-Output "Finished..."
