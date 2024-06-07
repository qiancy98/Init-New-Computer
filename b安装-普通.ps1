# Encoding: GB2312

# Please use normal ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

Write-Host "��ǰʱ�䣺$(Get-Date)"
$startTime = Get-Date

# �޸ĵ�Դ����
Write-Output "�޸ĵ�Դ���á���"
powercfg /change standby-timeout-ac 0 # ���õ��Բ�˯��
powercfg /change hibernate-timeout-ac 0 # ���õ��Բ�����

# MikTeX����
winget install -e --id MiKTeX.MiKTeX
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
# ��ʱ�����ϴ���
mpm --set-repository=https://mirrors.nju.edu.cn/CTAN/systems/win32/miktex/tm/packages/
# mpm --set-repository=https://mirrors.sjtug.sjtu.edu.cn/ctan/systems/win32/miktex/tm/packages/
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

$endTime = Get-Date
$duringTime = $endTime - $startTime
Write-Output "��ʱ��$($duringTime.TotalMinutes)����"