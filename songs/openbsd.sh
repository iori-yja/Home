#!/bin/bash

for x in $(seq $1 $2)
do
	notify-send OpenBSD:$x
	mplayer	song$x.ogg
done

