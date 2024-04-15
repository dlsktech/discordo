# discordo
Command that updates Discord (on Debian based distros).

### But what is it for?
This tool was created because Discord neither designed an auto-update, nor added its package to any APT repository or created its own repo (as Spotify has done, for example). Instead, Discord asks every time to download the latest .deb file from their site, which is frustrating. That's why I decided to make a tool that does it for you!


### Install

``` curl https://raw.githubusercontent.com/danielszewczuk/Discordo/main/install.sh | sudo bash - ```

### Usage

``` sudo discordo ```

### Options
`--debug` or `-d` - disables all `/dev/null` statements

Animations from [Silejonu/bash_loading_animations](https://github.com/Silejonu/bash_loading_animations), licensed under [MIT License](https://choosealicense.com/licenses/mit/).