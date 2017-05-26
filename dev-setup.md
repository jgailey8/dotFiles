# dotnet
## install dotnet,dotnet-sdk,dotnet-cli from aur
    requires patch for openssl-1.0
## Vim Omnisharper
    install omnisharp-roslyn from aur
### opnessl fix
    delete System.Runtime.InteropServices.RuntimeInformation.dll from /opt/omnisharp-roslyn
### ominsharp roslyn server does not autostart
    https://github.com/OmniSharp/omnisharp-roslyn/issues/600
    manually start roslyn server before working on project or 
    included in vimrc is a function i made to autostart roslyn server

# node, javascript, typescript
## set environment varialbs and path for global npm packages
    export npm_config_prefix=~/.node_modules
    PATH="$HOME/.node_modules/bin:$PATH"

### some npm packages i like to have
    npm install -g @angular/cli typescript js-beautify create-react-app 
    npm install -g eslint eslint-plugin-react eslint-config-airbnb babel-eslint 

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
### phpmyadmin easiest is method is just to create symlink
    ln -s /usr/share/webapps/phpMyAdmin/ /srv/http/phpmyadmin
