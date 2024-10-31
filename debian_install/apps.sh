#!/bin/bash
HOME=/home/feldmann/
APPS=$HOME/Applications
SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
if [ -d $APPS ]; then
    exit 0
fi
mkdir -p $APPS
# Bytecode viewer
wget https://github.com/Konloch/bytecode-viewer/releases/download/v2.9.22/Bytecode-Viewer-2.9.22.jar -O $APPS/Bytecode-Viewer.jar
# RuneLite
wget https://github.com/runelite/launcher/releases/download/2.1.0/RuneLite.AppImage -O $APPS/RuneLite.AppImage
chmod +x $APPS/Runelite.AppImage
# Copia os .desktop
cp -n $SCRIPT_DIR/apps/*.desktop $HOME/.local/share/applications
