#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; B='<item label="' ; C='"><action name="Execute"><command>' ; D='</command></action></item>' E='<separator></separator>'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#if [[ -n "$(grep -E '[8|9|10|11|12|13|14]' /sys/class/dmi/id/chassis_type)" ]] ; then R='uacpid cbatticon'
cd ~ ; git clone https://aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri
pikaur -Syyu --needed picom-git oranchelo-icon-theme-git obkey ttf-ms-fonts timeshift
mkdir ~/${A} ; cp -a /etc/xdg/openbox/ ~/.config/ ; sed -i '5,$d' ~/${A}/menu.xml #echo "Xcursor.size: 36" >> ~/.Xresources
{ echo -e "<menu id="'"root-menu"'" label="'"Openbox 3"'">\n${B}Files${C}nemo${D}
${B}Search${C}rofi -show drun${D}\n${B}Web${C}firefox-developer-edition${D}\n${B}Terminal${C}alacritty${D}
${B}Text${C}geany${D}\n${B}Calculator${C}galculator${D}\n${E}\n${B}Refresh${C}openbox --reconfigure${D}${E}
${B}Lock Screen${C}xlock -mode atlantis +description -echokeys -echokey '*' -info "'"Enter password to unlock"'"${D}
${B}Reboot${C}reboot${D}\n${B}Power Off${C}poweroff${D}</menu></openbox_menu>" ; } >> ~/${A}/menu.xml
sed -i -e '50,120 s/8/12/' -e '50,120 s/9/13/' -e 's/sans/Fira Sans Condensed Book/g' -e 's/A-space/0x85/' \
-e 's/W-e/0x85/' -e 's/Konqueror/Dmenu/' -e 's/kfmclient openProfile filemanagement/rofi -show drun/' \
-e '131 s/4/2/' ~/${A}/rc.xml ; { echo -e 'lxqt-policykit &\n\npicom &\n\n\nplank &\n
trayer --monitor primary --height 40 --align right --iconspacing 10 --transparent true --tint 0x716966 &\n
(nm-applet) &\n\n(volumeicon) &' ; } > ~/${A}/autostart ; pikaur -Scc --noconfirm
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/installna.sh > ~/installna.sh
echo "exec openbox-session" >> ~/.xinitrc ; su --login root -c "sh /home/$USER/installna.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
