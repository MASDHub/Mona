#!/bin/bash
set -euo pipefail
head -n 16 -- "$0" | tail -n 13
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
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='\e[1;31m' ; B='\e[0m' ; E='/usr/share/gtk'
D='Cantarell 11/Fira Sans Condensed Book'
C='Adwaita/Oranchelo' ; F='systemctl enable'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
echo -en "\n${A}Enter User Name: ${B}"
read -r R ; until [[ "${U}" =~ ^[a-z]*$ ]] && \
[[ ${#U} -gt 4 ]] ; do read -p 'Retry: ' R && \
U="${R,,}" ; done ; useradd -m -G wheel "${U}"
echo -e "${A}Enter the User's Password : ${B}"
until passwd ${U} ; do echo ; done
echo -e "${A}Enter Root Password:${B}"
until passwd ; do echo ; done
sed -i '0,/# %/ s/# %/ %/' /etc/sudoers
sed -i 's/#en_US./en_US./' /etc/locale.gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
locale-gen ; echo "${P}" > /etc/hostname
rm -- "$0" ; echo "${U}" > /etc/U
P="${U}pc" ; echo -e "
127.0.0.1       localhost
::1             localhost
127.0.1.1       ${P}.localdomain ${P}" >> \
/etc/hosts; sed -i -e "1 s/${C}-Beka/" -e \
 "2 s/${C}/" -e "s/${D}/" ${E}-2.0/gtkrc
sed -i -e "3 s/${C}/" -e "2 s/${C}-Beka/" \
-e "s/${D}/" ${E}-3.0/settings.ini
ln -sf /usr/share/zoneinfo/"$(cat /etc/T)" \
/etc/localtime ; hwclock --systohc ; echo -e '
M="$(find /home/*/.screenlayout/*.sh)"
M1="$(xrandr | grep -Eo '"'eDP1|eDP-1'"')"
M2="$(xrandr | grep -Ec '"'HDMI-1|HDMI1|eDP1|eDP-1|VGA1|VGA-1|DVI1|DVI-1'"')"
M3="$(xrandr | grep -Eo '"'HDMI-1|HDMI1|DVI-1|DVI1|VGA1|VGA-1'"')"
if [ -r "${M}" ] && $(grep -q xrandr ${M}) 
then ${M} ; else if [[ "${M2}" -ge "2" ]]
then xrandr --output "${M1}" --mode 1920x1080 --output "${M3}" --primary --auto
fi\nfi' >> ${E}sddm/scripts/Xsetup
echo -e "${A}DISPLAY MANAGER ENABLED${B}" ; ${F} sddm 
echo -e "${A}NETWORK ENABLED${B}" ; ${F} NetworkManager 
echo -e "${A}INSTALLING GRUB${B}" ; grub-install \
--target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sed -i 's/auto/1920x1080,1024x768x32,auto/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
cp /etc/X11/xinit/xinitrc /home/${U}/.xinitrc
sed -i 's/twm/openbox-session/' /home/${U}/.xinitrc
curl -sSL https://raw.githubusercontent.com/djSharcode/\
Mona/main/installMo.sh > /home/${U}/installMO.sh
cd / ; chown root:root /home ; chmod 755 /home
runuser --login ${U} --session-command "sh ~/installMO.sh"
# echo -e "${A}BLUETHOOTH ENABLED${B}" ; ${F} bluetooth
#if [[ "$( pacman -Qd | grep -Ec tpl )" == [1-9] ]] ; systemctl enable tlp && systemctl enable acpid ; fi
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
