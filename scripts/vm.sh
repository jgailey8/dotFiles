#!/bin/bash
# qemu-system-x86_64 -m 2048 -machine type=pc,accel=kvm -vga std -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time -drive file=~/VMs/Windows,if=virtio -net nic,model=virtio

QEMU_AUDIO_DRV=alsa qemu-system-x86_64 -m 4096 -enable-kvm -machine q35,accel=kvm -device intel-iommu -usbdevice tablet -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time -smp cores=2,threads=2 -drive file=~/VMs/win,format=raw -vga std 
# qemu-img create -f raw win 25G
# qemu-system-x86_64 -cdrom win.iso -m 4096 -enable-kvm -drive file=~/VMs/win,format=raw -cpu host -smp cores=6 -usbdevice tablet -vga std
# qemu-system-x86_64 -m 4096 -enable-kvm -drive file=~/VMs/win,format=raw -cpu host -smp cores=2 -vga std -usbdevice tablet -soundhw hda
# QEMU_AUDIO_DRV=alsa QEMU_ALSA_DAC_BUFFER_SIZE=512 QEMU_ALSA_DAC_PERIOD_SIZE=170 qemu-system-x86_64 -m 4096 -enable-kvm -machine q35,accel=kvm -device intel-iommu -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time -drive file=~/VMs/win,format=raw -vga std -usbdevice tablet  -soundhw hda
#  xinit   /usr/bin/xonotic-glx -- :1 vt$XDG_VTNR
# xinit qemu-system-x86_64 -m 4096 -enable-kvm -drive file=~/VMs/win,format=raw -cpu host -smp cores=2 -vga std -usbdevice tablet -- :1 vt$XDG_VTNR

#-soundhw hda
