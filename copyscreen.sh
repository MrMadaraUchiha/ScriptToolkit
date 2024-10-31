#!/bin/bash
spectacle -br -o /tmp/copyshot.png 
xclip -sel clip -t image/png /tmp/copyshot.png
