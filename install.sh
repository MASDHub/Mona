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
H='/etc/host' ; I='echo "Try again"' ; W='%wheel ALL=(ALL) ALL' ; P='passwd' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#           
sed -i 's/#Color/Color/' ${E} ; sed -i "s/#${F}/${F}/" ${E} ; pacman -S --needed git cmake freetype2 fontconfig pkg-config  
${C} "${A}Enter Root Password: ${B}\n" ; until ${P}  ; do ${I} ; done ; ${C} "${A}Enter User Name: ${B}" ;  read -r U 
useradd -m -G wheel ${U} ; until ${P} ${U} ; do ${I} ; done ; sed -i "s/# ${W}/ ${W}/" /etc/sudoers ; echo "${U}" >> u.txt 
chmod +x u.txt ; curl -sL https://git.io/Jspfl > /home/${U}/installMO.sh 
ln -sf "/share/zoneinfo/$(curl -s https://ipapi.co/timezone)" /etc/localtime ; hwclock --systohc
echo "LC_ALL=${D}" >> /etc/environment ; echo "${D} UTF-8" >> ${G}gen ; echo "LANG=${D}" >> ${G}conf ; locale-gen ${D} 
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${U}pc.localdomain ${U}pc \n" >> ${H}s ; echo "${U}pc" >> ${H}name
cd / ; chown root:root /home ; chmod 755 /home ; runuser --login ${U} --session-command 'sh ~/installMO.sh' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
