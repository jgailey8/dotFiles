# Table of Contents

- [Preparation](#preperation)
- [Partition](#partitioning)
  - [Schema](#schema)
    - [ext4](#ext4)
    - [btrfs](#btrfs)
- [Install](#install)
- [Setup](#setup)
- [Final Steps](#final-steps)

## [Preparation](https://wiki.archlinux.org/index.php/USB_flash_installation_media)

```bash
dd bs=4M if=archlinux.iso of=/dev/sda status=progress oflag=sync
```

## Partition

### Schema

> preferred utility = gdisk

- boot  +512Mib code: ef00
- swap(optional) +8G code: 8200
- system  100%   code: default

### ext4

```bash
mkfs.vfat -F32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 -L arch -f /dev/sda3
swapon /dev/sda2
```

### btrfs

```bash
mkfs.vfat -F32 /dev/sda1
mkfs.btrfs -L arch -f /dev/sda2
```

> create btrfs subvolumes for easier snapshots

```bash
# create subvolumes
    mount /dev/sda2 /mnt
    cd /mnt
    btfs subvolume create @
    btfs subvolume create @home
    btfs subvolume create @snapshots
    cd @snapshots
    btfs subvolume create home_snapshots
    btfs subvolume create root_snapshots
# Remount partitation using subvolumns
    mount -o ssd,noatime,subvol=@ /dev/sda2 /mnt
    mount -o ssd,noatime,subvol=@home /dev/sda2 /mnt/home
```

## [Install](https://wiki.archlinux.org/index.php/Installation_guide)

```bash
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
wifi-menu
pacstrap /mnt base base-devel linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```

## Post Install

```bash
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
# or uncomment line \/
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "hostname" > /etc/hostname
passwd
useradd -m -g users -G wheel -s /bin/bash jared
passwd jared
EDITOR=vi visudo
```

## [Bootloader](https://wiki.archlinux.org/index.php/systemd-boot)

```bash
bootctl --path=/boot install
pacman -S intel-ucode
cp /usr/share/systemd/bootctl/arch.conf /boot/loader/entries/arch.conf
blkid -s UUID -o value /dev/sda3
```

### Boot Entries

```bash
  title   Arch Linux
  linux   /vmlinuz-linux
  initrd  /intel-ucode.img
  initrd  /initramfs-linux.img
  options root=UUID=d949b0f0-565a-4e34-973c-eb7ade718238 rw quiet nowatchdog
#fallback
  #initrd  /initramfs-linux-fallback.img
#btrfs
  #options root=PARTUUID=## rw rootflags=subvol=ROOT nmi_watchdog=0
```

## Final Steps

```bash
pacman -S networkmanager git stow neovim
```

- reboot and login

```bash
git clone https://github.com/jmg5e/dotfiles .dotfiles
stow -v -t $HOME zsh Xresource sway nvim vim i3 scripts

pacman -S sway waybar dmenu alsa-utils wget python nodejs npm \
          lua rxvt-unicode gvim chromium
```

- Checkout Post Install Docs and profile
