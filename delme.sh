LOC="/media/mario/9132348f-1ad2-4e9b-aa19-d0e87f4e78c2/samba/2plex-movies"
files=$(shopt -s nullglob dotglob; echo $LOC/*)
if (( ${#files} ))
then
  echo "contains files"
else 
  echo "empty (or does not exist or is a file)"
fi
