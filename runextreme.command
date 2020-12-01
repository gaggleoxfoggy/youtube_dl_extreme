#!/bin/bash

cd "$(dirname "$0")"

echo Pulling latest version of youtube_dl_extreme_edition...
git pull origin master

./prepare_virtualenv.sh

# Run
./youtube_dl_extreme.py "$@"
