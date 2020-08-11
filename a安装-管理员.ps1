# Encoding: GB2312

# Please use admin ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

Write-Output "��ȷ���Ѿ���ȫ�ִ���^_^"
pause

# Set-ExecutionPolicy AllSigned
# set HTTP_PROXY=http://localhost:10809

# ��װwinget
& "D:\Program Files\~��װ��\33 ΢�����\winget v0.1.appxbundle"

# �������װ
& ".\�����ű�\��װ\�������װ.ps1"

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

# ��װVS Code
winget install -e --id Microsoft.VisualStudioCode
Copy-Item ".\�����ű�\��װ\Code\syncing.json" "$env:APPDATA\Code\User\"

# winget install -e --id Mathpix.MathpixSnippingTool # ��װʱ�Ῠס���ʲ���

# PDF���
winget install -e --id JohnMacFarlane.Pandoc
winget install -e --id PDFsam.PDFsam

# ������
winget install -e --id Python.Python
winget install -e --id StrawberryPerl.StrawberryPerl

# ��ѡ/ͼƬ
# winget install -e --id Inkscape.Inkscape
# winget install -e --id ImageMagick.ImageMagick
# winget install -e --id ArtifexSoftware.GhostScript
# ��Ҫ�������˴�����Ҳ����ġ�
# copy "C:\Program Files\ImageMagick-7.0.10-Q16\convert.exe" "C:\Program Files\ImageMagick-7.0.10-Q16\imgconvert.exe"


# ������� config
# ˢ�»�������
# Update-SessionEnvironment # ��װchoco���ʹ��
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# �����ļ�
# -recurse ���������ݹ鸴��; ��Ŀ���ļ��в�����, �򴴽�֮.
# $env:USERPROFILE = C:\User\<User Name>
# $env:APPDATA     = C:\User\<User Name>\AppData\Roaming
mkdir "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
Copy-Item ".\�����ű�\��װ\Git\zh_cn.msg"       "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
Copy-Item ".\�����ű�\��װ\Git\win.gitconfig"      "$env:USERPROFILE\.gitconfig"
mkdir "$env:APPDATA\jupyter\kernels\wolframlanguage12\"
Copy-Item ".\�����ű�\��װ\Jupyter\kernel.json" "$env:APPDATA\jupyter\kernels\wolframlanguage12\"
Copy-Item ".\�����ű�\��װ\FreeFileSync\*"      "$env:APPDATA\FreeFileSync\"                           -recurse
mkdir "$env:USERPROFILE\Desktop\��ݷ�ʽ\"
Copy-Item "D:\Program Files\~��ݷ�ʽ\*"        "$env:USERPROFILE\Desktop\��ݷ�ʽ\"                   -recurse
Copy-Item "D:\Program Files\~��װ��\22 �ļ����� ��Torrent\3.5.5\utorrent.lng" "$env:APPDATA\uTorrent\"

# Python����
py -m pip --proxy http://127.0.0.1:10809 install --upgrade pip # --force-reinstall
# Jupyter
py -m pip --proxy http://127.0.0.1:10809 install jupyter numpy sympy # scipy matplotlib
# Wolfram
# ref: https://reference.wolfram.com/language/WolframClientForPython/docpages/install.html
py -m pip --proxy http://127.0.0.1:10809 install wolframclient
# QQ bot
py -m pip --proxy http://127.0.0.1:10809 install nonebot xlrd
# �ж��ַ�������: chardet (python�Դ�)

# Perl����
# Perl��Ҫ����LaTeX����
cpan Log::Dispatch::File
cpan YAML::Tiny
cpan File::HomeDir
cpan Unicode::GCString
cpan -Ti Log::Log4perl
# Will fail 1 test, so have to 'f'orce install. 'T' forbids the tests. 
