#!/bin/bash

folder=(/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/transcoding/completed/*)

shopt -s globstar nullglob
for dir in /media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/transcoding/completed/**;do
    #echo "$dir" # dir is directory only because of the / after **
    filename=$(basename -- "$dir")
    dirname=$(dirname -- "$dir")
ext="${filename##*.}"
#filename="${filename%.*}"
    #echo $filename $extension 

    out=$(echo ${dir} |grep -Eo '[[:digit:]]{2}-[[:digit:]]{2}-[[:digit:]]{4}')
    #echo $dir |grep -Eo '[[:digit:]]{2}-[[:digit:]]{2}-[[:digit:]]{4}'
echo
    #echo "$dir"
    strlen=$(echo -n $out | wc -m)
    if [ $strlen != "10" ]; then 
    #echo "dir $strlen    $dir"
        continue
    fi

    newdir="$dirname/$out"
    mkdir $newdir
    mv -v $dir $newdir/.
    #sleep 4
done
