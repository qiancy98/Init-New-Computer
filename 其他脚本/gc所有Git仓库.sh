#!/usr/bin/bash
find "d:/Google 云端硬盘/" -type d -name .git -print -execdir git gc --aggressive --quiet \;