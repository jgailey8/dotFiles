#  inital btrfs filesystem setup
    mkfs.btrfs -L arch -f /dev/sda2
## create @, @home & @snapshots subvolumes on root fs
    mount /dev/sda2 /mnt
    cd /mnt
    btfs subvolume create @
    btfs subvolume create @home
    btfs subvolume create @snapshots
    cd @snapshots
    btfs subvolume create home_snapshots
    btfs subvolume create root_snapshots
    umount /dev/sda2
# installing
## mount @, @home to /mnt and /mnt/home
    mount -o ssd,noatime,subvol=@ /dev/sda2 /mnt
    mount -o ssd,noatime,subvol=@home /dev/sda2 /mnt/home
    > can create subvolumes like home,etc,mnt etc.. if you want
    mount /dev/sda1 /mnt/boot
### install
    pacstrap /mnt base base-devel btrfs-progs
    genfstab -U /mnt >> /mnt/etc/fstab
    arch-chroot /mnt

# fstab example with btrfs volume
    UUID={##}	/         	btrfs     	rw,noatime,ssd,subvol=ROOT	0 0
    UUID={##}	/home       	btrfs     	rw,noatime,ssd,space_cache,subvol=@home	0 0
# snapper setup
    snapper -c root create-config /
    snapper -c home create-config /home
## edit fstab and mount snappshot directorys to subvol=@snapshots/...
    UUID={##}	/.snapshots       	btrfs     	rw,noatime,ssd,space_cache,subvol=@snapshots/root_snapshots	0 0
    UUID={##}	/home/.snapshots       	btrfs     	rw,noatime,ssd,space_cache,subvol=@snapshots/home_snapshots	0 0

# maanaging snapshots
    allow user to manage home snaps
    sudo snapper -c home set-config "ALLOW_USERS=|user|" SYNC_ACL="yes"

## create snapshot
    snapper -c home create --description 'initial snapshot'
## deelete snapshot
    snapper -c home list
    snapper -c home delete #
# restoring to a previous snapshot
    boot into arch usb
    mount /dev/sda2 /mnt
    btrfs subvol snapshot /mnt/@snapshots/root-snapshots/#/snapshot /mnt/@
    btrfs subvol snapshot /mnt/@snapshots/home-snapshots/#/snapshot /mnt/@home
# other notes
## dont index snapshots
    /etc/updatedb.conf
    PRUNENAMES = ".snapshots"
