# Encoding: GB2312

$client = new-object System.Net.WebClient
$client.DownloadFile('https://mathpix.com/win_app/mathpix_snipping_tool_setup.exe','D:\Program Files\~��װ��\41 �Զ�����\mathpix_snipping_tool_setup.exe')
& "D:\Program Files\~��װ��\41 �Զ�����\mathpix_snipping_tool_setup.exe" /S

& "D:\Program Files\~��װ��\31 ��Ѷ���\QQPlayerSetup4.2.4.827.exe" /S
& "D:\Program Files\~��װ��\31 ��Ѷ���\WeChatSetup.exe" /S

# /Sѡ������ ��δʹ��
& "D:\Program Files\~��װ��\31 ��Ѷ���\PCQQ2020.exe"

# /Sѡ������
& "D:\Program Files\~��װ��\02 Wolfram������\M-WIN-WolframEngine-12.0.1-6478682\setup.exe"
& "D:\Program Files\~��װ��\23 ���ݱ��� FreeFileSync\FreeFileSync_10.25_Windows_Setup.exe"
& "D:\Program Files\~��װ��\03 ʱ�����\RescueTimeInstaller 2.15.0.exe"
& "D:\Program Files\~��װ��\31 ��Ѷ���\QQPinyin_Setup_6.2.5507.400.exe"
& "D:\Program Files\~��װ��\31 ��Ѷ���\QQMusic_YQQFloatLayer.exe"
& "D:\Program Files\~��װ��\31 ��Ѷ���\Ұ��Χ�� install.exe"

# /S ѡ�����
& "D:\Program Files\~��װ��\21 �ļ���ͬ��\googledrivesync.exe"
& "D:\Program Files\~��װ��\33 ΢�����\MicrosoftEdgeSetup.exe"

# ��ҪWindows Defender�����ҷǳ����ġ���
& "D:\Program Files\~��װ��\22 �ļ����� ��Torrent\3.5.5\uTorrent.exe"
