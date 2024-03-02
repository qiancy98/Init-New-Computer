# 如果输入整数，输出整数长的密码；否则，输出15位密码
长度 = 15

import sys

if len(sys.argv) > 1:
    try:
        长度 = int(sys.argv[1])
    except ValueError:
        长度 = 15


def sample(字符串集: str, n: int) -> str:
    import secrets

    return "".join(secrets.choice(字符串集) for _ in range(n))


import string

随机数 = sample(string.ascii_letters + string.digits + string.punctuation, 长度)
print(随机数)

随机数 = sample(string.ascii_letters + string.digits, 长度)
print(随机数)

随机数 = sample(string.digits, 长度)
print(随机数)
