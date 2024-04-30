url=$1
ffmpeg -allowed_extensions ALL -i "${url}" -codec: copy  -map 0:1  -map 0:0 foo.mp4

