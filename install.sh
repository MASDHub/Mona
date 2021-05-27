#!/bin/bash  
set -euo pipefail 
# 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #6F674B #837B5E #998F71 #A89E81 #B5AB8A #C8BE9A #e7e3d5 #9a978a #6F674B #837B5E #998F71 #A89E81 #B5AB8A #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
RD='\033[1;31m' ; NC='\033[0m' ; printf "${RD}Enter Root Password: ${NC}\n" ; passwd 
printf "${RD}Enter User Name: ${NC}" ; read -r USN ; useradd -m -G wheel ${USN} ; passwd ${USN}
sed -i 's/# %wheel ALL=(ALL) ALL/ %wheel ALL=(ALL) ALL/' /etc/sudoers ; SU="sudo -u ${USN}"
ln -sf /share/zoneinfo/$(curl -s https://ipapi.co/timezone) /etc/localtime ; hwclock --systohc
locale-gen --purge en_US.UTF-8 ; echo -e LANG="en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf ; echo "${USN}pc" >> /etc/hostname
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${USN}pc.localdomain ${USN}pc \n" >> /etc/hosts 
printf "${RD}NETWORK ENABLED${NC}\n" ; systemctl enable NetworkManager ; printf "${RD}GRUB INSTALL ${NC}\n"
#printf "${RD}DISPLAY MANAGER ENABLED${NC}\n" ; systemctl enable sddm
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; ${SU} grub-mkconfig -o /boot/grub/grub.cfg
${SU} -H sh -c "cd ~${USN}; svn update" ; ${SU} curl -sL https://git.io/Jspfl -o installMO.sh
#${SU} chmod +x installMO.sh ; ${SU} ./installMO
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
