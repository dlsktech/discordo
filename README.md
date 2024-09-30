# discordo
Command that updates Discord (on Debian based distros).

### But what is it for?
This tool was created because Discord neither designed an auto-update, nor added its package to any APT repository or created its own repo (as Spotify has done, for example). Instead, Discord asks every time to download the latest .deb file from their site, which is frustrating. That's why I decided to make a tool that does it for you!

### Install

```bash
wget -O - https://discordo.dlsk.tech/install.sh | sudo bash -
```

### Usage

``` sudo discordo [OPTIONS] ```

### Options
`--debug` or `-d` - disables all `/dev/null` statements

### Uninstall
To uninstall discordo use the following command: `sudo rm -rf /usr/bin/discordo`
