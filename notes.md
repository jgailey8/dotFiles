===fresh install setup notes===
# initial inistall
    partition setup - i usually just use gdisk
    partion 1 = 512Mib typeCode="ef00"
    partion 2 = 100%   linuxFilesystem

    mkfs.vfat -F32 /dev/sda1
    mkfs.btrfs -L arch -f /dev/sda2

# mount partions
    pacstrap /mnt base base base-devel btrfs-progs
    genfstab -U /mnt >> /mnt/etc/fstab

    arch-chroot /mnt /bin/bash
#clock, locale and hostname
    ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
    set en_US.UTF-8 in /etc/locale.gen
        locale-gen
    echo LANG=en_US.UTF-8 > /etc/locale.conf
    echo myhostname > /etc/hostname

#add user and set passwords and configure sudo etc..
    useradd -m -G wheel -s /bin/bash archie
    EDITOR=vi visudo

# install bootloader
#   grub or refind or systemd

# basic core packages i install
    pacman -S xorg-server xorg-server-utils xorg-xinit xf86-video-intel i3 sway alsa-utils
# other packages
pacman -S wget ssvfs python gvim rxvt-unicode unzip zip chromium pcmanfm-gtk3 feh tlp acpi_call networkmanager

#development packages
pacman -S node npm python 
# extra packages
pacman -S lm_sensors pianobar lxappearance mysql-workbench

# some aur packages i like
    py3status
    adobe-source-pro fonts #
    gtk-arc # theme
    visual-studio-code
    light

# get infinality-fonts

# setup LEMP or LAMP for php/mysql

# optimize system
    kernel parameters
        disable watchdog
        use noop scheduler
        etc...
    # fstab settings

# tlp/power-management settings

# udev rules
# edit xorg.conf

# choices to make
  let window manager handle media keys(brightness, volume etc..)
    or
  use set up acpi events 
        # volume /etc/acpi/events/vol-d
            event=button/volumedown
            action=amixer set Master 5-
        # brightness /etc/acpi/handlers/bl
            #!/bin/sh
            bl_dev=/sys/class/backlight/acpi_video0
            step=1

            case $1 in
              -) echo $(($(< $bl_dev/brightness) - $step)) >$bl_dev/brightness;;
              +) echo $(($(< $bl_dev/brightness) + $step)) >$bl_dev/brightness;;
            esac

        # /etc/acpi/events/bl_d
                event=video/brightnessdown
            action=/etc/acpi/handlers/bl -


Powerline
http://misctechmusings.com/powerline-on-archlinux

    # bash
    if [ -f /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh ]; then
		source /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
	fi
	# vim

Urxvt
install tabbedex from
https://github.com/mina86/urxvt-tabbedex for close tab support
    git package supports Control+Shift and kill_tab

Git
 git config --global user.email "jgailey8@gmail.com"
 git config --global user.name "Jared Gailey
 setup ssh keys

----ISSUES---
annoying screen flicker at login screen

i dont like pgUp/pgDown handles history
    configure .inputrc or just configure urxvt

power-management improvements
    dpms,inactivity,tlp etc...
trackpoint speed too fast for my liking
    create udev rule?
setup ssh keys for git and my servers

make managing dotfiles easier
    symlinks and use some scripts etc...
