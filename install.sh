#!/bin/bash  
set -euo pipefail 
# 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #6F674B #837B5E #998F71 #A89E81 #B5AB8A #C8BE9A #e7e3d5 #9a978a #6F674B #837B5E #998F71 #A89E81 #B5AB8A              #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --verbose --save /etc/pacman.d/mirrorlist 
gpg --list-keys ; pacman-key --init ; pacman-key --populate archlinux >/dev/null
#pacstrap -i /mnt base base-devel linux-lts linux-lts-headers linux-firmware networkmanager efibootmgr grub-btrfs vim alsa-utils 2>/dev/null
#genfstab -U /mnt >> /mnt/etc/fstab ; ARC="arch-chroot /mnt" ; $ARC systemctl enable NetworkManager
#echo "Enter Root Password: " ; $ARC passwd ; read -r -p "Enter User Name: " USN ; $ARC useradd -m -G wheel $USN ; $ARC passwd $USN
#$ARC grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; $ARC grub-mkconfig -o /boot/grub/grub.cfg
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
