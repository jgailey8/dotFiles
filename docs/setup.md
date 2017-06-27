<!-- ===fresh install setup notes=== -->
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
    > if time is incorrect try enabling ntpd service

#add user and set passwords and configure sudo etc..
    useradd -m -G wheel -s /bin/bash archie
    EDITOR=vim visudo

# install systemd bootloader
    bootctl --path=/boot install
## example entrie wtih btrfs subvol
### blkid -s PARTUUID -o value /dev/sda2 
```
    title   Arch Linux
    linux   /vmlinuz-linux
    initrd  /initramfs-linux.img
    options root=PARTUUID=## rw rootflags=subvol=ROOT elevator=noop nmi_watchdog=0
```
# some basic core packages
    pacman -S xorg-server xorg-server-utils xorg-xinit xf86-video-intel i3 sway networkmanager alsa-utils wget python node npm rxvt-unicode feh stow chromium
## other packages
    powerline pcmanfm xcompmgr snapper xsel tlp acpi_call trash-cli ntp
## some aur packages 
    visual-studio-code
    adobe-source-pro 
    powerline-fonts-git
    light
    [private-internet-access](https://wiki.archlinux.org/index.php/Private_Internet_Access_VPN)
### [bumblebee-status](https://github.com/tobi-wan-kenobi/bumblebee-status)
    yaourt should install all required python dependencies
    yaourt font-awesome
    
# dotfiles install
    git clone https://github.com/jmg5e/dotfiles .dotfiles
    ./install.sh 
    or install individually ie stow -v -t $HOME vim
## install (vim-plug)[https://github.com/junegunn/vim-plug]
    ```
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    ```

# [ dev environment/setup ](dev-setup.md)
## docker, npmrc, nginx/mysql, android-sdk, dotnet-core etc..

# optimize system etc..
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
        sudo snapper -c home set-config "ALLOW_USERS=|user|" SYNC_ACL="yes"

## tlp/power-management settings
## udev rules(keyboard,trackpoint tweaks)
## configure xorg.conf
## setup backups with snapshots etc..

# Urxvt notes
get [tabbadex] (https://github.com/mina86/urxvt-tabbedex)
    git package supports Control+Shift and kill_tab

# Capslock -> Escape mapping(works under wayland)
## started in ~/.bin/startup.sh
  setxkbmap -option caps:escape

