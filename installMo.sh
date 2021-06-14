#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; B='<item label="' ; C='"><action name="Execute"><command>'
D='</command></action></item>' E='<separator></separator>' ; U="$( cat /etc/U )"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#if [[ -n "$(grep -E '[8|9|10|11|12|13|14]' /sys/class/dmi/id/chassis_type)" ]] ; then R='uacpid cbatticon'
git clone https://aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri
pikaur -S picom-git oranchelo-icon-theme-git ttf-ms-fonts timeshift
sed -i 's/g = no/g = yes/' ~/.config/pikaur.conf
mkdir ~/${A} ; cp -a /etc/xdg/openbox/ ~/.config/
sed -i '5,$d' ~/${A}/menu.xml
{ echo -e "<menu id="'"root-menu"'" label="'"Openbox 3"'">
${B}Files${C}nemo${D}\n${B}Search${C}rofi -show drun${D}
${B}Web${C}firefox${D}\n${B}Terminal${C}alacritty${D}
${B}Text${C}geany${D}\n${B}Calculator${C}galculator${D}
${E}\n${B}Refresh${C}openbox --reconfigure${D}\n${E}
${B}Lock Screen${C}xlock -mode atlantis +description -echokeys -echokey '*' -info "'"Enter password to unlock"'"${D}
${B}Reboot${C}reboot${D}\n${B}Power Off${C}poweroff${D}
</menu></openbox_menu>" ; } >> ~/${A}/menu.xml
sed -i -e '50,120 s/8/12/' -e '50,120 s/9/13/' -e 's/A-space/0x85/' \
-e '131 s/4/2/' -e 's/sans/Fira Sans Condensed Book/g' \
-e 's/kfmclient openProfile filemanagement/rofi -show drun/' \
-e 's/W-e/0x85/' -e 's/Konqueror/Dmenu/' ~/${A}/rc.xml
{ echo -e 'lxqt-policykit &\n\npicom --experimental-backends &\n\nplank &\n
trayer --monitor primary --height 40 --align right --transparent true --tint 0x716966 &\n
(nm-applet) &\n\n(volumeicon) &\n\nwait 10s &\n\n./mona.sh &' ; } > ~/${A}/autostart
{ echo 'dconf dump /net/launchpad/plank/docks/ > ~/docks.ini'
echo 'sed -i '"'s/bottom/right/'"' ~/docks.ini'
echo 'cat ~/docks.ini | dconf load /net/launchpad/plank/docks/'
echo 'sed -i '"'13,"'$d'"'"' ~/.config/openbox/autostart'
echo 'rm ~/.config/plank/dock1/launchers/{geeqie.dockitem,vlc-1.dockitem,vlc.dockitem}'
echo -e 'echo -e "'"[PlankDockItemPreferences]
Launcher=file:///usr/share/applications/nemo.desktop"'" >> ~/.config/plank/dock1/launchers/nemo.dockitem'
echo 'rm -- "$0"' ; } > ~/mona.sh 
cp /etc/X11/xinit/xinitrc ~/.xinitrc
sed -i 's/twm/openbox-session/' ~/.xinitrc
echo -e "Done!\nType: 'exit' then 'reboot'"
su --login root -c "chmod 755 /home/${U}/mona.sh && rm /etc/U && rm -- "$0""
 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
