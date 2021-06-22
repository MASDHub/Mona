#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; B='<item label="'
C='"><action name="Execute"><command>'
D='</command></action></item>'
E='<separator></separator>'
F='.config/plank/dock1/launchers'
G='net/launchpad/plank/docks'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#if [[ -n "$(grep -E '[8|9|10|11|12|13|14]' /sys/class/dmi/id/chassis_type)" ]] ; then R='uacpid cbatticon'
git clone https://aur.archlinux.org/pikaur.git  
cd pikaur ; makepkg -fsri ;pikaur -S picom-git \
oranchelo-icon-theme-git ttf-ms-fonts timeshift
sed -i 's/g = no/g = yes/' ~/.config/pikaur.conf
mkdir ~/${A} ; cp -a /etc/xdg/openbox/ ~/.config/
sed -i '5,$d' ~/${A}/menu.xml 
{ echo -e "<menu id="'"root-menu"'" label="'"Openbox 3"'">
${B}Files${C}nemo${D}\n${B}Search${C}rofi -show drun${D}
${B}Web${C}firefox${D}\n${B}Terminal${C}alacritty${D}
${B}Text${C}geany${D}\n${B}Calculator${C}galculator${D}
${E}\n${B}Refresh${C}openbox --reconfigure${D}\n${E}
${B}Lock Screen${C}xlock -mode atlantis +description \
-echokeys -echokey '*' -info "'"Enter password to unlock"'"${D}
${B}Reboot${C}reboot${D}\n${B}Power Off${C}poweroff${D}
</menu></openbox_menu>" ; } >> ~/${A}/menu.xml
sed -i -e '50,120 s/9/13/' -e 's/W-e/0x85/' -e '131 s/4/2/' \
-e 's/kfmclient openProfile filemanagement/rofi -show drun/' \
-e 's/sans/Fira Sans Condensed Book/g' -e 's/Konqueror/menu/' \
-e '50,120 s/8/12/' -e 's/A-space/0x85/' \
-e 's/Clearlooks/Bear2/' ~/${A}/rc.xml
{ echo -e "lxqt-policykit &\n\npicom \
--experimental-backends &\n\nplank &\n 
trayer --monitor primary --height 40 \
--align right --transparent true --tint \
0x716966 &\n\n(nm-applet) &\n\n(volumeicon) &
\n(sleep 5 && sh ~/mona.sh) &" ; } > ~/${A}/autostart
{ echo -e 'dconf dump /'"${G}"'/ > ~/docks.ini'
echo -e 'sleep 2 && sed -i '"'s/bottom/right/'"' ~/docks.ini'
echo -e 'sleep 2 && cat ~/docks.ini | dconf load /'"${G}"'/'
echo 'sleep 2 && echo -e "'"[PlankDockItemPreferences]\nLauncher=file:///usr/share/applications/nemo.desktop"'" > ~/'"${F}"'/nemo.dockitem'
echo -e 'sleep 1 && rm ~/'"${F}"'/geeqie.dockitem'
echo -e 'sleep 1 && rm ~/'"${F}"'/vlc-1.dockitem'
echo -e 'sleep 1 && rm ~/'"${F}"'/vlc.dockitem'
echo -e 'sleep 1 && sed -i '"'13,"'$d'"'"' ~/.config/openbox/autostart'
echo -e 'sleep 1 && pkill volumeicon' ; echo -e 'sleep 2 && sed -i -e '"'s/b_slider=false/b_slider=true/'"' -e '"'s/5/1/'"' -e '"'s/l=false/l=true/'"' ~/.config/volumeicon/volumeicon' 
echo -e 'sleep 1 && volumeicon' ; echo 'sleep 10 && rm ~/docks.ini && rm ~/mona.sh' ; } > ~/mona.sh 
U="$(cat /etc/U)"
su root -c "chmod 755 /home/${U}/mona.sh && rm /etc/U && rm -- $0"
echo -e '\e[1;31mDone!\nTo Finish Type: 'reboot'\e[0m'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
