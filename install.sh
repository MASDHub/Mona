#!/bin/bash                                                                                                                
set -euo pipefail            
head -n 17 install.sh
#8'         8888
#d8.-=. ,==-.:888b 
#>8 `~` :`~' d8888                 
#88         ,88888                 
#88b. `-~  ':88888                 
#888b ~==~ .:88888               
#88888o--:':::8888                 
#`88888| :::' 8888b             
#8888^^'       8888b               
#d888           ,%888b.           
#d88%            %%%8--'-.        
#/88:.__ ,       _%-' ---  -       
 #  '''::===..-'   =  --.  `                 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #6F674B #837B5E #998F71 #A89E81 #B5AB8A #C8BE9A #e7e3d5 #9a978a #6F674B #837B5E    #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
sed -i 's/#Color/Color/' /etc/pacman.conf ; sed -i 's/#TotalDownload/TotalDownload/' /etc/pacman.conf
echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf
RED='\033[1;31m' ; NOC='\033[0m' ; printf "${RED}Enter Root Password: ${NOC}\n" ; passwd 
printf "${RED}Enter User Name: ${NOC}" ; read -r USN ; useradd -m -G wheel ${USN} ; passwd ${USN} 
sed -i 's/# %wheel ALL=(ALL) ALL/ %wheel ALL=(ALL) ALL/' /etc/sudoers
ln -sf /share/zoneinfo/$(curl -s https://ipapi.co/timezone) /etc/localtime ; hwclock --systohc
echo "LC_ALL=en_US.UTF-8" >> /etc/environment ; echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf ; locale-gen en_US.UTF-8 ; echo "${USN}pc" >> /etc/hostname
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${USN}pc.localdomain ${USN}pc \n" >> /etc/hosts 
MOD='MODULES=' ; MKC='/etc/mkinitcpio.conf' ; if [[ "$(lscpu | grep -Eo "Intel" | sort -u)" == Intel ]]
then VGA="intel-ucode xf86-video-intel" && sed -i 's/'${MOD}'()/'${MOD}'(i915 btrfs)/' ${MKC} ; else
VGA="amd-ucode xf86-video-amdgpu" && sed -i 's/'${MOD}'()/'${MOD}'(amdgpu btrfs)/' ${MKC} ; fi 
printf "${RED}GRAPHIC DRIVERS${NOC}\n" ; pacman -S ${VGA} ; mkinitcpio -P
printf "${RED}NETWORK ENABLED${NOC}\n" ; systemctl enable NetworkManager
umount /.snapshots/ ; rm -rf /.snapshots/ ; snapper --no-dbus -v list-configs ; snapper --no-dbus -v create-config / 
btrfs subvolume delete /.snapshots ; mkdir /.snapshots ; mount -a ; chmod 750 /.snapshots 
printf "${RED}SNAPSHOT ENABLED ${NOC}\n" ; systemctl enable snapper-timeline.timer ; systemctl enable snapper-cleanup.timer
printf "${RED}GRUB INSTALL ${NOC}\n" ; grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB 
systemctl enable grub-btrfs.path 
GFX='GRUB_GFXMODE=' ; sed -i 's/'${GFX}'auto/'${GFX}'1920x1080,1024x768x32,auto/' /etc/default/grub
SEDE='GRUB_BTRFS_OVERRIDE_BOOT_PARTITION_DETECTION="true"' ; sed -i 's/#'${SEDE}'/'${SEDE}'/' /etc/default/grub-btrfs/config 
SED='ALLOW_USERS=' ; sed -i 's/'${SED}'""/'${SED}'"'${USN}'"/' /etc/snapper/configs/root 
snapper --no-dbus create ; grub-mkconfig -o /boot/grub/grub.cfg
printf "${RED}SYSTEM CLEANUP ${NOC}\n" ; pacman -Sc
sudo -u ${USN} sh -c 'whoami;echo $USN' ; curl -sl https://git.io/Jspfl -o /home/${USN}/installMO.sh
chmod +x /home/${USN}/installMO.sh ; sh /home/${USN}/installMO.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
