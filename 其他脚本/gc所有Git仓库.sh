#!/usr/bin/bash
find "/mnt/d/Google 云端硬盘/" -type d -name .git -execdir git gc --aggressive \;