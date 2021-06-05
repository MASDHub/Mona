#!/bin/bash
set -euo pipefail 
A='pikaur' ; B='\e[1;31m' ; C='\e[0m' ;  D='.config' ; E='openbox' ; F='reversesearchsorting =' ; G='noedit =' ; H='alacritty'  
I='.config/openbox/menu.xml' ; J='<item label="' ; K='"><action name="Execute"><command>' ; L='</command></action></item>'  
M='manager' ; N='GRUB_GFXMODE=' ; U=$(cat /etc/u.txt) ; X='/usr/share/sddm/scripts/Xsetup' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
sed -i "s/${F} no/${F} yes/" /home/${U}/${D}/${A}.conf ; sed -i "s/${G} no/${G} yes/" /home/${U}/${D}/${A}.conf
cp /home/${U}/${H}/target/release/${H} /usr/local/bin ; cp /home/${U}/${H}/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
desktop-file-install /home/${U}/${H}/extra/linux/Alacritty.desktop ; update-desktop-database 
cp /etc/xdg/${E}/environment /home/${U}/${D}/environment ; cp /etc/xdg/${E}/menu.xml /home/${U}/${I}
sed -i '5,$d' /home/${U}/${D}/${E}/menu.xml ; echo -e '<menu id="root-menu" label="Openbox 3">' >> /home/${U}/${I}
echo -e "${J}File Manager${K}nemo${L}\n${J}Internet${K}firefox-developer-edition${L}\n${J}Terminal${K}${H}${L}" >> /home/${U}/${I}
echo -e "${J}Text Editor${K}geany${L}\n${J}Settings${K}xfce4-settings-${M}${L}\n${J}Calculator${K}galculator${L}" >> /home/${U}/${I}
echo -e "${J}Refresh${K}openbox --reconfigure${L}\n${J}Reboot${K}reboot${L}\n${J}Power Off${K}poweroff${L}\n</menu>\n</openbox_menu>\n" >> /home/${U}/${I} 
echo -e "picom &\nxfce-mcs-${M} &\n\nxfce4-panel &\n" >> /home/${U}/${D}/${E}/autostart ; echo "exec ${E}-session" >> /home/${U}/.xinitrc 
printf "${B}DISPLAY MANAGER ENABLED${C}" ; systemctl enable sddm ; { echo 'M="$(xrandr | grep -Ec ''HDMI-1|HDMI1|eDP1|eDP-1|VGA1|VGA-1'')"'
echo 'M1="$(xrandr|grep -Eo ''eDP1|eDP-1|VGA1|VGA-1'')"' ; echo 'M2="$(xrandr | grep -Eo ''HDMI-1|HDMI1'')"' ; echo 'if [[ "${M}" == "2" ]]' 
echo 'then xrandar --output ${M1} --mode 1920x1080 --pos 0x0 --rotate normal --ouput {$M2} --primary --auto --pos 1920x0 --rotate normal ; fi' ; } >> ${X}
printf "${B}NETWORK ENABLED${C}\n" ; systemctl enable NetworkManager ; printf "${B}Done! ( Type: 'exit' and then 'reboot' )${C}\n" 
rm /etc/u.txt ; rm /home/${U}/installMO.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
