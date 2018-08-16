#!/bin/sh
# Parse key-val args.

send() {
	notify-send -u low -i multimedia-volume-control -t 2000 "$1" "$2"
}

while test $# -ge 2 ; do
	eval _$1='$2'
	shift
	shift
done

if test -n "$_file"; then # local file
	h=$(($_duration / 3600))
        m=$(($_duration % 3600))
 
	position=$(cmus-remote -Q | grep -w position | cut -d" " -f 2-)
	position="$dur$(printf '%02d:%02d' $(($position / 60)) $(($position % 60)))"
        duration=""
        test $h -gt 0 && dur="$h:"
        duration="$dur$(printf '%02d:%02d' $(($m / 60)) $(($m % 60)))"
	
	send "$_title" "<b>$_artist - $_album</b>\n$position/$duration [$_status]"
elif test -n "$_url"; then
	send "$_title" "$_url [$_status]"
else
	send "$_title" "[$_status]"
fi
