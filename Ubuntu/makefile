include scripts/mk.*

ifeq ($(origin Help), undefined)
Help = Help:\n
help:
	@echo "$(Help)"
endif

Help += \n**Extention**\n	daily.apk		更新所有软件\n	daily.apk.showmanual	“更新软件”帮助\n	proxy.on		此终端中打开代理\n	proxy.off		此终端中关闭代理\n	install.jekyll		安装jekyll\n

####################

daily.apk:
	sudo apt-get update
	sudo apt-get upgrade --assume-yes --quiet --with-new-pkgs --auto-remove

daily.apk.showmanual:
	apt-mark showmanual

daily.wsl: daily.apk
	mpm.exe --update &

proxy.on:
	export http_proxy="http://127.0.0.1:10809"

proxy.off:
	unset http_proxy

try:
	scripts/try
