#!/bin/sh
hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
wslip=$(hostname -I | awk '{print $1}')
port=10811

PROXY_HTTP="http://${hostip}:${port}"

set_proxy(){
	# 添加代理
	git config --global http.proxy "${PROXY_HTTP}"
	git config --global https.proxy "${PROXY_HTTP}"
}

unset_proxy(){
	# 移除代理
	git config --global --unset http.proxy
	git config --global --unset https.proxy
}

test_setting(){
    echo "Host ip:" ${hostip}
    echo "WSL ip:" ${wslip}
    echo "Current proxy:" $https_proxy
}

if [ "$1" = "set" ]
then
    set_proxy

elif [ "$1" = "unset" ]
then
    unset_proxy

elif [ "$1" = "test" ]
then
    test_setting
else
    echo "Unsupported arguments."
fi