dest="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/samba/xinternal"
mkdir -p ${dest}
rm ${dest}/*


files=(/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/xxx/*)
n=${#files[@]}
for i in {0..5}
do
    file_to_retrieve="${files[RANDOM % n]}"
    echo $file_to_retrieve
    cp -v "${file_to_retrieve}" ${dest}/
done

