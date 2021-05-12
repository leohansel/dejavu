input=$1
output=$2

ffmpeg -i "$input" -vn -acodec pcm_s16le -ar 16000 -ac 1 "$output"