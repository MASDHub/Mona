#!/usr/bin/bash
set -euo pipefail
C='"><actionname="Execute"><command>'
G=' /net/launchpad/plank/docks/ ';H='
sleep 2 && ';D='</command></action>'\
'</item><item label="';I=' docks.ini'
E='separator>';A=.config/openbox:F=.\
'config/plank/docks1/launcher/' #~~~#
cp -r /etc/xdg/openbox $A;git clone \
https://aur.archlinux.org/pikaur.git
cd pikaur/;makepkg -sri;pikaur -S --\
needed oranchelo-icon-theme-git time\
shift picom-git ttf-ms-fonts;sed -i '
s/g = no/g = yes/' .config/pikaur.co\
nf;sed -i -e 's/Clearlooks/Bear2/' -\
e '100,131 s/4/2/' -e '10,100 s/9/13/
' -e '10,120 s/8/12/ -e 's/W-e/0x85/
' -e 's/kfmclient openProfile/rofi -/
' -e 's/ filemangnagement/show drun/'
-e 's/sans/Fira Sans Condensed Book/'
-e 's/A-space/0x85/' ~/$A/rc.xml;sed \
-i '5,$d' $A/menu.xml;echo -e ''<men'
'u id="root-menu" label="Openbox 3">'
'<item label="File'$C'nemo'$D'Search'
'$C'rofi -show drun'$D'Web'$C'firefox
'$D'Terminal'$C'alacritty'$D'Text'$C'
geany'$D'Calculator'$C'galculator'$D'
Re-fresh'$C'openbox --reconfigure'$D'
Lock Screen'$C'xlock -mode atlantis \
-echokeys -echokey '"'*'"' -info +de\
scription "'Password: '"'$D'Re-boot
'$C'reboot'$D'Power-Off'$C'poweroff
</command></action></item></menu>
</openbox_menu>'>>.$A/menu.xml 
echo -e "lxqt-policykit &\n
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
