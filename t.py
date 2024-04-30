import re
reg=r"^.*/(\d+)$"
s = "/faster/1234567"
res=re.match(reg,s)
if res:
    print(res.group(1) )
else:
    print("no match")
