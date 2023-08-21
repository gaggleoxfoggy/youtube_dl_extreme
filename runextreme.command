#!/bin/bash

cd "$(dirname "$0")"

echo Pulling latest version of youtube_dl_extreme_edition...
git stash
git pull origin main

# Prepare Virtual ENV
./prepare_virtualenv.sh

# Run
source .env/bin/activate
./youtube_dl_extreme.py "$@"
