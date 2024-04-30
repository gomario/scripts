#!/bin/bash
SRC="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/jav/caribbeancom"
#input="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/jav/caribbeancom/next"
TARGET="/home/mario/dwhelper"
input=$1
echo "Input-->$input"
while IFS= read -r line
do
  echo "Looking for $line"
  if ls $SRC/${line}* 1> /dev/null 2>&1; then
        ls $SRC/${line}*
        echo "files do exist"
  else
      echo "files do not exist"
      url="https://en.caribbeancom.com/eng/moviepages/${line}/index.html"
      echo $url
    #get title
      tmp=$(wget -qO- "${url}" | perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*<\/title/si')
      title=${tmp%-*} #get part before '-'
      echo "titel $title"
      f="$TARGET/$line-$title.txt"
      echo "writing '$f'"
      touch "$f"
      /usr/bin/firefox --new-tab ${url}
      sleep 1 
fi

done < "$input"

