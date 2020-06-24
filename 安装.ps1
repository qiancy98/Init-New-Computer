# Encoding: GB2312

# Please use admin ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy Unrestricted -Scope Process

Set-ExecutionPolicy AllSigned
# set HTTP_PROXY=http://localhost:10809

# ��װwinget
& "D:\Program Files\~��װ��\33 ΢�����\winget v0.1.appxbundle"

.\��װ���ֶ���.ps1

# ��װ��ѡ����: ������ʾ��
Add-WindowsCapability -Online -Name App.WirelessDisplay*

# ��װ��ѡ����: WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
# dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# ���°���
Update-Help

# ��װGNU����
winget install -e --id GnuWin32.Make
winget install -e --id Git.Git
winget install -e --id 7zip.7zip

# ��װ�����
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Mathpix.MathpixSnippingTool

# PDF���
winget install -e --id JohnMacFarlane.Pandoc
winget install -e --id PDFsam.PDFsam

# ������
winget install -e --id Python.Python
winget install -e --id StrawberryPerl.StrawberryPerl
winget install -e --id ChristianSchenk.MiKTeX

# ��ѡ/ͼƬ
# winget install -e --id Inkscape.Inkscape
# winget install -e --id ImageMagick.ImageMagick
# winget install -e --id ArtifexSoftware.GhostScript
# ��Ҫ�������˴�����Ҳ����ġ�
# copy "C:\Program Files\ImageMagick-7.0.10-Q16\convert.exe" "C:\Program Files\ImageMagick-7.0.10-Q16\imgconvert.exe"

# ���û�������
[environment]::SetEnvironmentvariable("Path",[environment]::GetEnvironmentvariable("Path", "User")+";C:\Program Files\Python38\Scripts", "User")

# ˢ�»�������
RefreshEnv

# �����ļ�
Copy-Item ".\�����ű�\��װ\msgs" "C:\Program Files\Git\mingw64\share\git-gui\lib\" -recurse

# Git����
git config --global user.email "q-young@qq.com"
git config --global user.name "QianCY"
git config --global core.editor "code --wait"
git config --global credential.helper "wincred"
git config --global gui.encoding "utf-8"
git config --global gui.tabsize 4

# Python����
py -m pip --proxy http://127.0.0.1:10809 install --upgrade pip # --force-reinstall
# Jupyter
py -m pip --proxy http://127.0.0.1:10809 install jupyter numpy sympy # scipy matplotlib
# Wolfram
# ref: https://reference.wolfram.com/language/WolframClientForPython/docpages/install.html
py -m pip --proxy http://127.0.0.1:10809 install wolframclient
# QQ bot
py -m pip --proxy http://127.0.0.1:10809 install nonebot xlrd
# �ж��ַ�������
# ��֪���Ƿ�ϵͳ�Դ�������ע��
# py -m pip --proxy http://127.0.0.1:10809 install chardet

# Perl����
# Perl��Ҫ����LaTeX����
cpan Log::Dispatch::File
cpan YAML::Tiny
cpan File::HomeDir
cpan Unicode::GCString
cpan Log::Log4perl
# If failed, pls use "cpan -fi Log::Log4perl".
