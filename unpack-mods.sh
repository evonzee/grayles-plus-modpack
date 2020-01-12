#!/bin/bash

UNPACKER=~/games/starbound/1.4.4/starbound/linux/asset_unpacker #change to your location as needed
SOURCEDIR=source

if [ ! -d $SOURCEDIR ]; then
	mkdir $SOURCEDIR
fi

cd $SOURCEDIR

find ../source-binaries -type f -name "*.pak" | while read f
do
	name=$(basename "$f")
	echo Processing $name
		
	if [ -d "$name.tmp" ]; then
		echo Removing old temp folder..
		rm -rf "$name.tmp"
	fi

	echo Unpacking mod..
	$UNPACKER "$f" "$name.tmp"

	if [ -d "$name.tmp/.git" ]; then
		echo Removing embedded git..
		rm -rf "$name.tmp/.git"
	fi


	if [ -d "$name" ]; then
		echo Copying mod content to Grayles folder..
		rm -rf "$name"/*
		cp -rav "$name.tmp"/* "$name"
		git -C "$name" add .
	fi

	echo Removing temp file..
	rm -rf "$name.tmp"
done

