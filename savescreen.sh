#!/bin/bash


DIR="${HOME}/screenshots"
if [ ! -d $DIR ]; then
	mkdir $DIR
fi
DATE=`date '+%d-%m-%Y-%H:%M:%S'`
spectacle -br -o "$DIR/$DATE.png" 
