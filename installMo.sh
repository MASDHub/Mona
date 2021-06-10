#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; B='<item label="' ; C='"><action name="Execute"><command>' ; D='</command></action></item>' E='<separator></separator>'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#if [[ -n "$(grep -E '[8|9|10|11|12|13|14]' /sys/class/dmi/id/chassis_type)" ]] ; then R='uacpid cbatticon'
cd ~ ; git clone https://aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri
pikaur -S --needed picom-git rofi-dmenu obkey ttf-ms-fonts timeshift ; mkdir ~/${A} ~/.themes ~/.icons
wget -q -O - "https://github.com/OrancheloTeam/oranchelo-icon-theme/archive/refs/tags/v0.8.0.1.tar.gz" | tar -xzf - -C ~/.icons
wget -q -O - "https://github.com/keeferrourke/capitaine-cursors/archive/refs/tags/r4.tar.gz" | tar -xzf - -C ~/.icons #echo "Xcursor.size: 36" >> ~/.Xresources
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/installna.sh > ~/installna.sh
 cp -a /etc/xdg/openbox/ ~/.config/ ; sed -i '5,$d' ~/${A}/menu.xml 
{ echo -e "<menu id="'"root-menu"'" label="'"Openbox 3"'">\n${B}Files${C}nemo${D}
${B}Web${C}firefox-developer-edition${D}\n${B}Terminal${C}alacritty${D}\n${B}Text${C}geany${D}
${B}Calculator${C}galculator${D}\n${E}\n${B}Search${C}rofi -show drun${D}\n${B}Refresh${C}openbox --reconfigure${D}${E}
${B}Lock Screen${C}xlock -mode atlantis +description -echokeys -echokey '*' -info "'"Enter password to unlock"'"${D}
${B}Reboot${C}reboot${D}\n${B}Power Off${C}poweroff${D}</menu></openbox_menu>" ; } >> ~/${A}/menu.xml
sed -i -e '50,120 s/8/12/' -e '50,120 s/9/13/' -e 's/sans/Fira Sans Condensed Book/g' -e 's/A-space/0x85/' \
-e 's/W-e/0x85/' -e 's/Konqueror/Dmenu/' -e 's/kfmclient openProfile filemanagement/rofi -show drun/' ~/${A}/rc.xml 
{ echo -e "lxqt-policykit &\n\npicom &\n\n(sleep 2 && trayer --monitor primary --height 40 --align right \
--iconspacing 10 --transparent true --tint 0x716966) &\n\n(sleep 2 && plank) &\n\n(sleep 2 && nm-applet) &
\n\n(sleep 2 && volumeicon) &" ; } > ~/${A}/autostart
echo "exec openbox-session" >> ~/.xinitrc ; su --login root -c "sh /home/$USER/installna.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
