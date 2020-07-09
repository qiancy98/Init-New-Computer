Copy-Item "$env:USERPROFILE\.gitconfig"                  ".\其他脚本\安装\Git\.gitconfig"    
Copy-Item "$env:APPDATA\FreeFileSync\GlobalSettings.xml" ".\其他脚本\安装\FreeFileSync\GlobalSettings.xml"    
Copy-Item "$env:APPDATA\FreeFileSync\LastRun.ffs_gui"    ".\其他脚本\安装\FreeFileSync\LastRun.ffs_gui"       
# Copy-Item "$env:APPDATA\Code\User\syncing.json" ".\其他脚本\安装\Code\syncing.json" #因为已经设成只读
