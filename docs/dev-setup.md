# some packages to grab
  pacman -S docker 
# [vs-code](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
   using vs code extension settings-sync to manage settings/keybinds etc..
## public gist
   * d58b5ae82409ce855f4c6028b25fa493
1. install plugin
2. go to github.com and settings to lookup gist id
3. Press Shift + Alt + D it will ask your github Gist ID.
4. Dowload settings!

# dotnet
## install dotnet,dotnet-sdk,dotnet-cli from aur
    requires patch for openssl-1.0
## Vim Omnisharper
    1. install omnisharp-roslyn from aur
### [opnessl fix](https://github.com/OmniSharp/omnisharp-roslyn/issues/600)
    2. delete System.Runtime.InteropServices.RuntimeInformation.dll from /opt/omnisharp-roslyn
### ominsharp roslyn server does not autostart
    vim calls script omnisharp(make sure script is in path somewhere) to fix this
    3. have vim start roslyn from /opt/omnisharp-roslyn
#### or [create symbolic link](https://github.com/OmniSharp/omnisharp-vim/issues/306)

# node, javascript, typescript
## set environment varialbs and path for global npm packages
    export npm_config_prefix=~/.node_modules
    PATH="$HOME/.node_modules/bin:$PATH"

### some npm packages i like to have
    npm install -g @angular/cli nativescript typescript js-beautify create-react-app 
    npm install -g eslint eslint eslint-config-standard eslint-config-standard-jsx
    npm install -g yo geneator-aspnet generator-aspnet-item

# nginx, php, mysql(mariadb) etc..
## disable cow before installing(if on btrfs)
     mkdir /var/lib/mysql
     chattr +C /var/lib/mysql
##  pacman -S nginx php php-fpm mysql phpmyadmin
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    systemctl start mysqld
    mysql_secure_installation
### mysql
    enable mysqli extension in /etc/php/php.ini
### phpmyadmin easiest method is just to create symlink
    ln -s /usr/share/webapps/phpMyAdmin/ /srv/http/phpmyadmin

# [android](https://wiki.archlinux.org/index.php/android#Android_development)
## allow running as regular user
    1. groupadd sdkusers
    2. gpasswd -a <user> sdkusers
    3. chown -R :sdkusers /opt/android-sdk/
    4. chmod -R g+w /opt/android-sdk/
    5. newgrp sdkusers
## get packages
    yaourt -S android-platform android-sdk android-sdk-platform-tools android-sdk-build-tools android-udev-git
## create virtual machine
    1. get system images
        sdkmanager "system-images;android-25;google_apis;x86"
    2. create avd
        avdmanager create avd --force --name avd-25 --package 'system-images;android-25;google_apis;x86'
## Docker

## Vm's
    use virt-manager or command line qemu
    add user to libvirt 
    enable libvirtd
    install ebtables and dnsmasq for default networking
