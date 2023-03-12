# DONT ACTUALLY RUN THIS AS A SCRIPT

# rename flac files as per the standard <track number> - <track name>
lltag --rename %n\ -\ %t *.flac

# encode as ogg
oggenc -q 8 *.flac
# encode and delete
for f in *.flac; do oggenc -q 8 $f; rm $f; done
# use find instead
find . -name "*.flac" -exec oggenc -q8 {} \;
# encode and delete in subfolder
for f in *; do oggenc -q 8 $f/*.flac; rm $f/*.flac; done
# clean up file names (dry run)
detox -s mysafe -rn .
# clean up file names (actual)
detox -s mysafe -rv .
# find album art (600x600) for all subfolders
sacad_r . 600 cover.jpg

# for loop with truncate example
for f in *.m4a; do ffmpeg -i $f -map 0:0 -f flac -compression_level 8 "${f%.*}.flac";done

# run program in background (eg when ssh'd)
nohup command > /dev/null 2>&1 &

# convert 5.1 to stereo and encode as aac:
ffmpeg -i <file> -c:a aac -af "pan=stereo|c0=c2+0.30*c0+0.30*c4|c1=c2+0.30*c1+0.30*c5" -b:a 384k <file_out>.aac
ffmpeg -i <file> -c:a flac -af "pan=stereo|c0=c2+0.30*c0+0.30*c4|c1=c2+0.30*c1+0.30*c5" -sample_fmt s16 -compression_level 8 <file>.flac
# remove non-english streams
ffmpeg -i <file> -map 0:m:language:eng -c copy <file>
# audio out to flac 16 bit



# 1. convert video
# 2. convert dts to aac as separate file
# 3. reinsert aac audio stream
# https://superuser.com/questions/800234/how-to-replace-an-audio-stream-in-a-video-file-with-multiple-audio-streams
for f in *.mkv; do ffmpeg -i $f -c:v libx265 -preset medium -crf 22 -c:a copy -c:s copy -map 0 "${f%.*}_x265.mkv"; trash $f; done
for f in *.mkv; do ffmpeg -i $f -map 0:1 -c:a aac -af "pan=stereo|c0=c2+0.30*c0+0.30*c4|c1=c2+0.30*c1+0.30*c5" -b:a 384k "${f%.*}.aac"; done
for f in *.mkv; do ffmpeg -i $f -i "${f%.*}.aac" -map 0:v -map 1:a -map 0:a:1 -map 0:s -c copy "${f%.*}_aac.mkv"; done

# mount android file system
jmtpfs ~/mnt
