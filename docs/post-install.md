# Table of Contents

- [Post Install](#post-install)
  - [zsh](#zsh)
  - [User Dirs](#user-dirs)
  - [Urxvt](#urxvt)
  - [Vim](#vim)
    - [Language Servers](#language-servers)
- [Dev Tools](#dev-tools)
  - [javascript](#javascript)
  - [android](#android)
  - [dotnet]([[#dotnet]])
  - [Other Tools](#other-tolls)
  - [Docker](#docker)
  - [Virt Manager](#virt-manager)
  - [Web Server](#web-server)
  - [MongoDb](#mongodb)
  - [Ruby](#ruby)
- [Sway](#sway)
- [i3](#i3)
- [VPN](#vpn)
- [Power Management](#power-management)
- [Video Drivers](#video-driver)

## Post Install

### zsh

```bash
sudo pacman -S zsh zsh-completions python-psutil
chsh -s /bin/zsh
git clone https://github.com/tarjoilija/zgen.git "\${HOME}/.zgen"

### User Dirs

```bash
sudo pacman -S xdg-user-dirs pcmanfm trash-cli htop diff-so-fancy tldr wget \
                xautolock openssh networkmanager-openvpn tmux rdesktop networkmanager-openconnect
xdg-user-dirs-update
rm -r Templates Desktop Documents Public Videos Music
```

## Urxvt

```bash
yay xsel nerd-fonts-hack urxvt-tabbedex-mina86-git urxvt-font-size-git urxvt-perls
```

## Vim

```bash
sudo pacman -S python-pynvim python2-pynvim vint
```

### Language Servers

> coc-extensions

- coc-tsserver
- coc-css
- coc-omnisharp

> other

- bash-languae-server (npm)
- typescript (npm)

## Sway

```bash
sudo pacman -S sway waybar swayidle mako libappindicator-gtk3
sudo pacman -S slurp grim
```

## i3

```bash
sudo pacman -S i3
```

## Dev Tools

### javascript

```bash
sudo pacman -S nodejs npm
npm install -g browser-sync typescript typescript-language-server \
    instant-markdown-d prettier create-react-app markdownlint-cli
```

### [android](https://wiki.archlinux.org/index.php/android#Android_development)

```bash
yay -S android-platform android-udev
optional android-sdk-build-tools
```

> allow running as regular user

1. gpasswd -a youruser adbusers
2. groupadd sdkusers
3. gpasswd -a <user> sdkusers
4. chown -R :sdkusers /opt/android-sdk/
5. chmod -R g+w /opt/android-sdk/
6. newgrp sdkusers

### dotnet

```bash
wget https://dot.net/v1/dotnet-install.sh
./dotnet-install.sh -channel Current -version latest
./dotnet-install.sh -channel 2.2
#./dotnet-install.sh --install-dir /opt/dotnet -channel Current -version latest
# add ~/.dotnet to path
```
sudo ./dotnet-install.sh --install-dir /opt/dotnet -channel Current -version latest
sudo ./dotnet-install.sh --install-dir /opt/dotnet -channel 2.2

> or use pacman ?

```bash
sudo pacman -S dotnet-runtime dotnet-sdk
dotnet tool install --global dotnet-watch
```

### Other Tools

```bash
yay visual-studio-code-bin postman-bin azuredatastudio slack-desktop
```

### Docker

```bash
sudk pacman -S docker docker-compose
# add user to docker group
gpasswd -a user docker
```

### Virt Manager

- use virt-manager or command line qemu
- add user to libvirt
- enable libvirtd
- install ebtables and dnsmasq for default networking

### Web Server

```bash
  pacman -S nginx php php-fpm mysql phpmyadmin
```

> disable cow before installing mysql (if on btrfs)

```bash
     mkdir /var/lib/mysql
     chattr +C /var/lib/mysql
```

```bash
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    systemctl start mysqld
    mysql_secure_installation
```

> enable mysqli extension in /etc/php/php.ini

### MongoDb

```bash
# shell/tools only
yay mongodb-tools-bin
yay mongodb-shell-bin
```

### Ruby

```bash
sudo pacman -S ruby
```

## [Vpn](https://wiki.archlinux.org/index.php/Private_Internet_Access_VPN)

```bash
sudo pacman -S networkmanager-openvpn
```

- install networkmanager-openvpn & private-internet-access-vpn
- put username/password into /etc/private-internet-access/login.conf
- run pia -a

## Power Management

```bash
sudo pacman -S tlp
sudo systemctl enable tlp.service
```

### Video Driver

- Early kernal loading
  - add MODULES=(i915) to /etc/mkinitcpio.d
  - mkinitcpio -p linux

### Bug: Chromium dropped frames

> Playing YouTube in VP9 with chromium-vaapi is smooth, <10%CPU is used and no frame drops with libva-intel-driver-hybrid chromium-vaapi

```bash
yay libva-intel-driver chromium-vaapi

# is va driver loaded?
sudo pacman -S libva-utils
vainfo
```

- [Gpu Status](https://chrome://gpu)
  - video decode should hardware acellerated
  - optionally install chrome extension h264ify
- [Flags](https://chrome:flags)
  - enable flag - Override software rendering list

### Other

```bash
# Orphan packages
  sudo pacman -Rns $(pacman -Qtdq)

# Failed Services
  sudo systemctl --failed
```
