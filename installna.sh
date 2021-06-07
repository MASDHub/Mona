#!/bin/bash
set -euo pipefail ; U=$(cat /etc/u.txt)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
A="/home/${U}/.config/pikaur.conf" ; B='\e[1;31m' ; C='\e[0m' ; F='noedit =' ; G='reversesearchsorting =' ; X='/usr/share/sddm/scripts/Xsetup' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
sed -i "s/${G} no/${G} yes/" ${A} ; sed -i "s/${F} no/${F} yes/" ${A} ; update-desktop-database 
printf "${B}DISPLAY MANAGER ENABLED${C}" ; systemctl enable sddm ; printf "${B}NETWORK ENABLED${C}\n" ; systemctl enable NetworkManager
if [[ "$( pacman -Qd | grep -Ec tpl )" == [1-9] ]] ; then systemctl enable tlp && systemctl enable acpi ; fi
{ echo 'M="$( xrandr | grep -Ec ''HDMI-1|HDMI1|eDP1|eDP-1|VGA1|VGA-1|DVI1|DVI-1'' )"'
echo 'M1="$( xrandr | grep -Eo ''eDP1|eDP-1'' )"' ; echo 'M2="$( xrandr | grep -Eo ''HDMI-1|HDMI1|DVI-1|DVI1|VGA1|VGA-1'' )"' ; echo 'if [[ "${M}" == "2" ]]'
echo 'then xrandr --output "${M1}" --mode 1920x1080 --pos 0x0 --rotate normal --ouput "${M2}" --primary --auto --pos 1920x0 --rotate normal ; fi' ; } >> ${X}
printf "${B}Done! ( Type: 'exit' and then 'reboot' )${C}\n" ; rm /etc/u.txt ; rm /home/${U}/installMO.sh ; rm -- "$0"
#sed -i '0,10d' >> .gtkrc-2.0 ; { echo -e 'gtk-theme-name="Oranchelo"\gtk-icon-theme-name="Oranchelo-Light"\ngtk-font-name="Fira Sans Compressed Book 12"'
#echo -e 'gtk-cursor-theme-name="capitaine-cursors"\ngtk-cursor-theme-size=36" >> .gtkrc-2.0 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
