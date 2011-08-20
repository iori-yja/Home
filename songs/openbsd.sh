#!/bin/dash

if test -z $1
then
	export p=31
	export q=49
else
	export p=$1
	export q=$2
fi

while true
do
	
	for x in $(seq $p $q)
	do
		notify-send OpenBSD:$x
		mplayer	song$x.ogg
	done
done

