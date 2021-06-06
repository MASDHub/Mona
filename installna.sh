#!/bin/bash
set -euo pipefail 
A='pikaur' ; B='\e[1;31m' ; C='\e[0m' ;  D='.config' ; E='openbox' ; F='reversesearchsorting =' ; G='noedit =' ; H='alacritty'  
I='.config/openbox/menu.xml' ; J='<item label="' ; K='"><action name="Execute"><command>' ; L='</command></action></item>'  
M='manager' ; N='GRUB_GFXMODE=' ; U=$(cat /etc/u.txt) ; X='/usr/share/sddm/scripts/Xsetup' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
sed -i "s/${F} no/${F} yes/" /home/${U}/${D}/${A}.conf ; sed -i "s/${G} no/${G} yes/" /home/${U}/${D}/${A}.conf
cp /home/${U}/${H}/target/release/${H} /usr/local/bin ; cp /home/${U}/${H}/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
desktop-file-install /home/${U}/${H}/extra/linux/Alacritty.desktop # if [[ -f /usr/local/bin/alacritty ]]; then ; alacritty /etc/rofi/1080p/applets/android/apps.sh
cp /etc/xdg/${E}/ /home/${U}/${D}/${E}/ ; rm -rf /home/${U}/${D}/${E}/autostart
#sed -i '0,10d' ; echo -e 'gtk-theme-name="Oranchelo"\gtk-icon-theme-name="Oranchelo-Light"\ngtk-font-name="Fira Sans Compressed Book 12"' >> .gtkrc-2.0
#echo -e 'gtk-cursor-theme-name="capitaine-cursors"\ngtk-cursor-theme-size=36" >> .gtkrc-2.0 ; 
O="/home/${U}/${D}/${E}/rc.xml" ; cp /etc/xdg/${E}/rc.xml ${O} # sed -i '250,260d' ${O}  
#sed -e '248s/$/<keybind key="A-Tab"><action name="Execute"><command>rofi -dpi 96 -show window</command></action></keybind>/' ${O}
#sed -i '250,260d' ; sed -e '248s/$/<keybind key="A-Tab"><action name="Execute"><command>rofi -dpi 96 -show window</command></action></keybind>/' /home/${U}/${D}/${E}/rc.xml
sed -i '5,$d' /home/${U}/${D}/${E}/menu.xml ; echo -e { '<menu id="root-menu" label="Openbox 3">'
echo -e "${J}File Manager${K}nemo${L}\n${J}Search${K}rofi -show drun${L}\n${J}Internet${K}firefox-developer-edition${L}\n${J}Terminal${K}${H}${L}"
echo -e "${J}Text Editor${K}geany${L}\n${J}Calculator${K}galculator${L}"
echo -e "${J}Refresh${K}openbox --reconfigure${L}\n${J}Reboot${K}reboot${L}\n${J}Power Off${K}poweroff${L}\n</menu>\n</openbox_menu>\n" ; } >> /home/${U}/${I} 
echo -e { "picom &\nlxqt-policykit &\n(sleep 3s && trayer --monitor primary --height 40 --align right --iconspacing 10 --transparent true --tint 0x716966) &\n"
echo -e "\n (sleep 4s && nm-applet) &\n (sleep 5s && volumeicon) &\n (sleep 6s && plank) &" >> /home/${U}/${D}/${E}/autostart 
echo -e"exec ${E}-session" >> /home/${U}/.xinitrc ; update-desktop-database ; rofi -upgrade-config
printf "${B}DISPLAY MANAGER ENABLED${C}" ; systemctl enable sddm ; if [[ "$( pacman -Qd | grep -Ec tpl )" == [1-9] ]] 
then systemctl enable tlp && systemctl enable acpi ; fi # && echo "\ncbatticon -x powermenu_1080p &\n" >> home/${U}/${D}/${E}/autostart
{ echo 'M="$( xrandr | grep -Ec ''HDMI-1|HDMI1|eDP1|eDP-1|VGA1|VGA-1'' )"' ; echo 'M1="$( xrandr| grep -Eo ''eDP1|eDP-1|VGA1|VGA-1'' )"' 
echo 'M2="$( xrandr | grep -Eo ''HDMI-1|HDMI1'' )"' ; echo 'if [[ "${M}" == "2" ]] || [[ "${M}" == "3" ]]'
echo 'then xrandr --output "${M1}" --mode 1920x1080 --pos 0x0 --rotate normal --ouput "${M2}" --primary --auto --pos 1920x0 --rotate normal ; fi' ; } >> ${X}
printf "${B}NETWORK ENABLED${C}\n" ; systemctl enable NetworkManager ; printf "${B}Done! ( Type: 'exit' and then 'reboot' )${C}\n" 
rm /etc/u.txt ; rm /home/${U}/installMO.sh ; rm -- "$0"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
