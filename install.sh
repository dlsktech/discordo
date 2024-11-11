#! /bin/bash

clear

RC='\033[0m'
RED='\033[31m'
YELLOW='\033[33m'
GREEN='\033[32m'
BLUE='\033[34m'

if [ "$(id -u)" != "0" ]; then
    printf "%b\n" "${RED}This script requires root acces.${RC}"
    exit 1
fi

files=('/usr/bin/discordo' '/usr/discordo')

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        printf "%b" "${YELLOW}Detected Discordo in $file. Remove? (Y/n)${RC} "
        read -r remove
        case $remove in
        n|N)
            printf "%b\n" "${BLUE}Skipping.${RC}"
            ;;
        *)
            rm "$file"
            ;;
        esac
    fi
done

if [ ! -d "/usr/bin" ]; then
    mkdir -p /usr/bin
    export PATH="$PATH:/usr/bin"
    echo "%b\n" "${YELLOW}Make sure to add /usr/bin to $PATH.${RC}"
fi

curl -fsL 'https://discordo.dlsk.tech/discordo.sh' -o /usr/bin/discordo || echo 'Failed to download Discordo'
sudo chmod +x /usr/bin/discordo
echo "${GREEN}Discordo installed!${RC}"
