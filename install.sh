#!/bin/bash   
head -n 15 install.sh | tail -n 13
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
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='\e[1;31m' ; B='\e[0m' ; C='printf' ; D='en_US.UTF-8' ; E='/etc/pacman.conf' ; F='TotalDownload' ; G='/etc/locale.'
H='/etc/host' ; W='%wheel ALL=(ALL) ALL'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#           
printf "${A}Enter Root Password: ${B}\n" ; until passwd ; do printf "\n" ; done 
printf "${A}Enter User Name: ${B}" ; read -r U1 ; U="${U1,,}" ; until [[ ${#U} -gt 4 ]] && [[ "${U}" =~ [a-z] ]]
do printf "Try Again\n" && read -r U1 && U="${U1,,}" ; done ; useradd -m -G wheel ${U} 
sed -i "s/# ${W}/ ${W}/" /etc/sudoers ; until passwd ${U} ; do printf "\n" ; done 
echo "${U}" >> /etc/u.txt ; chmod +x /etc/u.txt ; curl -sL https://git.io/Jspfl > /home/${U}/installMO.sh 
sed -i 's/#Color/Color/' ${E} ; sed -i "s/#${F}/${F}/" ${E} ; pacman -Syyyu --needed git cmake freetype2 fontconfig pkg-config  
ln -sf "/share/zoneinfo/$(curl -s https://ipapi.co/timezone)" /etc/localtime ; hwclock --systohc
echo "LC_ALL=${D}" >> /etc/environment ; echo "${D} UTF-8" >> ${G}gen ; echo "LANG=${D}" >> ${G}conf ; locale-gen ${D} 
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${U}pc.localdomain ${U}pc \n" >> ${H}s ; echo "${U}pc" >> ${H}name
printf "${A}GRUB INSTALL ${B}\n" ; sed -i 's/'${N}'auto/'${N}'1920x1080,auto/' /etc/default/grub 
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; grub-mkconfig -o /boot/grub/grub.cfg
cd / ; chown root:root /home ; chmod 755 /home ; runuser --login ${U} --session-command 'sh ~/installMO.sh' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
