# -*- coding: UTF-8 -*-

import re
import sys

def transform(s: str) -> str:
    """输入TeX语句，返回等价的TeX语句。

    忽略注释行的更改。
    """
    s = re.sub(r"%.*$", r"", s, flags=re.MULTILINE)  # 删除注释
    s1, s2, s = s.partition(r"\begin{document}")  # 区分导言区
    if s2 == "":
        return s1  # 没有正文，直接返回
    s = re.sub(r"\n\s*\n", r"\\par{}", s)  # 分段行内化
    s = re.sub(r"\s", r" ", s)  # 删除回车
    s = re.sub(r"\\\[", r"\\[ ", s)  # 行间公式补充空格
    s = re.sub(r"\\\]", r" \\]", s)  # 行间公式补充空格
    s = re.sub(r"\$(.*?)\$", r"$ \1 $", s)  # 行内公式补充空格
    s = re.sub(r"(\\begin\{.*?\})", r" \1 ", s)  # \begin补充空格
    s = re.sub(r"\s{2,}", r" ", s)  # 删除多余空格
    s = re.sub(r"\s*\\par\{\}\s*", r"\n\n", s)  # 分段重新变成行间
    s = re.sub(r"\. ", r".\n", s)  # 句号后换行，增强可读性
    return s1 + s2 + s

if len(sys.argv) == 1:
    print("参数个数为{0}个。应接受至少1个文件名用以转换。".format(len(sys.argv) - 1))

for i in range(1, len(sys.argv)):
    with open(sys.argv[i], encoding="UTF-8") as f:
        data = f.read()
    with open(sys.argv[i] + ".out", "w", encoding="UTF-8") as f:
        print(transform(data), file=f)

import platform, os

if len(sys.argv) == 3 and platform.system() in {"Windows", "Linux"}:
    print("参数个数为{0}个。是{1}操作系统。准备比较……".format(len(sys.argv) - 1, platform.system()))
    command = " {0}.out {1}.out".format(sys.argv[1], sys.argv[2])
    if platform.system() == "Windows":
        command = "fc" + command
    else:
        command = "diff" + command
    print("命令：", command)
    os.system(command)
else:
    print("参数个数为{0}个。是{1}操作系统。放弃比较。退出……".format(len(sys.argv) - 1, platform.system()))
