SRC="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/incoming_samba"


 25
files=$(find $SRC -maxdepth 9 -type f -print0 | xargs -0 ls -l)

#files=$(find $SRC  -maxdepth 10 -name '*.pmpd' -o -name '*.cont' -o -name '*.tmb' -type f -not -name watch.log)
#files=$(find $SRC  -maxdepth 10 -type f -not -name watch.log)
echo $f
#exit
for afile in $files; do 
  echo "Afiles $afile"
  #rm $afile
done
exit
dirs=$(find $SRC/*  -maxdepth 10 -type d -not -name watch.log)
for afile in $dirs; do 
  echo "Adir '$afile'"
  sleep 5
  #rm $afile
  if [ -z "$(ls -A $afile)" ]; then
    echo "Empty"
    #rmdir $afile  
  else
    echo "Not Empty"
  fi
done




##for afile in ${SRC}/**;do
###for afile in $(find $SRC -name '*.*' -or -name '*.doc'); do
###for afile in $(find $SRC -name '*'); do
##  echo "$afile"
##done
