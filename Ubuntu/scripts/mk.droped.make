ifeq ($(origin Help), undefined)
Help = Help:\n
help:
	@echo "$(Help)"
endif

Help += \n**Extention**\n	*.gcj(10/100)	For use of distributed google codejam (DGCJ)\n	daily.apk	update all the softwares\n	daily.sys	monitor the system\n	daily.disk	monitor the disk\n	proxy.on	Turn on  proxy in the current terminal\n	proxy.off	Turn off proxy in the current terminal\n	init.apk	install apk when creating a new system.\n		Now include: \n			tex: texlive-full, texlive, texlive-xetex.\n			graph: matplotlibcpp,\n			proxy: electron-ssr (manual).\n		Lack: google-chrome-stable, flash-player\n	init.cp		Under construction now.\n

####################

daily.sys:
	gnome-system-monitor &

daily.disk:
	baobab &

daily.disk_cg:
	sudo gparted

init.gz-挂载mount:
	sh scripts/init.gz-挂载mount

%.gcj10:%.cpp
	./../dcj_linux/dcj.sh test --source $< --nodes 10

%.gcj100:%.cpp
	./../dcj_linux/dcj.sh test --source $< --nodes 100
