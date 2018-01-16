<!-- ===fresh install setup notes=== -->
# pre installation setup
##  partition setup - i usually just use gdisk
    > don't usualy bother with swap partition or file unless i feel like it
    "btrfs does not support swap file last time i checked"
    partion 1 = 512Mib typeCode="ef00"
    partion 2 = 100%   linuxFilesystem
    mkfs.vfat -F32 /dev/sda1
    mkfs.btrfs -L arch -f /dev/sda2
## create btrfs subvolumes for easier snapshots
    mount /dev/sda2 /mnt
    cd /mnt
    btfs subvolume create @
    btfs subvolume create @home
    btfs subvolume create @snapshots
    cd @snapshots
    btfs subvolume create home_snapshots
    btfs subvolume create root_snapshots
    umount /dev/sda2
## install
    mount -o ssd,noatime,subvol=@ /dev/sda2 /mnt
    mount -o ssd,noatime,subvol=@home /dev/sda2 /mnt/home
    > can create subvolumes like home,etc,mnt etc.. if you want
    mount /dev/sda1 /mnt/boot
    pacstrap /mnt base base-devel btrfs-progs
    genfstab -U /mnt >> /mnt/etc/fstab

    fstab example with btrfs volume
    UUID={##}	/         	btrfs     	rw,noatime,ssd,subvol=ROOT	0 0
    UUID={##}	/home       	btrfs     	rw,noatime,ssd,space_cache,subvol=@home	0 0
    mount snappshot directorys to subvol=@snapshots/...
    UUID={##}	/.snapshots       	btrfs     	rw,noatime,ssd,space_cache,subvol=@snapshots/root_snapshots	0 0
    UUID={##}	/home/.snapshots       	btrfs     	rw,noatime,ssd,space_cache,subvol=@snapshots/home_snapshots	0 0

    arch-chroot /mnt /bin/bash
## clock, locale and hostname
    ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
    hwclock --systohc
    set en_US.UTF-8 in /etc/locale.gen
        locale-gen
    echo LANG=en_US.UTF-8 > /etc/locale.conf
    echo myhostname > /etc/hostname
    > if time is still incorrect 
    check with timedatectl
    pacman -S ntp
    ntpd -qg # to check timedatctl to see if everything is good
    timedatectl set-ntp true

## add user and set passwords and configure sudo etc..
    useradd -m -G wheel -s /bin/bash archie
    EDITOR=vim visudo

## install systemd bootloader
    bootctl --path=/boot install
    > enable timeout disable default from /boot/loader/loader.conf
    cp /usr/share/systemd/bootctl/arch.conf /boot/loader/entries/arch.conf
## edit entrie wtih btrfs subvol
### blkid -s PARTUUID -o value /dev/sda2 
```
    title   Arch Linux
    linux   /vmlinuz-linux
    initrd  /initramfs-linux.img
    options root=PARTUUID=## rw rootflags=subvol=ROOT elevator=noop nmi_watchdog=0
```
# some basic core packages
    pacman -S xorg-server xorg-xinit xf86-video-intel i3 sway networkmanager alsa-utils wget git python nodejs lua npm rxvt-unicode dmenu feh stow vim chromium 
## other packages
    pcmanfm xcompmgr snapper xsel tlp acpi_call trash-cli ntp xautolock xdg-user-dirs
## some aur packages 
    visual-studio-code
    powerline-git
    powerline-fonts-git
    light
### [bumblebee-status](https://github.com/tobi-wan-kenobi/bumblebee-status)
    yaourt should install all required python dependencies
    yaourt font-awesome
    
# install dotfiles
    git clone https://github.com/jmg5e/dotfiles .dotfiles
    stow -v -t $HOME bash vim Xresources xinit i3 sway

# [ dev environment/setup ](dev-setup.md)
## docker, npmrc, nginx/mysql, android-sdk, dotnet-core etc..

# optimize system etc..
## intel early module loading
    add MODULES=(i915) to /etc/mkinitcpio.conf
    mkinitcpio -p linux
## kernel parameters
    disable watchdog
    use noop scheduler
    etc...
##  fstab settings
## update pacman mirror list
    cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
    rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
## btrfs/snapper snapshots  
### create snapper configs
    snapper -c home create-config /home
    snapper -c root create-config /
### mount snapshots in fstab
    UUID=##	/home/.snapshots         	btrfs     	rw,noatime,ssd,space_cache,subvol=@snapshots/home_snapshots	0 0
    UUID=##	/.snapshots         	btrfs     	rw,noatime,ssd,space_cache,subvol=@snapshots/root_snapshots	 0 0
    enable timed backups for home or whatever
    install snap-pac for nice pre&post pacman snapshots
## [Setup Vpn](https://wiki.archlinux.org/index.php/Private_Internet_Access_VPN)
    install networkmanager-openvpn & private-internet-access-vpn
    put username/password into /etc/private-internet-access/login.conf
    run pia -a

## updatedb
    pacmans -S mlocate

## tlp/power-management settings
    pacman -S tlp acpi_cal
    edit /etc/default/tlp
    add SATA_LINKPWR_ON_BAT=max_performance to prevent btrfs file corruption
    enable tlp.service and tlp-sleep.service
## udev rules(keyboard,trackpoint tweaks)
## configure xorg.conf
## setup backups with snapshots etc..

# Urxvt notes
 [tabbadex] (https://github.com/mina86/urxvt-tabbedex)
    > git package supports Control+Shift and kill_tab
