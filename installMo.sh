#!/usr/bin/bash
set -euo pipefail
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
C='"><actionname="Execute"><command>'
G=' /net/launchpad/plank/docks/ ';D='
</command></action></item><item lab'\
'el="';E=<separator></separator>;F=.\
'config/plank/docks1/launcher/';A=.co\
'nfig/openbox';I='docks.ini';H='sleep 2
&&'
' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cp -r /etc/xdg/openbox/ $A;git clone\
 https://aur.archlinux.org/pikaur.gi\
t;cd pikaur/;makepkg -fsri;pikaur -S\
 --needed oranchelo-icon-theme-git t\
imeshift picom-git ttf-ms-fonts;sed \  
-i 's/g = no/g = yes/' .config/pikau\
r.conf;sed -i -e 's/Clearlooks/Bear2/
' -e 's/W-e/0x85/' -e '10,100 s/9/13/
' -e 's/A-space/0x85/' '5,120 s/8/12/
' -e 's/kfmclient openProfile/rofi -/
' -e 's/ filemangnagement/show drun/'
-e 's/sans/Fira Sans Condensed Book/'
-e '100,131 s/4/2/' ~/$A/rc.xml
sed -i '5,$d' ~/$A/menu.xml;echo -e "
<menu id="'"root-menu"'" label="'"Op\
enbox 3"'"><item label='"'Files${C}nem
o${D}Search${C}rofi -show drun${D}We\
b${C}Firefox${D}Terminal${C}alacritt\
y${D}Text${C}geany${D}Calculator${C}\
galculator${D}${E}Refresh${C}openbox\
 --reconfigure${D}${E}Lock Screen${C}
xlock -mode atlantis -echokeys -echo\
key '*' -info +description "'"Passwo\
rd: "'"${D}Re-boot${C}reboot${D}Powe\
r-Off${C}poweroff</command></action>\
</item></menu></openbox_menu>">>.$A/\
menu.xml; echo -e "lxqt-policykit &\n
picom --experimental-backends &\n\np\
lank &\n\ntrayer --transparent true \
--align right --height 40 --monitor \
primary --tint 0x716966 &\n\nxpad &\n
(sleep 2 && volumeicon) &\n\n(sleep \
2 && nm-applet) &\n\n(sleep 2 && sh \
m.sh) &">~/$A/autostart;echo -e 'dco\
nf dump '"$G"'>'"$I"''"$H"'sed -i '"'
s/bottom/right/'"' '"$I"''"$H"'cat '"
$I"'|dconf load '"$G"''"$H"'echo -e "
'"[PlankDockItemPreferences]\nLaunch\
er=file:///usr/share/applications/ne\
mo.desktop"'">'"$F"'nemo.dockitem'"$H
"'rm '"$F"'{geeqie.dockitem,vlc-1.do\
ckitem}'"$H"'sed -i '"'15,"'$d'"'"' '
"$A"'/autostart'"$H"'pkill volumeicon
'"$H"'sed -i -e '"'13,16 s/fals/tru/'
"' -e '"'s/xterm -e "'alsamixer'"/pa\
vucontrol/'"' .config/volumeicon/volu\
meicon'"$H"'volumeicon'"$H"'sleep 19&&
rm'"$I"'&&rm $0'>m.sh ; su root -c "
chmod 755 $(cat /etc/U)m.sh";echo -e \
'\e[1;31mDone,Type: reboot\e[0m';rm $0
rm /etc/U
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
