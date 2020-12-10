#!/usr/bin/bash
find /mnt/d -type d -name .git -exec cd {}/.. && git gc \;