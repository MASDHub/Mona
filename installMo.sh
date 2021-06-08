#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; B='<item label="' ; C='"><action name="Execute"><command>' ; D='</command></action></item>' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ; git clone https://aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri ; curl -sL https://git.io/JGVg5 > ~/installna.sh
pikaur -S --needed picom-git rofi-dmenu oranchelo-icon-theme obkey ttf-ms-fonts timeshift 
mkdir -p ~/${A} ; cp -a /etc/xdg/openbox/ ~/.config/ ; sed -i '5,$d' ~/${A}/menu.xml 
{ echo -e "<menu id="'"root-menu"'" label="'"Openbox 3"'">\n${B}Files${C}nemo${D}\n${B}Search${C}rofi -show drun${D}
${B}Web${C}firefox-developer-edition${D}\n${B}Terminal${C}alacritty${D}\n${B}Text${C}geany${D}
${B}Calculator${C}galculator${D}\n${B}Refresh${C}openbox --reconfigure${D}\n<separator></separator> 
${B}Lock Screen${C}xlock -mode atlantis +description -echokeys -echokey '*' -info "'"Enter password to unlock"'"${D}
${B}Reboot${C}reboot${D}\n${B}Power Off${C}poweroff${D}</menu></openbox_menu>" ; } >> ~/${A}/menu.xml
sed -i -e '50,120 s/8/12/' -e '50,120 s/9/13/' -e 's/sans/Fira Sans Condensed Book/g' -e 's/A-space/0x85/' \
-e 's/W-e/0x85/' -e 's/Konqueror/Dmenu/' -e 's/kfmclient openProfile filemanagement/rofi -show drun/' ~/.config/openbox/rc.xml
#sed -e '248s/$/<keybind key="A-Tab"><action name="Execute">\
echo -e "exec openbox-session" >> ~/.xinitrc ; { echo -e 'lxqt-policykit &\n\npicom &\n 
(sleep 2s && trayer --monitor primary --height 40 --align right --iconspacing 10 --transparent true --tint 0x716966) & 
\n(sleep 2s && plank) &\n\n(sleep 2s && nm-applet) &\n\n(sleep 2s && volumeicon) &' ; } > ~/${A}/autostart 
su --login root -c "sh /home/$USER/installna.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
