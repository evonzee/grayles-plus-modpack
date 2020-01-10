#!/bin/bash

PACKER=~/games/starbound/1.4.4/starbound/linux/asset_packer #change to your location as needed
SOURCEDIR=source
OUTPUT=bin

if [ -d $OUTPUT ]; then
	rm -rf $OUTPUT
fi

mkdir $OUTPUT
cd $OUTPUT

find ../$SOURCEDIR -maxdepth 1 -type d -name "*.pak"| while read d
do
	echo Processing $d
	name=$(basename "$d")
	$PACKER "$d" "$name"
done

