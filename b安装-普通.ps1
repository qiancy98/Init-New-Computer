# Encoding: GB2312

# Please use normal ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

# MikTeX����
#winget install -e --id ChristianSchenk.MiKTeX
& "D:\Program Files\~��װ��\01 LaTeX������\basic-miktex-21.02-x64.exe" --auto-install=yes --unattended
Wait-Process basic-miktex-21.02-x64
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
mpm --set-repository=https://mirrors.sjtug.sjtu.edu.cn/ctan/systems/win32/miktex/tm/packages/
Write-Output "MiKTeX: ���������..."
mpm --update
Write-Output "MiKTeX: ��װʣ�������..."
mpm --require=@".\�����ű�\��װ\MiKTeX-packages.txt"
Write-Output "MiKTeX: ����û��ļ���..."
initexmf --register-root="D:\Google �ƶ�Ӳ��\����\30 Latex\ȫ�ֿɼ����"
initexmf --update-fndb
Write-Output "MiKTeX: �����..."
