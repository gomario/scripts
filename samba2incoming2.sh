#!/bin/bash"/disks/backup_alpha/plex/vidlib/Movies/TV Shows"

#
# Move data from samba dropbox to destination
#
SAMBA_LOC="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/samba"
LOG_LOC="/home/mario/scripts/logs"
#SAMBA_LOC="/home/mario/scripts/test"
SAMBA_XXX_INCOMING="incoming"
SAMBA_PLEX_MOVIE_IN="2plex-movies"
SAMBA_PLEX_TV_IN="2plex-tv"

DEST_XINCOMING="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/incoming_samba"

#DEST_PLEX_MOVIES="/media/mario/backup_alpha/plex/vidlib/Movies"
#DEST_PLEX_TV="/media/mario/backup_alpha/plex/vidlib/TV Shows"
DEST_PLEX_MOVIES="/mnt/backup_alpha/plex/vidlib/Movies"
DEST_PLEX_TV="/mnt/backup_alpha/plex/vidlib/TV Shows"

#Test folders
SAMBA_TEST_IN="test"
DEST_TEST="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/incoming_test"

ISRUNNING_FLAG_FILE=/home/mario/scripts/logs/samba_flagfile

#DEST=$DESTINATION_DIR
DESTINATION_DIR=$DEST_XINCOMING/$(date +%Y%m%d)
#DESTINATION_DIR=$DEST_TEST/$(date +%Y%m%d)
SRC=${SAMBA_LOC}/${SAMBA_XXX_INCOMING}
#Copy to todays folder


#create test data
if [ ! -z "$1" ]; then 
  echo "TEST MODE "
  DESTINATION_DIR=$DEST_TEST/$(date +%Y%m%d)
  echo "Clearing all files ifrom destination $DESTINATION_DIR"
  rm -rf $DESTINATION_DIR
  sleep 2
  SRC=${SAMBA_LOC}/${SAMBA_TEST_IN}
  mkdir -p ${SRC}/testfolder
  mkdir -p ${SRC}/testfolder2
  mkdir -p ${SRC}/"test folder"
  touch ${SRC}/testfolder/foobar1.mp4
  touch ${SRC}/testfolder/foobar2.mp4
  touch ${SRC}/testfolder2/foobar3.mp4
  touch "${SRC}/test folder/foobar3.mp4"
  rm $ISRUNNING_FLAG_FILE 
fi
echo "NON TEST MODE "

function create_folders () {
  mkdir -p ${SAMBA_LOC}/${SAMBA_TEST_IN}
  mkdir -p ${DEST_TEST}
  echo "Created test folders" 
}

function post_diskspace () {
  ds=$(df -hP /media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2 | awk '{print $4}' |tail -1|sed 's/%$//g')
  rm ${SRC}/*_diskspace
  touch "$SRC/${ds}_diskspace"
  echo "Diskspace ${ds}"
}

function clean_it () {
  echo "Clean '$1' ?"
}

function create_dest_folder () {
  mkdir -p $DESTINATION_DIR
}

function transfer_files () {
  echo "Destination $DESTINATION_DIR"
  echo "Log $SAMBA_LOC/rsync.log"
  echo "Source $SRC"

 
  for f in $(find $SRC -name '*.*' -or -name '*.doc'); do 
    echo "mydir  $f" 
  done
  for afile in ${SRC}/*;do
    echo "Dirring: $afile"
  done
  
  for afile in ${SRC}/**;do
  #for afile in $(find $SRC -name '*.*' -or -name '*.doc'); do 
  #for afile in $(find $SRC -name '*'); do 
    echo "Data-> $afile"
    sleep 2

    #Delete unwanted files
    rm *.tmb
    rm *.cont
    rm *.pmpd
    
    SUB='_diskspace'
    if [[ "$afile" == *"$SUB"* ]]; then
      echo "Skipping metadata"
      continue
    fi
    


    #clean_it "$afile"

    #hash="$(echo -n "$md5" | md5sum ${afile} | cut  )"
    #hash=`md5sum ${afile} | awk '{ print $1 }'`
    #echo "md5 is $hash"
    #hash=`md5sum ${DESTINATION_DIR}/${afile} | awk '{ print $1 }'`
    #echo "md5 is $hash"
    
    #cmd="rsync --remove-source-files --log-file=${SAMBA_LOC}/rsync.log -avzhv --exclude='*.tmb' --exclude='*.cont' --exclude='*.pmpd' '${afile}' ${DESTINATION_DIR}"
    cmd='rsync --log-file=${SAMBA_LOC}/rsync.log -avhv --exclude="*.tmb" --exclude="*.cont" --exclude="*.pmpd" "${afile}" "${DESTINATION_DIR}"'
    echo $cmd
    rsync --remove-source-files --log-file=${SAMBA_LOC}/rsync.log -avhv --exclude="*.tmb" --exclude="*.cont" --exclude="*.pmpd" "${afile}" "${DESTINATION_DIR}"
    ec=$?
    echo "rsync rc $ec"
    if [ "$ec" -eq "0" ] ; then
      echo "Removing dir ${afile}"
      rmdir "${afile}"
    fi
  done
}

function cleanup () {
  files=$(shopt -s nullglob dotglob; echo $SRC/*)
  has_files="0"
  if (( ${#files} ))
  then
    echo "contains files"
    has_files="1"
  else 
    echo "empty (or does not exist or is a file)"
  fi

  #
  # This should only delete a file if its in teh det folder and md5sums match
  #
  #if [ "$has_files" -eq "1" ] ; then  
  #  echo "Clearing ${SRC}"
  #  rm -rf $SRC/* 
  #fi
}

post_diskspace
create_folders

if [[ -f "$ISRUNNING_FLAG_FILE" ]]; then
    echo "$ISRUNNING_FLAG_FILE exist - cron still running"
    exit
fi

if [ -z "$(ls -A ${SRC})" ]; then
   echo "Empty $SRC"
   exit
fi


touch $ISRUNNING_FLAG_FILE

transfer_files

echo "Checking destination: "
ls $DESTINATION_DIR/* 
echo "-- end dest dir --"


#cleanup

#DEST=$DEST_PLEX_MOVIES
#SRC=${SAMBA_LOC}/${SAMBA_PLEX_MOVIE_IN}
#transfer_files
#cleanup

rm ${ISRUNNING_FLAG_FILE}
echo "All done!"
