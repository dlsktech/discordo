clear
if [ "$(id -u)" != "0" ]; then
    echo "This script requires root acces."
    exit 1
fi

file="/usr/bin/discordo"

if [ -f "$file" ]; then
    echo "Detected old version of Discordo. Removing..."
    rm -rf $file
fi

file="/usr/discordo"

if [ -f "$file" ]; then
    echo "Detected old version of Discordo. Removing..."
    rm -rf $file
fi

cd /usr/bin
sudo curl https://raw.githubusercontent.com/danielszewczuk/Discordo/main/discordo.sh --output discordo
sudo chmod +x discordo
echo "Installed Discordo!"