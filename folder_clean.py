# import OS module
import os
import re
import sys
 
# Get the list of all files and directories
javs_path="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/javs/"
dir_list = os.listdir(javs_path)
 
print("Files and directories in '", javs_path, "' :")
 
# prints all files
print(dir_list)
xfiles = os.walk(javs_path)
cnt=0
for (root,dirs,files) in xfiles:
        print (root)
        print (dirs)
        for adir in dirs:
          tpath = f"{root}{adir}"
          if not os.listdir(tpath):
            input(f"Empty dir ? {tpath}")
            os.rmdir(tpath)
          else:
            input(f"Dir is NOT Empty dir ? {tpath}")
          
        print (files)
        for fname in files:
          if '@' in fname:
            fparts = fname.split('@')
            print(f"at in file {fname} {fparts} {fparts[1]}")
            #input(f"Rewrite {fname} to {fparts[1]}")
            os.rename(f"{root}/{fname}",f"{javs_path}/{fparts[1]}")
            #input("wrote renamed file ")
            cnt+=1
          else:
            os.rename(f"{root}/{fname}",f"{javs_path}/{fname}")
          #input("Next?")

        print ('--------------------------------')
print(f"Total rename {cnt}")

sys.exit()
for afile in dir_list:
  print(f"Orig: {afile}")
  
  regex = r"(.*)(\(.*\))(.*)"
  res = re.match(regex,afile.strip())
  orig = path+'/'+afile
  if ( res ):
    print(f"1:'{res.group(1)}' 2:'{res.group(2)}' 3:'{res.group(3)}'")
    cand = path+'/'+f"{res.group(1).strip()} {res.group(2).strip()}"
    #rename = input (f"Rename '{orig}' to '{cand}'?")
    rename = ""

    #if os.path.isdir( orig):
    #  print("dir")

    if rename == 'y':
      print(f"Renaming '{orig}' TO '{cand}'")
      os.rename(orig, cand)
    else:
      print("Skipping rename")
        
    if os.path.isfile(orig):
        print("***file")
        adir = f"{res.group(1)} {res.group(2)}"
        new_dir =  path+'/'+f"{res.group(1).strip()} {res.group(2).strip()}"
        r= input(f"Create dir {new_dir}")
        if r == 'y':
          #os.mkdir(new_dir)
          print(f"Created Directory {new_dir}")
          new_loc =  f"{new_dir}/{afile}"
          print(f"Moving to {new_loc}")
          #os.rename(orig, new_loc)
