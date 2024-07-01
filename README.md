# 存储库说明

## 注意/ Attention

[常用软件](其他脚本/安装/常用软件/)目录下的文件遵循其原版权。我未修改这些软件。由于我无权分发这些软件，因此仅限位于中国的个人学习之用；若需因其他原因使用，请至官网下载；否则造成的版权纠纷，概不负责。

The files in [常用软件](其他脚本/安装/常用软件/) folder obey their original license. I didn't modify them. Since I do not have the right to re-distribute these softwares, they can only be used by individuals in China for the purpose of learning; if you need to use them for other purposes, you have to download them from the official site; otherwise your action may result in copyright disputes.

## 用途

用来初始化新Windows机器。

## 文件说明

主目录下，[a安装-管理员.ps1](a安装-管理员.ps1)和[b安装-普通.ps1](b安装-普通.ps1)用来在Windows下安装，文件编码是GB2312。

### ./其他脚本/安装/常用软件/

短时间使用电脑下，最常用的文件。部分文件由于体积过大，需要联网运行[下载软件.sh](其他脚本/安装/常用软件/下载软件.sh)得到。也可安装[WinGet](https://github.com/microsoft/winget-cli/releases/latest)后执行[下载软件.ps1](其他脚本/安装/常用软件/下载软件.ps1)得到。

### ./Ubuntu/

* 运行[Ubuntu/init-wsl.sh](Ubuntu/init-wsl.sh)以初始化Ubuntu（wsl：Windows的Linux子系统）。
* 在此目录下运行`make daily.apk`可以更新所有软件。或者在任意位置键入`upd`亦可.
* [Ubuntu/scripts/](Ubuntu/scripts/)目录下对大多数文件都不用管，除了[mk.cpp](Ubuntu/scripts/mk.cpp)和[mk.tex](Ubuntu/scripts/mk.tex)分别用来编译C++文件和tex文件。

## 安装说明

此处描述的是我安装包的放置位置。由于上传Github时忽略了几乎所有安装包，所以大家不必理会。

| 文件夹编号 | 配置复杂性* | 软件名        |
|-----------|-------------|---------------|
| 23        | 已内置      | FreeFileSync  |
| 31        | -           | QQ            |
| WinGet    |             | Make          |
| WinGet    |             | 7-Zip         |
| WinGet    | -           | VS Code       |
| WinGet    | -           | 微信          |
| WinGet    | -           | QQ音乐        |
| WinGet    |             | QQ播放器      |
| WinGet    | -           | 腾讯会议      |
| WinGet    | -           | 阿里千牛      |
| WinGet    |             | TikzEdt       |
| WinGet    | -           | Mathpix Snipping Tool |
| WinGet    | 已内置      | Python        |
| WinGet    | 已内置      | StrawberryPerl|
| WinGet    | -           | 坚果云        |
| WinGet    | 已内置      | MikTeX        |
| WinGet    |             | PowerToys    |
| WinGet    | 已内置      | Git        |
| WinGet    |             | Pandoc        |
| WinGet    |             | PDFsam        |
| 命令行    | 已内置      | Ubuntu       |
| 便携软件  |             | V2ray        |
| 便携软件  |             | SumatraPDF   |


配置复杂性：

* `+`代表详细配置
* `-`代表仅需登录
* 无代表什么都不用做

配置方案：

| 软件名 | 方法 |
| - | - |
| QQ | 安装时修改数据目录 |
| 微信 | 设置中修改数据目录 |
| QQ音乐 | 设置中修改缓存目录 |
| FreeFileSync | 默认以管理员身份启动 |
| 阿里千牛 | 设置中修改数据目录 |
| V2ray | 设置开机自启 |
| SumatraPDF | 设置为默认PDF阅读器 |
| PowerToys | 需要手动导入设置 |

## 致谢

| 解决方案 | 项目 | 已用脚本安装？ |
| - | - | - |
| Git-Gui汉化 | [stayor/git-gui-zh](https://github.com/stayor/git-gui-zh) | 是 |
| MMA与VS Code协同 | [skidvision/wolfram-language](https://github.com/skidvision/wolfram-language) | 否 |
| MMA与Jupyter协同 | [WolframResearch/WolframLanguageForJupyter](https://github.com/WolframResearch/WolframLanguageForJupyter) | 否 |
| WeChat图片清理 | [blackboxo/CleanMyWechat](https://github.com/blackboxo/CleanMyWechat) | 免安装 |
| 磁盘信息查询 | [hiyohiyo/CrystalDiskInfo](https://github.com/hiyohiyo/CrystalDiskInfo) | 免安装 |

### 其他致谢

* 软件
  * 编辑器、阅读器
    * [vim/vim](https://github.com/vim/vim)
    * [microsoft/vscode](https://github.com/microsoft/vscode)
    * [sumatrapdfreader/sumatrapdf](https://github.com/sumatrapdfreader/sumatrapdf)
    * [torakiki/pdfsam](https://github.com/torakiki/pdfsam) 免费PDF切割合并
  * Latex
    * [MiKTeX/miktex](https://github.com/MiKTeX/miktex)
      * [清华大学开源镜像下载: MiKTeX](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/win32/miktex/setup/)
      * [中科大开源镜像下载: MiKTeX](http://mirrors.ustc.edu.cn/CTAN/systems/win32/miktex/setup/)
    * [latex3/latex3](https://github.com/latex3/latex3)
    * [jlaurens/synctex](https://github.com/jlaurens/synctex)
    * [cmhughes/latexindent.pl](https://github.com/cmhughes/latexindent.pl)
  * 软件安装
    * [lukesampson/scoop](https://github.com/lukesampson/scoop) 安装绿色软件用(未尝试)
    * [microsoft/winget-cli](https://github.com/microsoft/winget-cli)
  * VPN
    * [v2ray/v2ray-core](https://github.com/v2ray/v2ray-core)
    * [2dust/v2rayN](https://github.com/2dust/v2rayN)
    * [NetchX/Netch](https://github.com/NetchX/Netch)
    * [Loyalsoldier/v2ray-rules-dat](https://github.com/Loyalsoldier/v2ray-rules-dat)
  * 其他
    * [make](https://www.gnu.org/software/make/) (外链)
    * [prati0100/git-gui](https://github.com/prati0100/git-gui) (官方的)
    * [sparanoid/7z](https://github.com/sparanoid/7z) 7z汉化
    * [7zip](https://www.7-zip.org/) (外链)
    * [jekyll/jekyll](https://github.com/jekyll/jekyll) 在[Github Pages](https://docs.github.com/cn/github/working-with-github-pages)中使用
    * [microsoft/PowerToys](https://github.com/microsoft/PowerToys) 微软出品的实用工具
    * [jixiaoyong/ApkSigner](github.com/jixiaoyong/ApkSigner) 签名APK
* 文档
  * LaTeX
    * 已经挪至[我的GitHub page](https://qiancy98.github.io/programming/programming-others/2020/08/05/%E7%BD%91%E9%A1%B5%E9%93%BE%E6%8E%A5%E9%9B%86%E5%90%88.html)
  * 其他
    * [qinjx/30min_guides](https://github.com/qinjx/30min_guides) 覃健祥的学习笔记(Shell入门)
    * [changkun/modern-cpp-tutorial](https://github.com/changkun/modern-cpp-tutorial) 欧长坤的书, C++1x教程
* 已弃用
  * [nonoroazoro/vscode-syncing](https://github.com/nonoroazoro/vscode-syncing) VS Code同步插件 (已弃用, 因为官方插件已经支持)
