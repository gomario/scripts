# import OS module
import os
import re
import sys


class MyDropBox( object ):

    def __init__(self):
        print("Hello")
        self.go()
		
 
    def go(self):
        # Get the list of all files and directories
        javs_path="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/samba/incoming/"
        dir_list = os.listdir(javs_path)
         
        print("Files and directories in '", javs_path, "' :")
         
        # prints all files
        print(dir_list)
        xfiles = os.walk(javs_path)
        cnt=0
        for (root,dirs,files) in xfiles:
                print (root)
                print (dirs)
                print (files)
                for fname in files:
                    print(f"file --> {fname}")
                    print ('--------------------------------')
        print(f"Total rename {cnt}")


# Defining main function 
def main(): 
    print("hey there") 
    MyDropBox()
  
  
# Using the special variable  
# __name__ 
if __name__=="__main__": 
    main() 
