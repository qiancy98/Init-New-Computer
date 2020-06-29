# Encoding: GB2312

# Please use admin ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

echo "��ȷ���Ѿ���ȫ�ִ���^_^"
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


# ������� config
# ˢ�»�������
# Update-SessionEnvironment # ��װchoco���ʹ��
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# �����ļ�
# -recurse ���������ݹ鸴��; ��Ŀ���ļ��в�����, �򴴽�֮.
# $env:USERPROFILE = C:\User\<User Name>
# $env:APPDATA     = C:\User\<User Name>\AppData\Roaming
Copy-Item ".\�����ű�\��װ\Git\zh_cn.msg"       "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\" -recurse
Copy-Item ".\�����ű�\��װ\Git\.gitconfig"      "$env:USERPROFILE\"
Copy-Item ".\�����ű�\��װ\Code\syncing.json"   "$env:APPDATA\Code\User\"                              -recurse
Copy-Item ".\�����ű�\��װ\Jupyter\kernel.json" "$env:APPDATA\jupyter\kernels\wolframlanguage12\"      -recurse
Copy-Item ".\�����ű�\��װ\FreeFileSync\*"      "$env:APPDATA\FreeFileSync\"                           -recurse
Copy-Item "D:\Program Files\~��ݷ�ʽ\*"        "$env:USERPROFILE\Desktop\��ݷ�ʽ\"                   -recurse

# MikTeX����
mpm --repository=http://mirrors.sjtug.sjtu.edu.cn/ctan/systems/win32/miktex/tm/packages/
mpm --update
& ".\�����ű�\��װ\MiKTeX-packages.ps1"

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
