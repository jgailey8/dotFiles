===fresh install setup notes===
# pre installation setup
##  partition setup - i usually just use gdisk
    partion 1 = 512Mib typeCode="ef00"
    partion 2 = 100%   linuxFilesystem
    mkfs.vfat -F32 /dev/sda1
    mkfs.btrfs -L arch -f /dev/sda2
## create root subvolume
    mount /dev/sda2 /mnt
    cd /mnt
    btfs subvolume create ROOT
##  setup btrfs subvolumes(makes taking snapshots/backup easy)
    umount /dev/sda2
    mount -o ssd,noatime,subvol=ROOT /dev/sda2
    cd /mnt
    btfs subvolume create home
    btfs subvolume create etc
    btfs subvolume create mnt
    ...
    ...
    > don't usualy bother with swap partition or file unless i feel like it
# install
    pacstrap /mnt base base-devel btrfs-progs
    genfstab -U /mnt >> /mnt/etc/fstab

    fstab example with btrfs volume
    UUID={##}	/         	btrfs     	rw,noatime,ssd,subvol=ROOT	0 0

    arch-chroot /mnt /bin/bash
#clock, locale and hostname
    ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
    set en_US.UTF-8 in /etc/locale.gen
        locale-gen
    echo LANG=en_US.UTF-8 > /etc/locale.conf
    echo myhostname > /etc/hostname

#add user and set passwords and configure sudo etc..
    useradd -m -G wheel -s /bin/bash archie
    EDITOR=vim visudo

# install systemd bootloader
    bootctl --path=/boot install
## example entrie wtih btrfs subvol
    title   Arch Linux
    linux   /vmlinuz-linux
    initrd  /initramfs-linux.img
    options root=PARTUUID=## rw rootflags=subvol=ROOT elevator=noop nmi_watchdog=0
### blkid -s PARTUUID -o value /dev/sda2 
# basic core packages i install
    pacman -S xorg-server xorg-server-utils xorg-xinit xf86-video-intel i3 sway alsa-utils gvim wget node python npm rxvt-unicode feh networkmanager chromium
## other packages
    powerline pcmanfm docker httpie xcompmgr snapper xsel tlp acpi_call trash-cli ntp
## some aur packages 
    visual-studio-code
    py3status(requires installing a few python libraries for some basic functionallity)
    adobe-source-pro 
    powerline-fonts-git
    light
### i3pystatus
    pip install --user pyalsaaudio colour netifaces basiciw
    yaourt font-awesome
    
# dev environment
## vimrc and install vim-plug
## docker!
## npmrc
## npm install -g typescript eslint @angular/cli etc...
### npm install -g yo geneator-aspnet generator-aspnet-item
## setup nginx or apache for php
## mysql, mongo etc..
## dotnet-cli, ruby etc...

# optimize system
    kernel parameters
        disable watchdog
        use noop scheduler
        etc...
    fstab settings
## btrfs snapshots
    snapper -c home create-config /home
    snapper -c root create-config /
    enable timed backups for home or whatever
    install snap-pac for nice pre&post pacman snapshots
    allow user to manage home snaps
        sudo snapper -c home set-config "ALLOW_USERS=user" SYNC_ACL="yes"

## tlp/power-management settings
## udev rules(keyboard,trackpoint tweaks)
## configure xorg.conf
## setup backups with snapshots etc..

# Urxvt notes
install tabbedex from
https://github.com/mina86/urxvt-tabbedex for close tab support
    git package supports Control+Shift and kill_tab

# copy over dotfiles and prosper!
