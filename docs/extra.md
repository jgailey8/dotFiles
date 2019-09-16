/etc/vconsole.conf
```
KEYMAP=us
FONT=ter-v14b
```
Backup Directory
```
tar -cpzf backup-name.tar.gz \
--exclude=backup-name.tar.gz\
--exclude=.cache \
--exclude=.debug \
--exclude=.dbus \
--exclude=.gvfs \
--exclude=.local/share \
--exclude=.cache \
--exclude=.recently-used \
--exclude=.thumbnails \
--exclude=.xsession-errors \
--exclude=.Trash \
--exclude=.steam \
--exclude=Downloads \
--warning=no-file-changed .
```
