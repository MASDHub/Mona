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
WOP="while [[ $? -ne 0 ]]; do passwd" ; RED='\033[1;31m' ; NOC='\033[0m' ; printf "${RED}Enter Root Password: ${NOC}\n" 
passwd ; ${WOP} ; done ; printf "${RED}Enter User Name: ${NOC}" ; read -r USN ; useradd -m -G wheel ${USN}
passwd "${USN}" ; ${WOP} "${USN} ; done ; mkdir /home/${USN}/.config/
sed -i 's/# %wheel ALL=(ALL) ALL/ %wheel ALL=(ALL) ALL/' /etc/sudoers 
DS='DESKTOP' ; Dk='Desktop"' ; DW='DOWNLOAD' ; Dn='Downloads"' ; MU='MUSIC' ; Me='Media"' ; DIR='_DIR="$HOME/' 
echo -e "XDG_${DS}${DIR}${Dk}\nXDG_${DW}${DIR}${Dn}\nXDG_${MU}${DIR}${Me}" > /home/${USN}/.config/user-dirs.dirs
echo "openbox-session" >> /home/${USN}/.xinitrc 
ln -sf /share/zoneinfo/$(curl -s https://ipapi.co/timezone) /etc/localtime ; hwclock --systohc
echo "LC_ALL=en_US.UTF-8" >> /etc/environment ; echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf ; locale-gen en_US.UTF-8 ; echo "${USN}pc" >> /etc/hostname
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${USN}pc.localdomain ${USN}pc \n" >> /etc/hosts 
printf "${RED}NETWORK ENABLED${NOC}\n" ; systemctl enable NetworkManager ; printf "${RED}GRUB INSTALL ${NOC}\n"
GFX='GRUB_GFXMODE=' ; sed -i 's/'${GFX}'auto/'${GFX}'1920x1080,1024x768x32,auto/' /etc/default/grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; grub-mkconfig -o /boot/grub/grub.cfg 
printf "${RED}SYSTEM CLEANUP ${NOC}\n" ; pacman -Sc ; curl -sL https://git.io/Jspfl -o /home/${USN}/installMO.sh
cd / ; chown root:root /home ; chmod 755 /home ; runuser --login ${USN} --session-command 'sh ~/installMO.sh' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
