#!/bin/bash

UNPACKER=~/games/starbound/1.4.4/starbound/linux/asset_unpacker #change to your location as needed
SOURCEDIR=source

if [ -d $SOURCEDIR ]; then
	rm -rf $SOURCEDIR
fi

mkdir $SOURCEDIR
cd $SOURCEDIR

find ../source-binaries -type f | while read f
do
	echo Processing $f
	name=$(basename "$f")
	$UNPACKER "$f" "$name"
done

