#!/bin/bash  
set -euo pipefail 
# 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #6F674B #837B5E #998F71 #A89E81 #B5AB8A #C8BE9A #e7e3d5 #9a978a #6F674B #837B5E #998F71 #A89E81 #B5AB8A                    #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --verbose --save /etc/pacman.d/mirrorlist 
gpg --list-keys ; pacman-key --init ; pacman-key --populate archlinux >/dev/null
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub-btrfs vim git 2>/dev/null ; genfstab -U /mnt >> /mnt/etc/fstab
echo "Enter Root Password: " ; passwd -R /mnt ; read -r -p "Enter User Name: " USN ; useradd -m -G wheel -R /mnt $USN ; passwd -R /mnt $USN
locale-gen --purge en_US.UTF-8 ; echo "${USN} ALL=(ALL) ALL " >> /mnt/etc/sudoers.d/${USN} ; read -r -p "PC Name? " PN ; ARC="arch-chroot /mnt"
echo -e LANG="en_US.UTF-8" >> /etc/locale.conf ; echo "KEYMAP=us" >> /etc/vconsole.conf ; 
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${PN}.localdomain ${PN} \n" >> /etc/hosts ; echo "$PN" >> /etc/hostname
ln -sfv /usr/share/zoneinfo/$(curl -s https://ipapi.co/timezone) /etc/localtime ; hwclock --systohc
$ARC grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; $ARC grub-mkconfig -o /boot/grub/grub.cfg
#ARC="chroot -u $USN /mnt /bin/bash";
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
