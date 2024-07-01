# Encoding: GB2312

# Please use admin ps.
# Enter this sentence and run this powershell.
# Set-ExecutionPolicy RemoteSigned -Scope Process

Write-Host "当前时间：$(Get-Date)"

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
