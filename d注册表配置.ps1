# Encoding: GB2312

# Please use admin ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

Write-Host "��ǰʱ�䣺$(Get-Date)"

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
