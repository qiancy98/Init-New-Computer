# Encoding: GB2312

# Please use admin ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

Write-Output "��ȷ�Ϲر�ȫ�ִ���^_^"
pause

# Set-ExecutionPolicy AllSigned
# set HTTP_PROXY=http://localhost:10809

# �������װ
# & ".\�����ű�\��װ\�������װ.ps1"
& "D:\Program Files\~��װ��\23 ���ݱ��� FreeFileSync\FreeFileSync_13.2_Windows_Setup.exe"
& "D:\Program Files\~��װ��\31 ��Ѷ���\QQ9.9.1.15820_x64.exe"

# ��װ��ѡ����: ������ʾ��
Add-WindowsCapability -Online -Name App.WirelessDisplay*

# ���°���
Update-Help

# ��װ��ѡ����: WSL
# ref: https://docs.microsoft.com/zh-cn/windows/wsl/install
wsl --install

# winget ��Դ
# https://unicom.mirrors.ustc.edu.cn/help/winget-source.html
winget source remove winget
winget source add winget https://mirrors.ustc.edu.cn/winget-source

# ��װGNU����
winget install -e --id GnuWin32.Make
winget install -e --id 7zip.7zip

# ��װVS Code
winget install -e --id  Microsoft.VisualStudioCode

# ��װ��Ѷ���
# winget install -e --id Tencent.QQ
winget install -e --id Tencent.WeChat
winget install -e --id Tencent.QQMusic
winget install -e --id Tencent.QQPlayer
winget install -e --id Tencent.TencentMeeting

# PDF���
winget install -e --id TikzEdt.TikzEdtBeta
winget install -e --id Mathpix.MathpixSnippingTool

# ������
winget install -e --id Python.Python.3.12
winget install -e --id StrawberryPerl.StrawberryPerl

# �ļ���ͬ��
winget install -e --id Nutstore.Nutstore

# ��ѡ/ͼƬ
# winget install -e --id Inkscape.Inkscape
# winget install -e --id ImageMagick.ImageMagick
# winget install -e --id ArtifexSoftware.GhostScript
# ��Ҫ�������˴�����Ҳ����ġ�
# copy "C:\Program Files\ImageMagick-7.0.10-Q16\convert.exe" "C:\Program Files\ImageMagick-7.0.10-Q16\imgconvert.exe"

# proxy needed
Write-Output "���ڣ����ȫ�ִ���^_^"
pause

# ��װGNU����
winget install -e --id Git.Git

# PDF���
winget install -e --id JohnMacFarlane.Pandoc
winget install -e --id PDFsam.PDFsam

Write-Output "��ȷ�Ϲر�ȫ�ִ���^_^"
pause

# ������� config
# ˢ�»�������
# Update-SessionEnvironment # ��װchoco���ʹ��
[System.Environment]::SetEnvironmentVariable("Path", [System.Environment]::GetEnvironmentVariable("Path","User") + ";D:\Program Files\ȫ��·���ļ���", "User")
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
New-Item -ItemType SymbolicLink -Path "D:\Program Files\ȫ��·���ļ���" -Name make.exe -Target "C:\Program Files (x86)\GnuWin32\bin\make.exe"

# �����ļ�
# -recurse ���������ݹ鸴��; ��Ŀ���ļ��в�����, �򴴽�֮.
# $env:USERPROFILE = C:\User\<User Name>
# $env:APPDATA     = C:\User\<User Name>\AppData\Roaming
mkdir "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
Copy-Item ".\�����ű�\��װ\Git\zh_cn.msg"       "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
Copy-Item ".\�����ű�\��װ\Git\win.gitconfig"   "$env:USERPROFILE\.gitconfig"
Copy-Item ".\�����ű�\��װ\Miktex\indentconfig.yaml" "$env:USERPROFILE\"
Copy-Item ".\�����ű�\��װ\FreeFileSync\*"      "$env:APPDATA\FreeFileSync\"                           -recurse
mkdir "$env:USERPROFILE\Desktop\��ݷ�ʽ\"
Copy-Item "D:\Program Files\~��ݷ�ʽ\*"        "$env:USERPROFILE\Desktop\��ݷ�ʽ\"                   -recurse
# Copy-Item "D:\Program Files\~��װ��\22 �ļ����� ��Torrent\3.5.5\utorrent.lng" "$env:APPDATA\uTorrent\"

# Python����
py -m pip config set global.index-url https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple
py -m pip install --upgrade pip # --force-reinstall
# Jupyter
py -m pip install jupyter numpy sympy # scipy matplotlib
# Wolfram
# ref: https://reference.wolfram.com/language/WolframClientForPython/docpages/install.html
py -m pip install wolframclient
# �ж��ַ�������: chardet (python�Դ�)

# Perl����
# Perl��Ҫ����LaTeX����
# latexindent����YAML::Tiny
cpan YAML::Tiny

# �´�����ʱ����
# New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce -Name "SetWSLVersion" -PropertyType String -Value "wsl --set-default-version 2"

# For Windows 11
# Get-AppxPackage -Name "MicrosoftWindows.Client.WebExperience" -AllUsers | Remove-AppxPackage -AllUsers