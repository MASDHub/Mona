#!/usr/bin/bash
set -euo pipefail
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox';I='docks.ini';H='
sleep 2&&';E='<separator></separator>
';D='</command></action></item><item 
label="';C='"><actionname="Execute">
<command>';G='/net/launchpad/plank/docks/'
F='.config/plank/dock1/launchers/'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
mkdir .config;cp -a /etc/xdg/openbox\
/ .config/; sed -i '5,$d' $A/menu.xml 
git clone https://aur.archlinux.org/\
pikaur.git;cd pikaur/ ; makepkg -fsri
pikaur -S timeshift picom-git ttf-ms\
-fonts oranchelo-icon-theme-git;sed \
-i 's/g = no/g = yes/' .config/pikau\
r.conf;sed -i -e 's/Clearlooks/Bear2/
' -e 's/W-e/0x85/' -e '10,100 s/9/13/
' -e 's/A-space/0x85/' '5,120 s/8/12/
' -e '/kfmclient openProfile/rofi/' \
-e 's/sans/Fira Sans Condensed Book/
' -e 's/filemanagement/-show drun/' \
-e '131 s/4/2/' ~/$A/rc.xml;echo -e "
<menu id="'"root-menu"'" label="'"Op\ 
enbox 3"'"><item label="Files${C}nemo
<${D}Search${C}rofi -show drun<${D}W\
eb${C}Firefox${D}Terminal${C}alacrit\
ty<${D}Text${C}geany<${D}Calculator$C
galculator<${D}${E}Refresh${C}openbo\
x --reconfigure</${D}${E}Lock Screen\
${C}xlock -mode atlantis -echokeys -\
echokey '*' -info +description "'"Pa\
ssword: "'"<${D}Reboot${C}reboot<${D}
Power Off${C}poweroff</command></act\
ion></item></menu></openbox_menu>">>\
$A/menu.xml;echo -e "lxqt-policykit &
\n\npicom --experimental-backends &\n
plank &\n\nxpad &\n\ntrayer --align \
right --monitor primary --height 40 \
--transparent true --tint 0x716966 &
\n('"$H"'volumeicon) &\n\n('"$H"'nm-\
applet) &\n\n('"$H"'sh m.sh) &">$A/a\
utostart;echo -e 'dconf dump '"$G"'>'
"$I"' '"$H"'sed -i '"'s/bottom/right/
'"' '"$I"''"$H"'cat '"$I"'|dconf loa\
d '"$G"''"$H"'echo -e "'"[PlankDockI\
temPreferences]\nLauncher=file:///us\
r/share/applications/nemo.desktop"'">
'"$F"'nemo.dockitem'"$H"'rm '"$F"'{g\
eeqie.dockitem,vlc-1.dockitem}'"$H"'
pkill volumeicon'"$H"'sed -i -e '"'
13,16 s/false/true/'"' -e '"'s/5/1/'"
' .config/volumeicon/volumeicon'"$H"'
volumeicon'"$H"'sed -i '"'15,"'$d'"'"
' '"$A"'/autostart'"$H"'sleep 9&&rm'"
$I"'&&rm $0'>m.sh;su root -c "chmod \
755 $(cat /etc/U)m.sh";rm $0;echo -e 
'\e[1;31mDone!\nType: reboot\e[0m'
rm /etc/U
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
