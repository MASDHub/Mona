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
-e 's/sans/Fira Sans Condensed Book/
' -e 's/Clearlooks/Bear2/' -e 's/A-\
space/0x85/' $A/rc.xml;echo -e "<me\
nu id="'"root-menu"'" label="'" Ope\
nbox 3"'">\n<item label="Files${C}n\
emo${D}Search${C}rofi -show drun${D}
Web${C}Firefox${D}\nTerminal${C}ala\
critty${D}\nText${C}geany${D}Calcul\
ator${C}galculator${D}${E}Refresh${C}
openbox --reconfigure${D}${E}Lock S\
creen${C}xlock -mode atlantis -echo\
keys -echokey '*' -info +descriptio\
n "'"Password: "'"${D}\nReboot${C}r\
eboot${D}Power Off${C}poweroff\n\n
</command></action></item></menu>
</openbox_menu>">>$A/menu.xml;echo \
-e "lxq\
t-policykit &\n\npicom --experiment\
al-backends &\n\nplank &\n\ntrayer \
--monitor primary --align right --t\
int 0x716966 --height 40 --transpar\
ent true &\n\nxpad &\n\n(sleep 2&&n\
m-applet) &\n\n(sleep 3&&volumeicon\
) &\n\n(sleep 4&&sh m.sh) &">$A/aut\
ostart ; echo -e 'dconf dump '"
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
rm $0'>m.sh; su root -c "echo -e '\e
[1;31mDone!\nType: reboot\e[0m\n' &&
rm $0&&chmod 755 $(cat /etc/U)m.sh&&
rm /etc/U"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
