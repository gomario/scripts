#!/bin/bash
SRC="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/jav/caribbeancom"
input="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/jav/caribbeancom/next"
TARGET="/home/mario/dwhelper"

#walk all mp4 files downloaded
for fname in $TARGET/*.mp4; do
  echo "Read mp4 filw '$fname'"

    #extract parts
    filename=$(basename -- "$fname")
    extension="${filename##*.}"
    SUB="${filename%.*}"
    title=${SUB%-*} #get part before '-'

    echo "*********------------***********"
    #Walk all txt files in download dir
    for fdoc in $TARGET/*.txt; do
        echo "Txt Read: '$fdoc'"
        filename=$(basename -- "$fdoc")
        extension="${filename##*.}"
        STR="${filename%.*}"

        echo "Downloaded title: '$title' Txt file read: '$STR' SUB '$SUB' "
        if [[ "$STR" == *"$SUB"* ]]; then
            echo "FOUND MATCH"
            sleep 3
            break
        fi
    done

done
