# $client = new-object System.Net.WebClient
# $client.DownloadFile('https://www.rescuetime.com/installers/RescueTimeInstaller.exe','D:\Program Files\~安装包\03 时间管理\RescueTimeInstaller.exe')
# Start-Process "D:\Program Files\~安装包\03 时间管理\RescueTimeInstaller.exe" -NoNewWindow

& "D:\Program Files\~安装包\02 Wolfram编译器\M-WIN-WolframEngine-12.0.1-6478682\setup.exe" /S
& "D:\Program Files\~安装包\03 时间管理\RescueTimeInstaller.exe" /S
& "D:\Program Files\~安装包\21 文件云同步\googledrivesync.exe" /S
& "D:\Program Files\~安装包\22 文件下载 μTorrent\3.5.5\uTorrent.exe" /S
& "D:\Program Files\~安装包\23 数据备份 FreeFileSync\FreeFileSync_10.24_Windows_Setup.exe" /S
& "D:\Program Files\~安装包\31 腾讯软件\QQ9.0.4Trial.exe"
& "D:\Program Files\~安装包\31 腾讯软件\QQMusic_YQQFloatLayer.exe.exe"
& "D:\Program Files\~安装包\31 腾讯软件\QQPinyin_Setup_6.2.5507.400.exe" /S
& "D:\Program Files\~安装包\31 腾讯软件\QQPlayerSetup4.2.4.827.exe" /S
& "D:\Program Files\~安装包\31 腾讯软件\WeChatSetup.exe"
& "D:\Program Files\~安装包\31 腾讯软件\野狐围棋 install.exe" /S
& "D:\Program Files\~安装包\33 微软软件\MicrosoftEdgeSetup.exe" /S

# FreeFileSync:
# 	全局设置->勾选“复制锁定文件”
# 	或者将如下行的false改为true:
# 	File: %APPDATA%/FreeFileSync
# 	<CopyLockedFiles Enabled="false"/>
