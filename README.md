# 存储库说明

## 注意/ Attention

[常用软件](常用软件/)目录下的文件遵循其原版权。我未修改这些软件。由于我无权分发这些软件，因此仅限位于中国的个人学习之用；若需因其他原因使用，请至官网下载；否则造成的版权纠纷，概不负责。

The files in [常用软件](常用软件/) folder obey their original license. I didn't modify them. Since I do not have the right to re-distribute these softwares, they can only be used by individuals in China for the purpose of learning; if you need to use them for other purposes, you have to download them from the official site; otherwise your action may result in copyright disputes.

## 用途

用来初始化新Windows机器。

## 文件说明

主目录下，[a安装-管理员.ps1](a安装-管理员.ps1)和[b安装-普通.ps1](b安装-普通.ps1)用来在Windows下安装，文件编码是GB2312。

### ./其他脚本/安装/常用软件/

短时间使用电脑下，最常用的文件。部分文件由于体积过大，需要联网运行[下载软件.sh](其他脚本/安装/常用软件/下载软件.sh)得到。也可安装[WinGet](其他脚本/安装/常用软件/winget%20v0.1.appxbundle)后执行[下载软件.ps1](其他脚本/安装/常用软件/下载软件.ps1)得到。

### ./Ubuntu/

* 运行[Ubuntu/init-wsl.sh](Ubuntu/init-wsl.sh)以初始化Ubuntu（wsl：Windows的Linux子系统）。
* 在此目录下运行`make daily.apk`可以更新所有软件。
* [Ubuntu/scripts/](Ubuntu/scripts/)目录下对大多数文件都不用管，除了[mk.cpp](Ubuntu/scripts/mk.cpp)和[mk.tex](Ubuntu/scripts/mk.tex)分别用来编译C++文件和tex文件。

## 安装说明

此处描述的是我安装包的放置位置。由于上传Github时忽略了几乎所有安装包，所以大家不必理会。也可在文件[软件包安装.ps1](其他脚本/安装/软件包安装.ps1)中查看(注意此文件编码为GB2312)。

| 文件夹编号 | 配置复杂性* | 软件名       |
| - | - | -  |
| 02         | -           | Mathematica  |
| 03         | -           | Rescuetime   |
| 21         | -           | Google Drive |
| 22         | -           | uTorrent     |
| 23         | 已内置      | FreeFileSync |
| 31         |             | QQ播放器     |
| 31         | -           | QQ音乐       |
| 31         | -           | QQ拼音       |
| 31         | -           | QQ           |
| 31         | -           | 微信         |
| 31         | -           | 野狐围棋     |
| WinGet     | +           | VS Code      |
| WinGet     | 已内置      | MikTeX       |
| 应用商店   | +           | Ubuntu       |
| 便携软件   | 开机自启    | V2ray        |
| 便携软件   | 设为默认    | SumatraPDF   |

配置复杂性：

* `+`代表详细配置
* `-`代表仅需登录
* 无代表什么都不用做

<!--
> FreeFileSync  
>> 全局设置->勾选“复制锁定文件”  
>> 或者将如下行的false改为true:  
>> File: %APPDATA%/FreeFileSync  
>> `<CopyLockedFiles Enabled="false"/>` 
 -->

## 致谢

| 解决方案 | 项目 | 已用脚本安装？ |
| - | - | - |
| Git-Gui汉化 | [stayor/git-gui-zh](https://github.com/stayor/git-gui-zh) | 是 |
| VS Code同步 | [nonoroazoro/vscode-syncing](https://github.com/nonoroazoro/vscode-syncing) | 否 |
| MMA与VS Code协同 | [skidvision/wolfram-language](https://github.com/skidvision/wolfram-language) | 否 |
| MMA与Jupyter协同 | [WolframResearch/WolframLanguageForJupyter](https://github.com/WolframResearch/WolframLanguageForJupyter) | 否 |
| WeChat图片清理 | [blackboxo/CleanMyWechat](https://github.com/blackboxo/CleanMyWechat) | 免安装 |
| 磁盘信息查询 | [hiyohiyo/CrystalDiskInfo](https://github.com/hiyohiyo/CrystalDiskInfo) | 免安装 |

### 其他致谢

* 软件
  * Latex
    * [MiKTeX/miktex](https://github.com/MiKTeX/miktex)
    * [latex3/latex3](https://github.com/latex3/latex3)
    * [microsoft/vscode](https://github.com/microsoft/vscode)
    * [sumatrapdfreader/sumatrapdf](https://github.com/sumatrapdfreader/sumatrapdf)
  * 软件安装
    * [lukesampson/scoop](https://github.com/lukesampson/scoop) 安装绿色软件用(未尝试)
    * [microsoft/winget-cli](https://github.com/microsoft/winget-cli)
  * VPN
    * [v2ray/v2ray-core](https://github.com/v2ray/v2ray-core)
    * [2dust/v2rayN](https://github.com/2dust/v2rayN)
    * [NetchX/Netch](https://github.com/NetchX/Netch)
    * [Loyalsoldier/v2ray-rules-dat](https://github.com/Loyalsoldier/v2ray-rules-dat)
  * 其他
    * [prati0100/git-gui](https://github.com/prati0100/git-gui) (官方的)
    * [sparanoid/7z](https://github.com/sparanoid/7z) 7z汉化
    * [7zip](https://www.7-zip.org/) (外链)
    * [torakiki/pdfsam](https://github.com/torakiki/pdfsam) 免费PDF切割合并
    * [jekyll/jekyll](https://github.com/jekyll/jekyll) 在[Github Pages](https://docs.github.com/cn/github/working-with-github-pages)中使用
* 文档
  * LaTeX
    * 已经挪至[我的GitHub page](https://qiancy98.github.io/programming/programming-others/2020/07/31/%E7%BD%91%E9%A1%B5%E9%93%BE%E6%8E%A5%E9%9B%86%E5%90%88.html)
  * 其他
    * [qinjx/30min_guides](https://github.com/qinjx/30min_guides) 覃健祥的学习笔记(Shell入门)
    * [changkun/modern-cpp-tutorial](https://github.com/changkun/modern-cpp-tutorial) 欧长坤的书, C++1x教程
