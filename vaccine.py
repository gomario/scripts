#!/usr/bin/python
import re
import os
import sys
#SRC="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/jav/caribbeancom"
src="/home/mario/dwhelper"

import os
included_extensions = ['mp4']
mfiles = [fn for fn in os.listdir( src )
              if any(fn.endswith(ext) for ext in included_extensions)]
print( mfiles )

included_extensions = ['txt']
tfiles = [fn for fn in os.listdir( src )
              if any(fn.endswith(ext) for ext in included_extensions)]
print( tfiles )

for mfname in mfiles:
    #print( file )
    mfname = mfname.split("-")[0]
    filename, file_extension = os.path.splitext( mfname)
    print("Looking for '"+ filename +"'")
    #continue
    for desc in tfiles:
        desc = desc.encode('ascii', 'ignore').decode('ascii')
        pat = r"(\d+-\d+)-(.*) "
        res = re.match(pat, desc)

        if not res:
          print("Search unsuccessful.: "+desc)	
          continue
        id = res[1]
        if ( desc.find( mfname ) != -1 ):
            print(desc+"<FOUND IT>"+mfname);
            print("Joe we found it ",res[1]);
            print( src+"/"+mfname +"--->"+src+"/"+id+".mp4") 



sys.exit(0)
# traverse root directory, and list directories as dirs and files as files
for root, dirs, files in os.walk(src+"/."):
    path = root.split(os.sep)
    print((len(path) - 1) * '---', os.path.basename(root))
    for file in files:
        zstr = file.encode('utf-8')
        print( file )
        #xb'061910-405-Satomi Suzuki Dirty Training for a Newbie Vol.14 .txt'
        #print(file.encode('utf-8', errors='ignore'))
