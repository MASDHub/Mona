#!/usr/bin/bash
set -euo pipefail
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox';H='sleep 2 &&'
E='<separator></separator>' ; B='
<item label="' ; I=' ~/docks.ini'
C='"><actionname="Execute"><command>'
D='</command></action></item>'
F=' ~/.config/plank/dock1/launchers/'
G='/net/launchpad/plank/docks/'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
mkdir .config;cp -a /etc/xdg/openbox/ \
.config/ ; git clone \
https://aur.archlinux.org/pikaur.git
cd pikaur/;makepkg -fsri;pikaur -S \
picom-git timeshift ttf-ms-fonts \
oranchelo-icon-theme-git ; sed -i 's\
/g = no/g = yes/' .config/pikaur.conf
sed -i '5,$d' $A/menu.xml ; sed -i \
-e '5,120 s/8/12/' -e '131 s/4/2/' \
-e 's/W-e/0x85/' -e '5,99 s/9/13/' \
-e 's/kfmclient openProfile/rofi/' \
-e 's/filemanagement/-show drun/g' \
-e 's/Clearlooks/Bear2/' -e 's/sans\
/Fira Sans Condensed Book/' -e 's/A\
-space/0x85/' $A/rc.xml
echo -e "<menu id="'"root-menu"'" \
label="'"Openbox 3"'"> \n${B}Files\
${C}nemo${D}\n${B}Search${C}rofi -\
show drun ${D}\n${B}Web${C}firefox\
${D}\n${B}Terminal${C}alacritty${D}
${B}Text${C}geany${D}\n${B}Calcula\
tor${C}galculator${D}${E}\n${B}Ref\
resh${C}openbox --reconfigure ${D}\
${E}${B}Lock Screen${C}xlock -mode\
atlantis -echokeys -echokey '*' -i\
nfo +description "'"Password : "'"\
${D}\n${B}Reboot${C}reboot${D}${B}\
Power Off${C}poweroff${D}\n</menu>\
</openbox_menu>" >> $A/menu.xml
echo -e "lxqt-policykit &\n\npicom \
--experimental-backends &\n\nplank &
\ntrayer --monitor primary --align \
right --tint 0x716966 --height 40 -\
-transparent true &\n\nxpad &\n\n(s\
leep 2&&nm-applet) &\n\n(sleep 3&&v\
olumeicon) &\n\n(sleep 4&&sh m.sh) &
"> $A/autostart
echo -e 'dconf dump '"$G"' >'"$I"'
'"$H"'sed -i '"'s/bottom/right/'"' \
'"$I"'\n'"$H"'cat'"$I"'|dconf load \
'"$G"'\n'"$H"'echo -e "'"[PlankDock\
ItemPreferences]\nLauncher=file:///\
usr/share/applications/nemo.desktop\
"'">'"$F"'nemo.dockitem\n'"$H"'pkil\
l volumeicon\n'"$H"'sed -i -e '"'s/\
5/1/'"' -e '"'s/l=false/l=true/'"' \
-e '"'s/b_slider=false/b_slider=tru\
e/'"' .config/volumeicon/volumeicon
'"$H"'sed -i '"'15,"'$d'"'"' '"$A"'\
/autostart\n'"$H"'rm'"$F"'{geeqie.d\
ockitem,vlc-1.dockitem}\n'"$H"'volu\
meicon\nsleep 18&&rm'"$I"'&&rm -- $0
'>m.sh;su root -c "chmod 755 /home/\
$(cat /etc/U)/m.sh&&rm /etc/U &&rm \
-- $0";echo -e '\e[1;31mDone!
Type: reboot\e[0m'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
