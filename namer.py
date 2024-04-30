"""
If folder looks like 
 Twilight.Saga.Complete.2008-2012.1080p.Rifftrax.6ch.2ch.v2
'Twitches 1&2[2005-2007]DvDrip-m4L'
'Uncharted (2022) [1080p] [WEBRip] [5.1] [YTS.MX]'
'Unsolved Mysteries - The UFO Files'
'Unstoppable (2010) [1080p]'
'untitled folder'
'U.S. Marshalls (1998)'
"""


import os
import re


basedir = '.'
for fn in os.listdir(basedir):
  if not os.path.isdir(os.path.join(basedir, fn)):
    continue # Not a directory
  #if '.' in fn:
  #  continue # Already in the correct form
  #if ' ' not in fn:
  #  continue # Invalid format

  #remove leading number
  regex = r"(\d+\.)"
  res = re.match(regex, fn)
  if res:
        num, name = fn.split(res.group(1))
        print(name.strip())

  #rx = r"(.*)(\d\d\d\d).*"
  #res = re.match(rx, fn)
  #if res:
  #      name = res.group(1)
  #      yr = res.group(2)
  #      #print(f"Res {yr}") 
  #      print(f"Res {name} {yr}") 


  #firstname,_,surname = fn.rpartition(' ')
  if res:
    print(f"Renaming '{os.path.join(basedir, fn)}'  --> '{os.path.join(basedir, name.strip())}'````")
    input("Next")
    os.rename(os.path.join(basedir, fn), os.path.join(basedir, name.strip()))
