# coding=utf8
# the above tag defines encoding for this document and is for Python 2.x compatibility
import re
import os
import shutil

title = "193571_3xplanet_Caribbeancom_042620-001.mp4"

regx = r".*Caribbeancom.(\d{6}).*"

m = re.match( regx, title )

directory = "."
for filename in os.listdir(directory):
    if filename.endswith(".mp4"):
        fname = os.path.join(directory, filename)
        m = re.match( regx, fname )
        if m:
            #print("gr1 " + m.group(1) )
            fid =  m.group(1)
            dest = fid+"-caribbeancom.mp4"
            print (fname + "--->dest is ",dest ) 
            shutil.move( fname, dest )
        continue
    else:
        continue
