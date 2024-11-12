#! /bin/bash

clear

if [ "$(id -u)" != "0" ]; then
    echo 'This script requires root acces.'
    exit 1
fi

files=('/usr/bin/discordo' '/usr/discordo')

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "Detected Discordo in $file. Remove? (Y/n)"
        read -r remove
        case $remove in
        n|N)
            echo "Skipping."
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
    echo 'Make sure to add /usr/bin to $PATH'
fi

curl -fsL 'https://discordo.dlsk.tech/discordo.sh' -o /usr/bin/discordo || echo 'Failed to download Discordo'
sudo chmod +x /usr/bin/discordo
echo 'Installed Discordo!'
