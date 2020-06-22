import os
import re
import chardet

convert = True # 是否转换格式。

os.chdir('D:/Google 云端硬盘/')
print("工作目录：",os.getcwd())
for root, dirs, files in os.walk("."):
    # print(files)
    for name in files:
        full_name = os.path.join(root, name)
        # 只更改txt文件的编码
        if re.fullmatch(r".*\.txt",name):
            with open(full_name,'rb') as fin:
                input = fin.read()
            判断结果 = chardet.detect(input)
            # 只更改GB2312的编码
            if (判断结果['encoding'] in {'GB2312','UTF-8-SIG'} and 判断结果['confidence']>0.98):
                映射对照表 = {'GB2312':'GBK','UTF-8-SIG':'UTF-8-SIG'}
                string = input.decode(映射对照表.get(判断结果['encoding']))
                if convert:
                    print(full_name)
                    with open(full_name,'w', encoding='utf-8') as fout:
                        fout.write(string)
                else:
                    print(full_name)
            elif 判断结果['encoding'] in {'utf-8','ascii','UTF-16'}:
                pass
            else:
                print(full_name,判断结果)