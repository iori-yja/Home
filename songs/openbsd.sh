#!/bin/bash
play(){
	for x in $(seq $p $q)
	do
		notify-send OpenBSD:$x
		mplayer	song$x.ogg
	done
}

if test -z $1
then
	echo foo
	export p=31
	export q=49
	play 31 49
elif test -z $2
then
	echo hogehoge
	while true
	do
		play $1 $1
	done	
else
	export p=$1
	export q=$2
	play $p $q
fi

