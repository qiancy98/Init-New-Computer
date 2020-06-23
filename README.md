# 注意/ Attention
[常用软件](常用软件/)目录下的文件遵循其原版权。我未修改这些软件。由于我无权分发这些软件，因此仅限位于中国的个人学习之用；若需因其他原因使用，请至官网下载；否则造成的版权纠纷，概不负责。

The files in [常用软件](常用软件/) folder obey their original license. I didn't modify them. Since I do not have the right to re-distribute these softwares, they can only be used by individuals in China for the purpose of learning; if you need to use them for other purposes, you have to download them from the official site; otherwise your action may result in copyright disputes.

# 用途
用来初始化新Windows机器。

# 文件说明
主目录下，[安装.ps1](安装.ps1)用来在Windows下安装；[安装说明.txt](安装说明.txt)用来指导手动安装。

## ./常用软件/
短时间使用电脑下，最常用的文件。部分文件由于体积过大，需要联网运行[常用软件/下载软件.sh](常用软件/下载软件.sh)得到。也可安装[WinGet](常用软件/winget%20v0.1.appxbundle)后执行[常用软件/下载软件.ps1](常用软件/下载软件.ps1)得到。

软件主页链接：
- [WinGet](https://github.com/microsoft/winget-cli)
- [VS Code](https://github.com/microsoft/vscode)
- [SumatraPDF](https://github.com/sumatrapdfreader/sumatrapdf)
- [V2rayN](https://github.com/2dust/v2rayN)
- [7zip (外链)](https://www.7-zip.org/)

## ./Ubuntu/
运行[Ubuntu/init-wsl.sh](Ubuntu/init-wsl.sh)以初始化Ubuntu（wsl：Windows的Linux子系统）。

在此目录下运行`make daily.apk`可以更新所有软件。
## ./Ubuntu/scripts/
大多数文件都不用管，除了[mk.cpp](Ubuntu/scripts/mk.cpp)和[mk.tex](Ubuntu/scripts/mk.tex)分别用来编译C++文件和tex文件。