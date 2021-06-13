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
G="$(curl -s https://ipapi.co/country_code)" ; H="$(cat /${D}.gen | grep en_${G} | cut -c 2-20)"
I='       ' ; J='             ' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#           
printf "${A}Enter Root Password: ${B}" ; until passwd ; do echo ''
done ; printf "\n${A}Enter User Name: ${B}" ; read U1 ; U="${U1,,}"
until [[ ${#U} -gt 4 ]] && [[ "${U}" =~ [a-z] ]]
do printf "\n${A}Try again : ${B}" && read U1 ; done
useradd -m -G wheel "${U}" ; until passwd ${U}; do echo "" ; done
sed -i '0,/# %/ s/# %/ %/' /etc/sudoers ; echo "${U}" >> /etc/u
ln -sf "/share/zoneinfo/$(curl -s https://ipapi.co/timezone)" /etc/localtime  ; hwclock --systohc
sed -i "s/#${C}/${C}/" /${D}.gen && echo -e "LANG=${C}" >> /${D}.conf ; if [[ "$(cat /${D}.gen | grep -c en_${G})" == 1 ]]
then sed -i "s/#${H}/${H}/" /${D}.gen && echo -e "LANG=${H}" >> /${D}.conf ; fi ; locale-gen
echo -e "127.0.0.1${I}localhost\n::1${J}localhost\n127.0.1.1${I}${U}pc.localdomain ${U}pc" >> /${E}s
echo -e "${U}pc" >> /${E}name ; echo -e "${A}DISPLAY MANAGER ENABLED${B}" ; ${F} sddm
echo -e "${A}NETWORK ENABLED${B}" ; ${F} NetworkManager # echo -e "${A}BLUETHOOTH ENABLED${B}" ; ${F} bluetooth
echo -e "${A}INSTALLING GRUB ${B}"; grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sed -i 's/auto/1920x1080,auto/' /etc/default/grub ; grub-mkconfig -o /boot/grub/grub.cfg
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/installMo.sh > /home/${U}/installMO.sh
cd / ; chown root:root /home ; chmod 755 /home ; runuser --login ${U} --session-command "sh ~/installMO.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
