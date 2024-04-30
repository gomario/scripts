import re
import os

with open("urls","r") as f:
    urls = f.readlines()

cnt=0
for url in urls:
    print(url)

    regex = r"^.*movies\/(.*)\/1080.*\/.*$"
    regex1 = r"^.*movies\/(.*)\/hls-1800k.*$"

    res = re.match(regex,url.strip())
    res1 = re.match(regex1,url.strip())
    if ( res1 ):
        id = res1.group(1)
        print ("*** ID : ",id)

        cmd="curl '%s' --output %s.mp4" % ( url.strip(), id.strip())
        print(cmd)
        os.system(cmd)
        cnt+=1
        continue
    if ( res ):
        id = res.group(1)
        print ("*** ID : ",id)

        cmd="curl '%s' --output %s.mp4" % ( url.strip(), id.strip())
        print(cmd)
        os.system(cmd)
        cnt+=1
        continue
    print("No match")

print("did ",cnt)
