dest="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/samba/xinternal"
mkdir -p ${dest}
#rm -vrf ${dest}/*


mkdir ${dest}/xxx
mkdir ${dest}/webrip
mkdir ${dest}/d2pass
mkdir ${dest}/random
mkdir ${dest}/hot

#hot="072820-001 041013-309 020416-089 091914-001 022316-102 102220-001 041316-136 082517-486 110620-001 092816-269 072415-928 122719-001 010517-343 010510-262 090816-252"
#BASEDIR="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2"
#for fileid in $hot; do
#    files=(${BASEDIR}/caribbeancom/*${fileid}*)
#    echo "Found $files"
#    mv -v "$files" /media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/caribbeancom/hot
#done
#exit

#
# Copy carrib HOT folder
#
#cp -rv /media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/caribbeancom/hot/* ${dest}/hot
echo "Done with hot"

#
# Cop over random 
#
function random {
    files=(/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/caribbeancom/*)
    echo "Files: $files"
    n=${#files[@]}
    echo "Found $n files"
    for i in {0..35}
    do
        #IFS=$(echo -en "\n\b")
        file_to_retrieve="${files[RANDOM % n]}"
        echo $file_to_retrieve

        #if [[ -d $file_to_retrieve ]]; then
        #    echo "$file_to_retrieve is a directory"
        #    continue
        #fi
#
        #if [[ -f "$file_to_retrieve" ]]; then
       #     echo "$file_to_retrieve exists."
       #     continue
       # fi
        echo "$file_to_retrieve did not exist."

        cp -rvn "${file_to_retrieve}" ${dest}/random/
    done
    echo "Done with carrib"
}


function d2pass {
    files=(/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/webrip-carib )
    n=${#files[@]}
    for i in {0..19}
    do
        file_to_retrieve="${files[RANDOM % n]}"
        echo $file_to_retrieve
        cp -rnv "${file_to_retrieve}" ${dest}/d2pass/
    done
    echo "Done with d2pass"
}

function webrip { 
files=(/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/webrip/*)
n=${#files[@]}
for i in {0..5}
do
    file_to_retrieve="${files[RANDOM % n]}"
    echo $file_to_retrieve
    cp -rnv "${file_to_retrieve}" ${dest}/webrip/
done
echo "Done with webrip"
}

#
# Copy Random XXX
#
function xxx {
files=(/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/xxx/*)
n=${#files[@]}
for i in {0..5}
do
    file_to_retrieve="${files[RANDOM % n]}"
    echo $file_to_retrieve
    cp -rnv "${file_to_retrieve}" ${dest}/xxx/
done
echo "Done with xxx"
}

d2pass
#random
#xxx
#hot
webrip
