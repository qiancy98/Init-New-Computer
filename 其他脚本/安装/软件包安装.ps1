# Encoding: GB2312

$client = new-object System.Net.WebClient
$client.DownloadFile('https://mathpix.com/win_app/mathpix_snipping_tool_setup.exe','D:\Program Files\~安装包\41 自动下载\mathpix_snipping_tool_setup.exe')
& "D:\Program Files\~安装包\41 自动下载\mathpix_snipping_tool_setup.exe" /S

& "D:\Program Files\~安装包\31 腾讯软件\QQPlayerSetup4.2.4.827.exe" /S
& "D:\Program Files\~安装包\31 腾讯软件\WeChatSetup.exe" /S

# /S选项有用 但未使用
& "D:\Program Files\~安装包\31 腾讯软件\QQ9.0.4Trial.exe"

# /S选项无用
& "D:\Program Files\~安装包\02 Wolfram编译器\M-WIN-WolframEngine-12.0.1-6478682\setup.exe"
& "D:\Program Files\~安装包\23 数据备份 FreeFileSync\FreeFileSync_10.25_Windows_Setup.exe"
& "D:\Program Files\~安装包\03 时间管理\RescueTimeInstaller 2.15.0.exe"
& "D:\Program Files\~安装包\31 腾讯软件\QQPinyin_Setup_6.2.5507.400.exe"
& "D:\Program Files\~安装包\31 腾讯软件\QQMusic_YQQFloatLayer.exe"
& "D:\Program Files\~安装包\31 腾讯软件\野狐围棋 install.exe"

# /S 选项出错
& "D:\Program Files\~安装包\21 文件云同步\googledrivesync.exe"
& "D:\Program Files\~安装包\33 微软软件\MicrosoftEdgeSetup.exe"

# 需要Windows Defender放行
& "D:\Program Files\~安装包\22 文件下载 μTorrent\3.5.5\uTorrent.exe"
