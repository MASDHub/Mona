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
A='\e[1;31m' ; B='\e[0m' ; C='printf' ; D='en_US.UTF-8'  ; E='GRUB_GFXMODE=' ; F='/etc/pacman.conf' ; G='TotalDownload'
${C} "${A}Enter Root Password: ${B}\n" ; passwd ; ${C} "${A}Enter User Name: ${B}" ; read -r U 
useradd -m -G wheel ${U} ; sed -i 's/# %wheel ALL=(ALL) ALL/ %wheel ALL=(ALL) ALL/' /etc/sudoers ; passwd "${U}"
ln -sf "/share/zoneinfo/$(curl -s https://ipapi.co/timezone)" /etc/localtime ; hwclock --systohc
echo "LC_ALL=e${D}" >> /etc/environment ; echo "${D} UTF-8" >> /etc/locale.gen
echo "LANG=${D}" >> /etc/locale.conf ; locale-gen ${D} ; echo "${U}pc" >> /etc/hostname
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${U}pc.localdomain ${U}pc \n" >> /etc/hosts 
${C} "${A}NETWORK ENABLED${B}\n" ; systemctl enable NetworkManager ; ${C} "${A}GRUB INSTALL ${B}\n"
sed -i 's/#Color/Color/' ${F} ; sed -i "s/#${G}/${G}/" ${F} ; sed -i 's/'${E}'auto/'${E}'1920x1080,auto/' /etc/default/grub
pacman -S --needed git cmake freetype2 fontconfig pkg-config make libxcb
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; grub-mkconfig -o /boot/grub/grub.cfg 
curl -sL https://git.io/Jspfl > /home/${U}/installMO.sh ; cd / ; chown root:root /home ; chmod 755 /home 
runuser --login ${U} --session-command 'sh ~/installMO.sh' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
