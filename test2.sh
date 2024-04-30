rsync --remove-source-files -avzhv --exclude='*.tmb' --exclude='*.cont' --exclude='*.pmpd' /tmp/in2/ /tmp/destX
echo $?
