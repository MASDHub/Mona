#!/usr/bin/bash
set -euo pipefail
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox'; H='sleep 2&& 
'; I=' docks.ini'; D='</command><
/action></item><item label="';E='
<separator></separator>';C='"><ac
tionname="Execute"><command>';F='
.config/plank/dock1/launchers/'
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
-space/0x85/' ${A}/rc.xml; echo -e "
<menu id="'"root-menu"'" label="'" \
Openbox 3"'"> \n<item label="Files \
${C}nemo${D}Search${C}rofi -show dr\
un${D}Web${C}Firefox${D}\nTerminal \
${C}alacritty${D}\nText${C}geany${D}
Calculator${C}galculator${D}${E}Ref\
resh${C}openbox --reconfigure${D}$E\
Lock Screen${C}xlock -mode atlantis\
 -echokeys -echokey '*' -info +desc\
ription "'"Password: "'"${D}\nReboot
${C}reboot${D}Power Off${C}poweroff\
</command></action></item></menu></\
openbox_menu>">>$A/menu.xml; echo -\
e "lxqt-policykit &\n\npicom --expe\
rimental-backends &\n\nplank &\n\nt\
rayer --monitor primary --align rig\
ht --tint 0x716966 --height 40 --tr\
ansparent true &\n\nxpad &\n\n(slee\
p 2&&nm-applet) &\n\n(sleep 3&&volu\
meicon) &\n\n(sleep 4&&sh m.sh) &" \
>$A/autostart;echo -e 'dconf dump '"
$G"'>'"$I"';'"$H"'sed -i '"'s/botto\
m/right/'"''"$I"' ;'"$H"'cat'"$I"' |
dconf load '"$G"' ; '"$H"'echo -e "'
"[PlankDockItemPreferences]\nLaunch\
er=file:///usr/share/applications/n\
emo.desktop"'">> '"$F"'nemo.dockitem
'"$H"'rm '"$F"'{geeqie.dockitem,vlc\
-1.dockitem};'"$H"'pkill volumeicon
'"$H"'sed -i '"'15,"'$d'"'"' '"$A"
'/autostart'"$H"'sed -i -e '"'s/5/1/
'"' -e '"'13,16 s/false/true/'"' .c\
onfig/volumeicon/volumeicon ; '"$H"
'volumeicon; sleep 18 && rm'"$I"' &&
rm -- $0'>m.sh;su root -c "echo -e '
\e[1;31mDone!\nType: reboot\e[0m' &&
rm -- $0&&chmod 755 $(cat /etc/U)h&&
rm /etc/U"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
