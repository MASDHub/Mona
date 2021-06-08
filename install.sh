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
A='\e[1;31m' ; B='\e[0m' ; C='en_US.UTF-8' ; D='/etc/pacman.conf' ; E='TotalDownload' ; F='/etc/locale'
G='/etc/host' ; W='%wheel ALL=(ALL) ALL'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#           
printf "${A}Enter Root Password: ${B}\n" ; until passwd ; do printf "\n" ; done 
printf "${A}Enter User Name: ${B}" ; read -r U1 ; U="${U1,,}" ; until [[ ${#U} -gt 4 ]] && [[ "${U}" =~ [a-z] ]] 
do printf "Try Again\n" && read -r U1 && U="${U1,,}" ; done ; useradd -m -G wheel ${U} ; until passwd ${U} 
do printf "\n" ; done ; sed -i "s/# ${W}/ ${W}/" /etc/sudoers ; echo "${U}" >> /etc/u.txt ; chmod +x /etc/u.txt 
curl -ssL https://raw.githubusercontent.com/djSharcode/Mona/main/installMo.sh > /home/${U}/installMO.sh 
sed -i 's/#Color/Color/' ${D} ; sed -i "s/#${E}/${E}/" ${D} ; pacman -Syyyu --needed git cmake pkg-config  
ln -sf "/share/zoneinfo/$(curl -s https://ipapi.co/timezone)" /etc/localtime ; hwclock --systohc
echo "LC_ALL=${C}" >> /etc/environment ; echo "${C} UTF-8" >> ${F}.gen ; echo "LANG=${C}" >> ${F}.conf ; locale-gen ${C} 
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${U}pc.localdomain ${U}pc \n" >> ${G}s ; echo "${U}pc" >> ${G}name
printf "${A}GRUB INSTALL ${B}\n" ; sed -i 's/'${N}'auto/'${N}'1920x1080,auto/' /etc/default/grub 
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; grub-mkconfig -o /boot/grub/grub.cfg
cd / ; chown root:root /home ; chmod 755 /home ; runuser --login ${U} --session-command 'sh ~/installMO.sh' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
