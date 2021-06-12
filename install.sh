#!/bin/bash
set -euo pipefail
head -n 16 /etc/install.sh | tail -n 13
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
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='\e[1;31m' ; B='\e[0m' ; C='en_US.UTF-8' ; D='etc/locale' ; E='etc/host' ; F='systemctl enable' 
F="$(curl -s https://ipapi.co/country_code)" ; G="$(cat /${D}.gen | grep en_${F} | cut 2-20)"
H='       ' ; I='             ' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#           
printf "${A}Enter Root Password: ${B}" ; until passwd ; do echo ''
done ; printf "\n${A}Enter User Name: ${B}" ; read U1 ; U="${U1,,}"
until [[ ${#U} -gt 4 ]] && [[ "${U}" =~ [a-z] ]]
do printf "\n${A}Try again : ${B}" && read U1 ; done
useradd -m -G wheel "${U}" ; until passwd ${U}; do echo "" ; done
sed -i '0,/# %/ s/# %/ %/' /etc/sudoers ; echo "${U}" >> /etc/u
ln -sf "/share/zoneinfo/$(curl -s https://ipapi.co/timezone)" /etc/localtime  ; hwclock --systohc
echo -e "127.0.0.1${H}localhost\n::1${I}localhost\n127.0.1.1${H}${U}pc.localdomain ${U}pc" >> /${E}s
echo -e "${U}pc" >> /${E}name ; if [[ "$(cat /etc/locale.gen | grep -c en_${F})" == 1 ]]
then sed -i "s/#${G}/${G}/" /${D}.gen && echo -e "LANG=${G}" >> /${D}.conf
else sed -i "s/#${C}/${C}/" /${D}.gen && echo -e "LANG=${C}" >> /${D}.conf 
fi ; locale-gen ; echo "${A}DISPLAY MANAGER ENABLED${B}" ; ${F} sddm
echo "${A}NETWORK ENABLED${B}" ; ${F} NetworkManager ; echo "${A}BLUETHOOTH ENABLED${B}" ; ${F} bluetooth
echo "${A}INSTALLING GRUB ${B}"; grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sed -i 's/auto/1920x1080,auto/' /etc/default/grub ; grub-mkconfig -o /boot/grub/grub.cfg
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/installMo.sh > /home/${U}/installMO.sh
cd / ; chown root:root /home ; chmod 755 /home ; runuser --login ${U} --session-command "sh ~/installMO.sh" 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
