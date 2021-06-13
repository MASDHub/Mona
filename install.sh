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
A='\e[1;31m' ; B='\e[0m' ; sed -i -e 's/#Co/Co/' /etc/pacman.conf
#E='Adwaita/Oranchelo' #F='Adwaita/Oranchelo' ; I='Cantarell 11/Fira Sans Condensed Book' ; E='etc/host' ; F='systemctl enable' 
#J='gtk-cursor-theme-name=' ; X='/usr/share/' 
I='       ' ; J='             ' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#           
echo -n "${A}Enter Root Password: ${B}" 
until passwd ; do echo '' ; done  
echo -en "\n${A}Enter User Name: ${B}" 
read U1 ; U="${U1,,}" ; until \
[ ${#U} -gt 4 ] && [[ "${U}" =~ [a-z] ]]
do echo -en "\n${A}Try again : ${B}" \
&& read U1 && U="${U1,,}" ; done  
useradd -m -G wheel "${U}" 
until passwd ${U}; do echo "" ; done
sed -i '0,/# %/ s/# %/ %/' /etc/sudoers 
ln -sf "/share/zoneinfo/$(curl -s https://ipapi.co/timezone)" /etc/localtime  ; hwclock --systohc
sed -i "s/#en_US.U/en_US.U/" /etc/locale.gen && echo -e "LANG=${C}" >> /etc/locale.conf ; locale-gen
echo -e "127.0.0.1${I}localhost\n::1${J}localhost\n127.0.1.1${I}${U}pc.localdomain ${U}pc" >> /${E}s
echo -e "${U}pc" >> /${E}name ; echo -e "${A}DISPLAY MANAGER ENABLED${B}" ; ${F} sddm
echo -e "${A}NETWORK ENABLED${B}" ; ${F} NetworkManager # echo -e "${A}BLUETHOOTH ENABLED${B}" ; ${F} bluetooth
echo -e "${A}INSTALLING GRUB ${B}"; grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sed -i 's/auto/1920x1080,auto/' /etc/default/grub ; grub-mkconfig -o /boot/grub/grub.cfg
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/installMo.sh > /home/${U}/installMO.sh
#if [[ "$( pacman -Qd | grep -Ec tpl )" == [1-9] ]] ; systemctl enable tlp && systemctl enable acpid ; fi
{ echo 'M="$(find /home/*/.screenlayout/*.sh)"' ; echo 'M1="$( xrandr | grep -Eo '"'eDP1|eDP-1'"' )"'
echo 'M2="$( xrandr | grep -Ec '"'HDMI-1|HDMI1|eDP1|eDP-1|VGA1|VGA-1|DVI1|DVI-1'"' )"'
echo 'M3="$( xrandr | grep -Eo '"'HDMI-1|HDMI1|DVI-1|DVI1|VGA1|VGA-1'"' )"'
echo 'if [ -r "${M}" ] && $(grep -q xrandr ${M}) ; then ${M} ; else if [[ "${M2}" -ge "2" ]]'
echo 'then xrandr --output "${M1}" --mode 1920x1080 --output "${M3}" --primary --auto'
echo -e 'fi\nfi' ; } >> ${X}/sddm/scripts/Xsetup ; rm /etc/install.sh
sed -i -e "1 s/${E}-Beka/" -e "2 s/${E}/" -e "s/${I}/" ${X}/gtk-2.0/gtkrc ; echo ''"${J}"' "Captain Frank"' >> ${X}/gtk-2.0/gtkrc 
sed -i -e "2 s/${E}-Beka/" -e "3 s/${E}/" -e "s/${I}/" ${X}/gtk-3.0/settings.ini ; echo "${J} Captain Frank" >> ${X}/gtk-3.0/settings.ini
cd / ; chown root:root /home ; chmod 755 /home ; runuser --login ${U} --session-command "sh ~/installMO.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
