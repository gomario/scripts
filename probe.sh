#!/bin/bash
d="/disks/backup_alpha/plex/vidlib/"
#for fname in /Volumes/Untitled/videolib/*; do

#IFS=$'\n' eval 'for i in `find /disks/backup_alpha/plex/vidlib/. -type f -name "*"`;do echo ">>>$i";done'

find $d/. -print0 | while read -d $'\0' file
do
    if [[ -d $file ]]; then
        echo "$file is a directory"
    else
        echo "$file is a file"
        echo -v "$file"
        #ffprobe -i "${file}"
        ffprobe -v quiet -show_streams -i "${file}" -show_packets -print_format csv | awk -F',' 'NR==1 {if ($5) a=$5; next} {if ($5 - a > 10 && $5 - a < a) print a", " $5", gap: " $5 - a; a=$6}'
    fi
done
exit
for fname in /Volumes/Untitled/Videos/*; do




    echo "$fname"
    ffprobe -v quiet -show_streams -i "${fname}" -show_packets -print_format csv | awk -F',' 'NR==1 {if ($5) a=$5; next} {if ($5 - a > 10 && $5 - a < a) print a", " $5", gap: " $5 - a; a=$6}'
    ## get status ##
    status=$?
    echo "status $status"
    ## take some decision ##
    [ $status -eq 0 ] && echo "$cmd command was successful" || echo "$cmd failed"
    sleep 5
done
