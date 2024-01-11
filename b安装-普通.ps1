# Encoding: GB2312

# Please use normal ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

# MikTeX����
winget install -e --id MiKTeX.MiKTeX
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
mpm --set-repository=https://mirrors.sjtug.sjtu.edu.cn/ctan/systems/win32/miktex/tm/packages/
Write-Output "MiKTeX: ���������..."
miktex packages update-package-database
miktex packages update
Write-Output "MiKTeX: ��װʣ�������..."
# TODO: �ļ�������: ".\�����ű�\��װ\MiKTeX-packages.txt"
# miktex packages require --package-id-file=".\�����ű�\��װ\MiKTeX-packages.txt"
Write-Output "MiKTeX: ����û��ļ���..."
initexmf --register-root="D:\Google �ƶ�Ӳ��\����\30 Latex\ȫ�ֿɼ����"
initexmf --update-fndb
# miktex fndb refresh
Write-Output "MiKTeX: �����..."
