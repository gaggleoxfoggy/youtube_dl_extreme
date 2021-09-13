#!/bin/bash

cd "$(dirname "$0")"

PLATFORM="$(uname)"
echo $PLATFORM

function prepare_virtualenv_mac {
    # Check to see if Homebrew is installed, and install it if it is not
    command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew..."; \
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

    brew install ffmpeg --with-fdk-aac --with-tools --with-freetype --with-libass --with-libvorbis --with-libvpx --with-x265
    brew install youtube-dl
    brew upgrade ffmpeg
    brew upgrade youtube-dl

    echo Installing Python 3...
    brew install python3
    echo Installing certificates...
    ./Install\ Certificates.command
}

function prepare_virtualenv_linux {
    echo Installing Python 3...
    sudo apt install python3-dev
}

# Ensure virtualenv exists, create it if it doesn't
echo Looking for virtualenv...
if [ -d .env ]; then
    if [ ! -f .env/bin/python3 ]; then
        sudo rm -r .env
    fi
fi

if [ ! -f .env/bin/python3 ]; then
    echo Virtualenv not found...
    echo Preparing virtualenv...
    if [ "$PLATFORM" = "Darwin" ]; then
        prepare_virtualenv_mac
    elif [ "$PLATFORM" = "Linux" ]; then
        prepare_virtualenv_linux
    fi
    echo Creating virtualenv
    ./create_virtualenv.sh
fi

# Ensure youtube-dl python package is up to date
echo Upgrading dependencies...
.env/bin/pip install --upgrade -r requirements.txt
