#!/bin/bash
#Hello

folder="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/caribbeancom/**"

shopt -s globstar nullglob
for dir in $folder;do
    #echo "$dir" # dir is directory only because of the / after **
    filename=$(basename -- "$dir")
    dirname=$(dirname -- "$dir")
    ext="${filename##*.}"
    filename="${filename%.*}"
    echo "----------------------------------------"
    echo "EN: $ext" 
    echo "FN: $filename" 
    echo "DI $dirname" 

    if [[ -d "${dir}" ]];
    then
        echo "${dir} is directory"
	continue
    else
       echo "${dir} is not a directory"
    fi


    if [ ${ext} != "mp4" ] && [ ${ext} != "mkv" ]; then
	    echo "Skipping Extension not supported ${ext} $filename "
	    continue
    fi

    if [[ "${filename,,}" =~ "caribbeancom" ]]; then
	    echo "FOUND CARRIB"
    fi

    echo " Dir : $dir"

    res=$(ffmpeg -v trace -i "${dir}"  2>&1 | grep -e type:\'mdat\' -e type:\'moov\' | head -n 1)

    echo "Res: $res"
    if [[ "${res}" =~ "moov" ]]; then
	    echo "FOUND MOOV"
	    continue
    fi
    if [[ ! "${res}" =~ "mdat" ]]; then
	    echo "Expected MDAT"
	    continue
    fi

    echo "-Converting moov-- ${dirname}/${filename}-f.${ext}"
    sleep 10
    ffmpeg -i "${dir}" -vcodec copy -acodec copy -movflags faststart "${dirname}/${filename}-f.${ext}"
    if [[ $? != 0 ]]; then
	    echo "MOOV CONV FAILED"
	    echo "moov failed,$dir" >> moov_errors.log
	    continue
    fi
    echo "Deleting ${dir}"
    gio trash "${dir}"
    echo "Trash result $?"
    echo "Renaming ${dirname}/${filename}-f.mp4"
    mv "${dirname}/${filename}-f.mp4" "${dirname}/${filename}.${ext}"
    if [[ $? != 0 ]]; then
    	echo "Move FAILED result $?"
	echo "move failed,$dir" >> moov_errors.log
	continue
    fi

    echo "Sleep..."
    sleep 5
done
