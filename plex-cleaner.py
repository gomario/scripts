# import OS module
import os
import re
 
# Get the list of all files and directories
path = "/mnt/backup_alpha/plex/vidlib/Movies"
dir_list = os.listdir(path)
 
print("Files and directories in '", path, "' :")
 
# prints all files
print(dir_list)

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
