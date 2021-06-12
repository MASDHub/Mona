#!/bin/bash
set -euo pipefail ; U=$(cat /etc/u.txt)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
A="/home/${U}/.config/pikaur.conf" ; B='\e[1;31m' ; C='\e[0m' ; D='reversesearchsorting = '; E='Adwaita/Oranchelo-Beka'
F='Adwaita/Oranchelo' ; G='/usr/share/gtk-2.0/gtkrc' ; H='/usr/share/gtk-3.0/settings.ini' ; I='Cantarell 11/Fira Sans Condensed Book'
J='gtk-cursor-theme-name=' ; K='Captain Frank' ; X='/usr/share/sddm/scripts/Xsetup' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
#if [[ "$( pacman -Qd | grep -Ec tpl )" == [1-9] ]] ; systemctl enable tlp && systemctl enable acpid ; fi
{ echo 'M="$(find /home/*/.screenlayout/*.sh)"' ; echo 'M1="$( xrandr | grep -Eo '"'eDP1|eDP-1'"' )"' 
 echo 'M2="$( xrandr | grep -Ec '"'HDMI-1|HDMI1|eDP1|eDP-1|VGA1|VGA-1|DVI1|DVI-1'"' )"'
 echo 'M3="$( xrandr | grep -Eo '"'HDMI-1|HDMI1|DVI-1|DVI1|VGA1|VGA-1'"' )"'
 echo 'if [ -r "${M}" ] && $(grep -q xrandr ${M}) ; then ${M} ; else if [[ "${M2}" -ge "2" ]]' 
 echo 'then xrandr --output "${M1}" --mode 1920x1080 --output "${M3}" --primary --auto' ; echo -e 'fi\nfi' ; } >> ${X} 
sed -i -e 's/#Co/Co/' /etc/pacman.conf ; sed -i "s/${D}no/${D}yes/" ${A}
sed -i -e "1 s/${E}/" -e "2 s/${F}/" -e "s/${I}/" ${G} ; echo ''"${J}"' "'"${K}"'"' >> "${G}"
sed -i -e "2 s/${E}/" -e "3 s/${F}/" -e "s/${I}/" ${H} ; echo "${J} ${K}" >> ${H} 
rm /etc/u /home/${U}/installMO.sh /etc/install.sh
echo -e "${B}Done!\nType: 'exit' then 'reboot'${C}" 
rm -- "$0"  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
