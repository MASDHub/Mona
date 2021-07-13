#!/usr/bin/bash
set -euo pipefail
C='"><actionname="Execute"><command>'
G=' /net/launchpad/plank/docks/ ';H='
; sleep 2 && ';D='</command></action>
</item><item label="';I=' docks.ini '
E='separator>';A=.config/openbox;F=.\
'config/plank/docks1/launcher/' #~~~#
cp -r /etc/xdg/openbox $A;git clone \
https://aur.archlinux.org/pikaur.git
cd pikaur/;makepkg -sri;pikaur -S --\
needed oranchelo-icon-theme-git time\
shift picom-git ttf-ms-fonts;sed -i '
s/g = no/g = yes/' .config/pikaur.co\
nf;sed -i -e 's/Clearlooks/Bear2/' -\
e '100,131 s/4/2/' -e '10,100 s/9/13/
' -e 's/kfmclient openProfile/rofi -/
' -e 's/ filemangnagement/show drun/ 
' -e '10,120 s/8/12/ -e 's/W-e/0x85/
-e 's/sans/Fira Sans Condensed Book/'
-e 's/A-space/0x85/' $A/rc.xml;sed -\
i '5,$d' $A/menu.xml;echo -e '<menu'\
' id="root-menu" label="Openbox 3">
<item label="File'$C'nemo'$D'Search'\
$C'rofi -show drun'$D'Web'$C'firefox
'$D'Terminal'$C'alacritty'$D'Text'$C'
geany'$D'Calculator'$C'galculator'$D\
'Refresh'$C'openbox --reconfigure'$D\
'Lock Screen'$C'xlock +description '\
'-mode atlantis -echokeys -echokey '\
"'*'"' -info "Enter Log-In Password:"
'$D'Reboot'$C'reboot'$D'Power-Off'$C\
'poweroff</command></action></item>'\
'</menu></openbox_menu>'>>$A/menu.xml
echo -e "lxqt-policykit &\n\npicom -\
-experimental-backends &\n\nplank &\n
trayer --transparent true --monitor \
primary --height 40 --tint 0x716966 \
--align right &\n\nxpad &\n\n(sleep \
2 && volumeicon) &\n\n(sleep 2 && nm\
-applet) &\n\n(sleep 2 && sh na.sh) &
">$A/autostart;echo -e 'dconf dump'$\
G'>'$I''$H'sed -i "s/bottom/right/"'\
$I''$H'cat'$I'|dconf load'$G''$H'ec'\
'ho "[PlankDockItemPreferences]\nLa'\
'uncher=file:///usr/share/applicatio'\
'ns/nemo.desktop">'$F'nemo.dockitem'\
$H'rm '$F'{geeqie.dockitem,vlc-1.do'\
'ckitem}'$H'sed -i '"'15,"'$d'"'"' '\
$A'/autostart'$H'pkill volumeicon'$H\
'sed -i -e "13,16 s/fals/tru/" -e "
s/xterm -e '"'alsamixer'"'/pavucont'\
'rol/" .config/volumeicon/volumeicon'\
''$H'volumeicon;sleep 19&&rm'$I'$0'>\
na.sh;su root -c "chmod 755 $(cat /e\
tc/U)na.sh";rm /etc/U $0;echo -e '\e[
1;31mDone!\nTo End Type: reboot\e[0m'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
