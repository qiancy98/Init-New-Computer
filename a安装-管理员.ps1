# Encoding: GB2312
# Please use admin ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

Write-Host "��ǰʱ�䣺$(Get-Date)"
$startTime = Get-Date

# �򿪴���
& "D:\Program Files\VPN\v2rayN-With-Core\v2rayN.exe"

# todo: Start-Process -NoNewWindow

# �Էǹ���Ա�������./b��װ-��ͨ.ps1
Start-Process PowerShell -ArgumentList "-File ./b��װ-��ͨ.ps1" -Verb RunAsUser

# �Թ���Ա�������./dע�������.ps1
Start-Process PowerShell -ArgumentList "-File ./dע�������.ps1" -Verb RunAs

# �������װ
& "D:\Program Files\~��װ��\23 ���ݱ��� FreeFileSync\FreeFileSync_13.1_Windows_Setup.exe"

# �Թ���Ա�������./c��װ-winget.ps1
Start-Process PowerShell -ArgumentList "-File ./c��װ-winget.ps1" -Verb RunAs

# ���°��� Update-Help
# ʹ���½�������, ���㲢��
Start-Process PowerShell -ArgumentList "-Command Update-Help" -Verb RunAs

# ��װ��ѡ����: ������ʾ��
Add-WindowsCapability -Online -Name App.WirelessDisplay*

# ��װ��ѡ����: WSL
# ref: https://docs.microsoft.com/zh-cn/windows/wsl/install
wsl --install Ubuntu-22.04

# ������� config
# ˢ�»�������
# Update-SessionEnvironment # ��װchoco���ʹ��
[System.Environment]::SetEnvironmentVariable("Path", [System.Environment]::GetEnvironmentVariable("Path","User") + ";D:\Program Files\ȫ��·���ļ���", "User")
New-Item -ItemType SymbolicLink -Path "D:\Program Files\ȫ��·���ļ���" -Name make.exe -Target "C:\Program Files (x86)\GnuWin32\bin\make.exe"

# �����ļ�
# -recurse ���������ݹ鸴��; ��Ŀ���ļ��в�����, �򴴽�֮.
# $env:USERPROFILE  = C:\User\<User Name>
# $env:APPDATA      = C:\User\<User Name>\AppData\Roaming
# $env:LOCALAPPDATA = C:\User\<User Name>\AppData\Local
mkdir "$env:APPDATA\FreeFileSync\"
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\FreeFileSync\GlobalSettings.xml" -Target ".\�����ű�\��װ\FreeFileSync\GlobalSettings.xml"
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\FreeFileSync\LastRun.ffs_gui"    -Target ".\�����ű�\��װ\FreeFileSync\LastRun.ffs_gui"
Copy-Item -recurse ".\�����ű�\��װ\ssh" "$env:USERPROFILE\.ssh" # ����SSH��ֹ����������, ��Ҫ�����ֻ�е�ǰ�û���Ȩ��
mkdir "$env:USERPROFILE\Desktop\��ݷ�ʽ\"
Copy-Item "D:\Program Files\~��ݷ�ʽ\*"        "$env:USERPROFILE\Desktop\��ݷ�ʽ\"                   -recurse
# Copy-Item "D:\Program Files\~��װ��\22 �ļ����� ��Torrent\3.5.5\utorrent.lng" "$env:APPDATA\uTorrent\"

# For Windows 11
# Get-AppxPackage -Name "MicrosoftWindows.Client.WebExperience" -AllUsers | Remove-AppxPackage -AllUsers

$endTime = Get-Date
$duringTime = $endTime - $startTime
Write-Output "�ܼƺ�ʱ��$($duringTime.TotalMinutes)����"