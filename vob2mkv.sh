outfile=$1
cat *.VOB > output.vob
#exit
if false; then
    echo "JN"
    #  Duration: 01:49:44.77, start: 0.223733, bitrate: 5478 kb/s
    #    Stream #0:0[0x1bf]: Data: dvd_nav_packet
    #    Stream #0:1[0x1e0]: Video: mpeg2video (Main), yuv420p(tv, top first), 720x480 [SAR 32:27 DAR 16:9], 29.97 fps, 59.94 tbr, 90k tbn, 59.94 tbc
    #    Stream #0:2[0x80]: Audio: ac3, 48000 Hz, stereo, fltp, 192 kb/s
    #    Stream #0:3[0x20]: Subtitle: dvd_subtitle

    ffmpeg \
      -analyzeduration 100M -probesize 100M \
      -i output.vob \
      -map 0:1 -map 0:2 -map 0:3 \
      -metadata:s:a:0 language=eng -metadata:s:a:0 title="English stereo" \
      -metadata:s:s:0 language=eng -metadata:s:s:0 title="English" \
      -codec:v libx264 -crf 21 \
      -codec:a libmp3lame -qscale:a 2 \
      -codec:s copy \
      output.mkv

fi

if true; then
echo "SDSDSDSDSD"

ffmpeg \
  -analyzeduration 100M -probesize 100M \
  -i output.vob \
  -map 0:1 -map 0:2 -map 0:3 -map 0:4 -map 0:5 -map 0:6\
  -metadata:s:a:0 language=eng -metadata:s:a:0 title="English 5.1" \
  -metadata:s:a:1 language=eng -metadata:s:a:1 title="English stereo" \
  -metadata:s:a:2 language=eng -metadata:s:a:2 title="Cracklish stereo" \
  -metadata:s:s:0 language=eng -metadata:s:s:0 title="English" \
  -metadata:s:s:1 language=ita -metadata:s:s:1 title="iCrack" \
  -codec:v libx264 -crf 21 \
  -codec:a libmp3lame -qscale:a 2 \
  -codec:s copy \
  ${outfile}



 Stream #0:0[0x1bf]: Data: dvd_nav_packet
    Stream #0:1[0x1e0]: Video: mpeg2video (Main), yuv420p(tv, smpte170m, progressive), 720x480 [SAR 8:9 DAR 4:3], 29.92 fps, 29.97 tbr, 90k tbn, 59.94 tbc
    Stream #0:2[0x80]: Audio: ac3, 48000 Hz, 5.1(side), fltp, 384 kb/s
    Stream #0:3[0x81]: Audio: ac3, 48000 Hz, stereo, fltp, 192 kb/s
    Stream #0:4[0x82]: Audio: ac3, 48000 Hz, stereo, fltp, 192 kb/s
    Stream #0:5[0x22]: Subtitle: dvd_subtitle
    Stream #0:6[0x20]: Subtitle: dvd_subtitle



fi




