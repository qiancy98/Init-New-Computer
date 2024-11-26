# Encoding: GB2312
# Please use admin ps.

Write-Host "��ǰʱ�䣺$(Get-Date)"
$startTime = Get-Date

# �޸ĵ�Դ�ƻ�
# ref: https://blog.csdn.net/2301_76933862/article/details/134466523
# ref�� https://www.bilibili.com/opus/768284686445182981
# �޸� �����\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\{GUID}\Attributes��ֵΪ2������ʾ��Щ����
# | ��Դ�ƻ����� | GUID | ˵�� |
# | --- | --- | --- |
# | ���������ܺ��ķ�����С�������� | 0cc5b647-c1df-4637-891a-dec35c318583 |  |
# | ���������Ƶ�� | 54533251-82be-4824-96c1-47b60b740d00 | |
# | ��1�ദ������ԴЧ�ʵĴ��������Ƶ�� | 75b0ae3f-bce0-45a7-8c89-c9611c25e101 | |
# | ��С������״̬ | 893dee8e-2bef-41e0-89c6-b55d0929964c | |
# | ��1�ദ������ԴЧ�ʵ���С������״̬ | 893dee8e-2bef-41e0-89c6-b55d0929964d | |
# | �������״̬ | bc5038f7-23e0-4960-96da-33abaf5935ec | |
# | ��1�ദ������ԴЧ�ʵ��������״̬ | bc5038f7-23e0-4960-96da-33abaf5935ed | |
# | ���������ܺ��ķ������������� | ea062031-0e34-4ff1-9b6d-eb1059334028 | ���������������ʹ�ö��ٸ������� |


# ����Ҽ��˵�
# ref: https://blog.csdn.net/qq_34769162/article/details/117068877

# VS Code

$vscodePath = "$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe"

# [�ļ���]����Ҽ��˵�: VS Code���ļ���

Set-Location Registry::HKEY_CLASSES_ROOT
New-Item -Name "Directory\shell\VSCode" -Force
Set-Location Registry::HKEY_CLASSES_ROOT\Directory\shell\VSCode
# ����ͼ��
New-ItemProperty -Name "Icon" -Value "$vscodePath" -PropertyType String -Force .
# ������ʾ����
New-ItemProperty -Name "MUIVerb" -Value "ʹ�� VS Code ��" -PropertyType String -Force .
# ����λ��: �ö�
New-ItemProperty -Name "Position" -Value "Top" -PropertyType String -Force .
# ��������
New-Item -Name "command" -Force -Value """$vscodePath"" ""%1"""

# [�ļ��пհ״�]����Ҽ��˵�: VS Code���ļ���

Set-Location Registry::HKEY_CLASSES_ROOT
New-Item -Name "Directory\Background\shell\VSCode" -Force
Set-Location Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\VSCode
# ����ͼ��
New-ItemProperty -Name "Icon" -Value "$vscodePath" -PropertyType String -Force .
# ������ʾ����
New-ItemProperty -Name "MUIVerb" -Value "ʹ�� VS Code ��" -PropertyType String -Force .
# ����λ��: �ö�
New-ItemProperty -Name "Position" -Value "Top" -PropertyType String -Force .
# ��������
New-Item -Name "command" -Force -Value """$vscodePath"" ""%V"""

# [�ļ�]����Ҽ��˵�: VS Code���ļ�

Set-Location Registry::HKEY_CLASSES_ROOT
New-Item -Name "*\shell\VSCode" -Force
Set-Location -LiteralPath Registry::HKEY_CLASSES_ROOT\*\shell\VSCode # ʹ�� -LiteralPath ����������·���е������ַ���ת��
# ����ͼ��
New-ItemProperty -Name "Icon" -Value "$vscodePath" -PropertyType String -Force .
# ������ʾ����
New-ItemProperty -Name "MUIVerb" -Value "ʹ�� VS Code ��" -PropertyType String -Force .
# ��������
New-Item -Name "command" -Force -Value """$vscodePath"" ""%1"""

$endTime = Get-Date
$duringTime = $endTime - $startTime
Write-Output "��ʱ��$($duringTime.TotalMinutes)����"

pause