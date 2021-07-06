#!/usr/bin/bash
set -euo pipefail
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; H='sleep 2&& 
';B='<item label="';I=' docks.ini'
E='<separator> </separator>' ; C='
"><actionname="Execute"><command>'
F=' .config/plank/dock1/launchers/'
D='</command></action></item>'
G='/net/launchpad/plank/docks/'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
mkdir .config;cp -a /etc/xdg/openbox\
/ .config/ ; git clone \
https://aur.archlinux.org/pikaur.git
cd pikaur/; makepkg -fsri; pikaur -\
S picom-git timeshift ttf-ms-fonts \
oranchelo-icon-theme-git;sed -i 's/\
g = no/g = yes/' .config/pikaur.conf
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
echo -e 'dconf dump '"$G"'>'"$I"''"
$H"'sed -i '"'s/bottom/right/'"'\'"
$I"';'"$H"'cat'"$I"'|dconf load \'"
$G"';'"$H"'echo -e "'"[PlankDockIt\
emPreferences]\nLauncher=file:///us\
r/share/applications/nemo.desktop"'
">>'"$F"'nemo.dockitem;'"$H"'rm'"$F
"'\{geeqie.dockitem,vlc-1.dockitem}
'"$H"'pkill volumeicon;'"$H"'sed -\
i '"'15,"'$d'"'"' '"$A"'/autostart
'"$H"'sed -i -e '"'s/5/1/'"' -e '"'
13,16 s/false/true/'"' .config/volu\
meicon/volumeicon;'"$H"'volumeicon
sleep 18&&rm'"$I"'&&rm -- $0'>m.sh
su root -c "echo -e '\e[1;31mDone!
Type:reboot\e[0m'&&rm -- $0&&chmod\
 755 $(cat /etc/U)h&&rm /etc/U"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
