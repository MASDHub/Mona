#!/bin/bash  
set -euo pipefail 
# 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #6F674B #837B5E #998F71 #A89E81 #B5AB8A #C8BE9A #e7e3d5 #9a978a #6F674B #837B5E #998F71 #A89E81 #B5AB8A                    #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
LRD='\033[1;31m' ; NC='\033[0m' ; reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/pacman.d/mirrorlist 
ARC="arch-chroot /mnt" ;gpg --list-keys ; pacman-key --init ; pacman-key --populate archlinux >/dev/null ; printf "${LRD}Enter to Accpet${NC}\n"
PMC='sed -i 's/#Color/Color/'' ; PML='echo -e  \n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n\n' ; $PML >> /etc/pacman.conf ; $PMC /etc/pacman.conf 
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub-btrfs vim xorg sddm git openbox  2>/dev/null
genfstab -U /mnt >> /mnt/etc/fstab ; $PML >> /mnt/etc/pacman.conf $PMC /mnt/etc/pacman.conf ; printf "${LRD}Enter Root Password: ${NC}\n" ; $ARC passwd ; printf "${LRD}Enter User Name: ${NC}"
read -r USN ; $ARC useradd -m -g users -G wheel -s /bin/bash $(USN) ; $ARC passwd ${USN} ; echo "${USN} ALL=(ALL) ALL " >> /mnt/etc/sudoers.d/${USN}
$ARC ln -sf /usr/share/zoneinfo/$(curl -s https://ipapi.co/timezone) /etc/localtime ; $ARC hwclock --systohc 
$ARC locale-gen --purge en_US.UTF-8 ; $ARC echo -e LANG="en_US.UTF-8" >> /etc/locale.conf ; $ARC echo "KEYMAP=us" >> /etc/vconsole.conf
$ARC echo "${USN}pc" >> /etc/hostname ; $ARC echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${USN}pc.localdomain ${USN}pc \n" >> /etc/hosts 
printf "${LRD}NETWORK ENABLED${NC}\n" ; $ARC systemctl enable NetworkManager ; printf "${LRD}DISPLAY MANAGER ENABLED${NC}\n" ; $ARC systemctl enable sddm 
printf "${LRD}GRUB INSTALL ${NC}\n" ; $ARC grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; $ARC grub-mkconfig -o /boot/grub/grub.cfg
su -l $USN
#arch-chroot -u $USN /mnt/home /usr/bin/bash ; curl -sL https://git.io/JsyGF -o installMO.sh && chmod +x installMO.sh && ./installMO.sh
#while [[ $? -ne 0 ]]; do ;passwd $USN ;
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
