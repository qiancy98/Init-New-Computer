# Encoding: GB2312

# Please use normal ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

# �����ļ�
# -recurse ���������ݹ鸴��; ��Ŀ���ļ��в�����, �򴴽�֮.
# $env:USERPROFILE = C:\User\<User Name>
# $env:APPDATA     = C:\User\<User Name>\AppData\Roaming
Copy-Item ".\�����ű�\��װ\Git\.gitconfig"      "$env:USERPROFILE\"
mkdir "$env:APPDATA\jupyter\kernels\wolframlanguage12\"
Copy-Item ".\�����ű�\��װ\Jupyter\kernel.json" "$env:APPDATA\jupyter\kernels\wolframlanguage12\"      -recurse
Copy-Item ".\�����ű�\��װ\FreeFileSync\*"      "$env:APPDATA\FreeFileSync\"                           -recurse
mkdir "$env:USERPROFILE\Desktop\��ݷ�ʽ\"
Copy-Item "D:\Program Files\~��ݷ�ʽ\*"        "$env:USERPROFILE\Desktop\��ݷ�ʽ\"                   -recurse

# MikTeX����
winget install -e --id ChristianSchenk.MiKTeX
mpm --repository=http://mirrors.sjtug.sjtu.edu.cn/ctan/systems/win32/miktex/tm/packages/
mpm --update
Write-Output "Updating MiKTeX..."
mpm --require=@".\�����ű�\��װ\MiKTeX-packages.txt"
Write-Output "Finished..."
