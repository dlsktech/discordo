#!/bin/bash

RC='\033[0m'
RED='\033[31m'
YELLOW='\033[33m'
GREEN='\033[32m'
BLUE='\033[34m'

version=1.0.0
latest=$(curl -fsL 'https://discordo.dlsk.tech/VERSION' || echo $version)

if awk "BEGIN {exit !($version < $latest)}"; then
    printf "%b\n" "${YELLOW}There is a new version of Discordo available. Please run:\n curl -fsSL 'https://discordo.dlsk.tech/install.sh' | sudo bash${RC}"
    exit 1
fi

if ! command -v dpkg &> /dev/null; then
    printf "%b\n" "${RED}This OS is not Debian based.${RC}"
    exit 1
fi

debug_mode=false

while (("$#")); do
    case "$1" in
    -d | --debug)
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
    printf "%b\n" "${BLUE}Debug mode is on.${RC}"
    output='/dev/stdout'
else
    output='/dev/null'
fi

if [ "$(id -u)" != "0" ]; then
    printf "%b\n" "${RED}Discordo requires root access.${RC}"
    exit 1
fi

echo 'Downloading the latest version of Discord...'
tempfile="discord-$(date +%s).deb"
curl -fsL 'https://discord.com/api/download?platform=linux&format=deb' -o "$tempfile" || echo 'Failed to download Discord'
echo 'Installing the latest version of Discord...'
dpkg -i "$tempfile" &> $output
rm "$tempfile"
printf "%b\n" "${GREEN}Done! You now have the latest version of Discord!${RC}"
