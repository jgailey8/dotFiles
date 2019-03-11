## core packages
```
sudo pacman -S networkmanager nginx php php-fpm trash-cli gvim rxvt-unicode urxvt-perls chromium htop git stow neovim python-neovim python2-neovim gvim mlocate ranger nodejs npm zsh zsh-completions xterm xsel diff-so-fancy xautolock
```
## yaourt
```
nerd-font-hack
light-git
private-internet-access
visual-studio-code
adminer

```
# [vs-code](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
   using vs code extension settings-sync to manage settings/keybinds etc..
## public gist
   * d58b5ae82409ce855f4c6028b25fa493
1. install plugin
2. go to github.com and settings to lookup gist id
3. Press Shift + Alt + D it will ask your github Gist ID.
4. Dowload settings!

# dotnet
```
yaourt dotnet-sdk aspnet-runtime
```
# node, javascript, typescript
## set environment varialbs and path for global npm packages
    export npm_config_prefix=~/.node_modules
    PATH="$HOME/.node_modules/bin:$PATH"
## packages
```
npm install -g browser-sync typescript typescript-language-server vscode-css-languageserver-bin instant-markdown-d prettier javascript-typescript-langserver create-react-app jsonlint
```
### some other packages
```
npm install -g @angular/cli nativescript js-beautify
```

# nginx/php
/etc/nginx/php.conf
```
location ~ \.php$ {
   fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;
   fastcgi_index index.php;
   include fastcgi.conf;
}
```
/etc/nginx/nginx.conf
```
    server {
        listen       80;
        server_name  localhost;
        include php.conf;
        root /srv/http;
        # deny access to .htaccess files, if Apache's document root
        location ~ /\.ht {
            deny  all;
        }
    }
```
### https://stackoverflow.com/questions/46031491/nginx-on-fedora-26-could-not-build-optimal-types-hash-error-message
add to http block
types_hash_max_size                4096;

# nginx multiple servers
/etc/nginx.conf in http section add 
include sites-enabled/*;

```
mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled
```
## adminer
/etc/nginx/sites-avaliable/adminer
```
	server {
		listen 90;
		server_name db.location;
		include php.conf;
		root /usr/share/webapps/adminer;

		# If you want to use a .htpass file, uncomment the three following lines.
		#auth_basic "Admin-Area! Password needed!";
		#auth_basic_user_file /usr/share/webapps/adminer/.htpass;
		#access_log /var/log/nginx/adminer-access.log;

		error_log /var/log/nginx/adminer-error.log;
		location / {
			index index.php;
			try_files $uri $uri/ /index.php?$args;
		}
	}
```
### enable servers
```
ln -s /etc/nginx/sites-available/adminer /etc/nginx/sites-enabled/adminer
```
### /etc/hosts
```
127.0.0.1   localhost
127.0.0.1:90   db.localhost
```

### phpmyadmin easiest method is just to create symlink
```
ln -s /usr/share/webapps/phpMyAdmin/ /srv/http/phpmyadmin
```
# mysql(mariadb) etc..
## disable cow before installing(if on btrfs)
```
mkdir /var/lib/mysql
chattr +C /var/lib/mysql #disable copy-on-write
sudo pacman -S mysql
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
systemctl start mysqld
mysql_secure_installation
```
### php extension
enable mysqli extension in /etc/php/php.ini

# ms-sql
```
yaourt mssql-server mssql-tools
sudo /opt/mssql/bin/mssql-conf setup
```
## php extension
```
yaourt php-sqlsrv
```
enable extension=sqlsrv in /etc/php.ini

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
## Vm's
    use virt-manager or command line qemu
    add user to libvirt 
    enable libvirtd
    install ebtables and dnsmasq for default networking

## Docker

