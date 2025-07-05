# Encoding: GB2312
# Please use admin ps.

Write-Host "��ǰʱ�䣺$(Get-Date)"
$startTime = Get-Date

# winget ��Դ
# https://unicom.mirrors.ustc.edu.cn/help/winget-source.html
winget source remove winget
winget source add winget https://mirrors.ustc.edu.cn/winget-source

# winget Tab��ȫ
# ref: https://learn.microsoft.com/zh-cn/windows/package-manager/winget/tab-completion
# �� ./�����ű�/��װ/WinGet/winget Tab��ȫ.ps1 ����׷�ӵ� $PROFILE
Get-Content -Path "./�����ű�/��װ/WinGet/winget Tab��ȫ.ps1" -Raw | Add-Content -Path $PROFILE

# winget �������
winget settings --enable ProxyCommandLineOptions

winget import -i "./�����ű�/��װ/WinGet/winget-packages.json"

# ��װ��� (��Ҫ����)

# ��װMicrosoft����
winget install --proxy http://localhost:10808 -e --id Microsoft.PowerToys
winget install --proxy http://localhost:10808 -e --id Microsoft.PowerShell

# ��װGNU����
winget install --proxy http://localhost:10808 -e --id Git.Git

# PDF���
winget install --proxy http://localhost:10808 -e --id JohnMacFarlane.Pandoc
winget install --proxy http://localhost:10808 -e --id PDFsam.PDFsam

# ˢ�»�������
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Git����
mkdir "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
Copy-Item ".\�����ű�\��װ\Git\zh_cn.msg"       "C:\Program Files\Git\mingw64\share\git-gui\lib\msgs\"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.gitconfig" -Target ".\�����ű�\��װ\Git\win.gitconfig"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\indentconfig.yaml" -Target ".\�����ű�\��װ\Miktex\indentconfig.yaml"

# Python����
py -m pip config set global.index-url https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple
# pip config set global.index-url https://mirrors.aliyun.com/pypi/simple # ��ʱ
py -m pip install --upgrade pip # --force-reinstall
# �ҵ�Python����
py -m pip install -r ".\�����ű�\��װ\python-requirements.txt"
# gpt-academic
py -m pip install -r "D:\Program Files\gpt-academic\requirements.txt"

# Perl����
# Perl��Ҫ����LaTeX����
# latexindent����YAML::Tiny
cpan YAML::Tiny

$endTime = Get-Date
$duringTime = $endTime - $startTime
Write-Output "�ܼƺ�ʱ��$($duringTime.TotalMinutes)����"
pause