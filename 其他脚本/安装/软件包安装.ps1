# Encoding: GB2312

# $client = new-object System.Net.WebClient
# $client.DownloadFile('https://mathpix.com/win_app/mathpix_snipping_tool_setup.exe','D:\Program Files\~安装包\41 自动下载\mathpix_snipping_tool_setup.exe')
# & "D:\Program Files\~安装包\41 自动下载\mathpix_snipping_tool_setup.exe" /S
& "D:\Program Files\~安装包\09 其他软件\mathpix_snipping_tool_setup.v03.00.0074.exe" /S

& "D:\Program Files\~安装包\31 腾讯软件\QQPlayerSetup4.2.4.827.exe" /S
& "D:\Program Files\~安装包\31 腾讯软件\WeChatSetup.exe" /S

# MSI文件，用quiet表示静默安装，用passive表示无人值守安装
& "D:\Program Files\~安装包\33 微软软件\wsl_update_x64.msi" /passive

# /S选项有用 但未使用
& "D:\Program Files\~安装包\31 腾讯软件\PCQQ2020.exe"

# /S选项无用
# & "D:\Program Files\~安装包\02 Wolfram编译器\M-WIN-WolframEngine-12.0.1-6478682\setup.exe"
& "D:\Program Files\~安装包\23 数据备份 FreeFileSync\FreeFileSync_11.18_Windows_Setup.exe"
# & "D:\Program Files\~安装包\03 时间管理\RescueTimeInstaller 2.15.0.exe"
# & "D:\Program Files\~安装包\31 腾讯软件\QQPinyin_Setup_6.2.5507.400.exe"
& "D:\Program Files\~安装包\31 腾讯软件\QQMusic_YQQFloatLayer.exe"
& "D:\Program Files\~安装包\31 腾讯软件\野狐围棋 install.exe"

# /S 选项出错
& "D:\Program Files\~安装包\21 文件云同步\GoogleDriveSetup.exe"

# 3.5.5需要Windows Defender放行且非常恶心……
# 暂换成2.0.4
& "D:\Program Files\~安装包\22 文件下载 μTorrent\2.0.4\uTorrent.exe"

# 未尝试
& "D:\Program Files\~安装包\20 即时信息交互\TencentMeeting_0300000000_2.0.0.459.publish.exe"
& "D:\Program Files\~安装包\20 即时信息交互\ZoomInstaller.exe"