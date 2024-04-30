#!/bin/bash

folder=(/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/tobe/*)

shopt -s globstar nullglob
for dir in /media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/**;do
  if [ -d "$dir" ]; then
      continue
  fi

  #echo "$dir" # dir is directory only because of the / after **
  filename=$(basename -- "$dir")
  ext="${filename##*.}"
  filename="${filename%.*}"
  #echo "$filename ext: $ext" 
  if [ ${ext} == "nfo" ] || [ ${ext} == "tmb" ] || [ ${ext} == "cont" ] || [ ${ext} == "pmpd" ]; then 
    echo "Delete $dir"
    #sleep 2
    #read -p "Press any key to resume ..."
    rm "$dir"
  fi
done
