#!/bin/bash

SCENE_DIR="/workspace/SCENES"

if [ -z "$1" ]; then
  echo "No arguments provided"
elif [ -z "$1" ] || [ -z "$2" ]; then
  echo "No file or token provided"
else
  7z a -mx0 -bt $SCENE_DIR/$1.7z $SCENE_DIR/$1
  python3 /workspace/SCRIPTS/dropbox_tools.py --filename $1.7z --token $2
fi
