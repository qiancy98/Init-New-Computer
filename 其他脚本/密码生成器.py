import secrets
import string

def sample(字符串集:str, n:int) -> str:
	return [secrets.choice(字符串集) for i in range(n)]

随机数 = ''.join(sample(string.ascii_letters + string.digits + string.punctuation,15))
print(随机数)

随机数 = ''.join(sample(string.ascii_letters + string.digits,15))
print(随机数)

随机数 = ''.join(sample(string.digits,15))
print(随机数)