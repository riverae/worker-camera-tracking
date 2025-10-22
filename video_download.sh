#!/bin/bash

if [ -z "$1" ]; then
  echo "No index or token provided."
elif [ -z "$1" ] || [ -z "$2" ]; then
  python3 /workspace/SCRIPTS/dropbox_tools.py --token $1
  echo "No index provided."
else 
  python3 /workspace/SCRIPTS/dropbox_tools.py --index $1 --token $2
fi
