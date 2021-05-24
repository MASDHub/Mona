#!/bin/bash  
set -euo pipefail 
# 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #6F674B #837B5E #998F71 #A89E81 #B5AB8A #C8BE9A #e7e3d5 #9a978a #6F674B #837B5E #998F71 #A89E81 #B5AB8A                    #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
LBL='\033[1;36m' ; NC='\033[0m' ;reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/pacman.d/mirrorlist 
ARC="arch-chroot /mnt" ;gpg --list-keys ;pacman-key --init ;pacman-key --populate archlinux >/dev/null ;printf "${LBL}Enter to Accpet${NC}\n"
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub-btrfs vim git 2>/dev/null
genfstab -U /mnt >> /mnt/etc/fstab ;printf "${LBL}Enter Root Password: ${NC}\n" ;passwd -R /mnt ;printf "${LBL}Enter User Name: ${NC}" 
read -r USN ;useradd -m -G wheel -R /mnt $USN ;passwd -R /mnt $USN ;echo "${USN} ALL=(ALL) ALL " >> /mnt/etc/sudoers.d/${USN}
ln -sf /usr/share/zoneinfo/$(curl -s https://ipapi.co/timezone) /etc/localtime ;hwclock --systohc 
locale-gen --purge en_US.UTF-8 ;echo -e LANG="en_US.UTF-8" >> /etc/locale.conf ;echo "KEYMAP=us" >> /etc/vconsole.conf
echo "${USN}pc" >> /etc/hostname ;echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${USN}pc.localdomain ${USN}pc \n" >> /etc/hosts 
printf "${LBL}NETWORK ENABLED${NC}\n" ;$ARC systemctl enable NetworkManager ;printf "${LBL}GRUB INSTALL ${NC}\n"
$ARC grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ;$ARC grub-mkconfig -o /boot/grub/grub.cfg
su -l $USN ; arch-chroot -u $USN /mnt/home /usr/bin/bash ; curl -sL https://git.io/JsyGF -o installMO.sh && chmod +x installMO.sh && ./installMO.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
