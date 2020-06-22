# # Install choco
# Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
# Set-ExecutionPolicy AllSigned -Scope Process
# choco feature enable -n useRememberedArgumentsForUpgrades
# choco feature enable -n allowGlobalConfirmation

# choco install make
# choco install git
# choco install 7zip

# # PDF相关
# choco install pandoc
# choco install pdfsam

# # 编译器
# choco install python
# choco install strawberryperl

# LaTeX到图片格式转换时可选
# choco install inkscape
# choco install imagemagick
# choco install ghostscript

# Install packages
# packages list: https://chocolatey.org/packages