#!/bin/bash

version=1.0.0
latest=$(curl -fsL 'https://discordo.dlsk.tech/VERSION' || echo $version)

if awk "BEGIN {exit !($version < $latest)}"; then
    echo 'There is a new version of Discordo available. Please run:'
    echo "curl -fsSL 'https://discordo.dlsk.tech/install.sh' | sudo bash"
    exit 1
fi

if ! command -v dpkg &> /dev/null; then
    echo 'This OS is not Debian based.'
    exit 1
fi

debug_mode=false

while (( "$#" )); do
    case "$1" in
        -d|--debug)
            debug_mode=true
            shift
            ;;
        *)
            PARAMS="$PARAMS $1"
            shift
            ;;
    esac
done

if $debug_mode; then
    echo 'Debug mode is on.'
    output='/dev/stdout'
else
    output='/dev/null'
fi

if [ "$(id -u)" != "0" ]; then
    echo "This script requires root access."
    exit 1
fi

echo "Downloading newest version of Discord..."
tempfile="discord-$(date +%s).deb"
curl -fsL 'https://discord.com/api/download?platform=linux&format=deb' -o "$tempfile" || echo 'Failed to download Discord'
echo "Installing latest version of Discord..."
dpkg -i "$tempfile" &> $output
echo "Done! You now have the latest Discord version!"
rm "$tempfile"
