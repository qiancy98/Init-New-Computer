# Encoding: GB2312

# $client = new-object System.Net.WebClient
# $client.DownloadFile('https://www.rescuetime.com/installers/RescueTimeInstaller.exe','D:\Program Files\~��װ��\03 ʱ�����\RescueTimeInstaller.exe')
# Start-Process "D:\Program Files\~��װ��\03 ʱ�����\RescueTimeInstaller.exe" -NoNewWindow

& "D:\Program Files\~��װ��\02 Wolfram������\M-WIN-WolframEngine-12.0.1-6478682\setup.exe" /S
& "D:\Program Files\~��װ��\03 ʱ�����\RescueTimeInstaller.exe" /S
& "D:\Program Files\~��װ��\21 �ļ���ͬ��\googledrivesync.exe" /S
& "D:\Program Files\~��װ��\22 �ļ����� ��Torrent\3.5.5\uTorrent.exe" /S
& "D:\Program Files\~��װ��\23 ���ݱ��� FreeFileSync\FreeFileSync_10.24_Windows_Setup.exe" /S
& "D:\Program Files\~��װ��\31 ��Ѷ���\QQ9.0.4Trial.exe"
& "D:\Program Files\~��װ��\31 ��Ѷ���\QQMusic_YQQFloatLayer.exe.exe"
& "D:\Program Files\~��װ��\31 ��Ѷ���\QQPinyin_Setup_6.2.5507.400.exe" /S
& "D:\Program Files\~��װ��\31 ��Ѷ���\QQPlayerSetup4.2.4.827.exe" /S
& "D:\Program Files\~��װ��\31 ��Ѷ���\WeChatSetup.exe"
& "D:\Program Files\~��װ��\31 ��Ѷ���\Ұ��Χ�� install.exe" /S
& "D:\Program Files\~��װ��\33 ΢�����\MicrosoftEdgeSetup.exe" /S

# FreeFileSync:
# 	ȫ������->��ѡ�����������ļ���
# 	���߽������е�false��Ϊtrue:
# 	File: %APPDATA%/FreeFileSync
# 	<CopyLockedFiles Enabled="false"/>
