# Encoding: GB2312
# Please use admin ps.

Write-Host "当前时间：$(Get-Date)"
$startTime = Get-Date

# 修改电源计划
# ref: https://blog.csdn.net/2301_76933862/article/details/134466523
# ref： https://www.bilibili.com/opus/768284686445182981
# 修改 计算机\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\{GUID}\Attributes的值为2，以显示这些设置
# | 电源计划设置 | GUID | 说明 |
# | --- | --- | --- |
# | 处理器性能核心放置最小核心数量 | 0cc5b647-c1df-4637-891a-dec35c318583 |  |
# | 处理器最大频率 | 54533251-82be-4824-96c1-47b60b740d00 | |
# | 第1类处理器电源效率的处理器最大频率 | 75b0ae3f-bce0-45a7-8c89-c9611c25e101 | |
# | 最小处理器状态 | 893dee8e-2bef-41e0-89c6-b55d0929964c | |
# | 第1类处理器电源效率的最小处理器状态 | 893dee8e-2bef-41e0-89c6-b55d0929964d | |
# | 最大处理器状态 | bc5038f7-23e0-4960-96da-33abaf5935ec | |
# | 第1类处理器电源效率的最大处理器状态 | bc5038f7-23e0-4960-96da-33abaf5935ed | |
# | 处理器性能核心放置最大核心数量 | ea062031-0e34-4ff1-9b6d-eb1059334028 | 看起来是限制最多使用多少个处理器 |


# 添加右键菜单
# ref: https://blog.csdn.net/qq_34769162/article/details/117068877

# VS Code

$vscodePath = "$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe"

# [文件夹]添加右键菜单: VS Code打开文件夹

Set-Location Registry::HKEY_CLASSES_ROOT
New-Item -Name "Directory\shell\VSCode" -Force
Set-Location Registry::HKEY_CLASSES_ROOT\Directory\shell\VSCode
# 设置图标
New-ItemProperty -Name "Icon" -Value "$vscodePath" -PropertyType String -Force .
# 设置显示名称
New-ItemProperty -Name "MUIVerb" -Value "使用 VS Code 打开" -PropertyType String -Force .
# 设置位置: 置顶
New-ItemProperty -Name "Position" -Value "Top" -PropertyType String -Force .
# 设置命令
New-Item -Name "command" -Force -Value """$vscodePath"" ""%1"""

# [文件夹空白处]添加右键菜单: VS Code打开文件夹

Set-Location Registry::HKEY_CLASSES_ROOT
New-Item -Name "Directory\Background\shell\VSCode" -Force
Set-Location Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\VSCode
# 设置图标
New-ItemProperty -Name "Icon" -Value "$vscodePath" -PropertyType String -Force .
# 设置显示名称
New-ItemProperty -Name "MUIVerb" -Value "使用 VS Code 打开" -PropertyType String -Force .
# 设置位置: 置顶
New-ItemProperty -Name "Position" -Value "Top" -PropertyType String -Force .
# 设置命令
New-Item -Name "command" -Force -Value """$vscodePath"" ""%V"""

# [文件]添加右键菜单: VS Code打开文件

Set-Location Registry::HKEY_CLASSES_ROOT
New-Item -Name "*\shell\VSCode" -Force
Set-Location -LiteralPath Registry::HKEY_CLASSES_ROOT\*\shell\VSCode # 使用 -LiteralPath 参数，避免路径中的特殊字符被转义
# 设置图标
New-ItemProperty -Name "Icon" -Value "$vscodePath" -PropertyType String -Force .
# 设置显示名称
New-ItemProperty -Name "MUIVerb" -Value "使用 VS Code 打开" -PropertyType String -Force .
# 设置命令
New-Item -Name "command" -Force -Value """$vscodePath"" ""%1"""

$endTime = Get-Date
$duringTime = $endTime - $startTime
Write-Output "耗时：$($duringTime.TotalMinutes)分钟"

pause