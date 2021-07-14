#!/usr/bin/bash
set -euo pipefail
C='"><actionname="Execute"><command>'
G=' /net/launchpad/plank/docks/ ';H='
; sleep 2 && ';D='</command></action>
</item><item label="';I=' docks.ini '
E='separator>';A=.config/openbox;F=.\
'config/plank/docks1/launcher/' #~~~#
git clone https://aur.archlinux.org/\
pikaur.git;cd pikaur/;makepkg -fsri
pikaur -S --needed timeshift ttf-ms-\
fonts picom-git oranchelo-icon-theme\
-git;sed -i 's/g = no/g = yes/' ~/.c\
onfig/pikaur.conf;cp -a /etc/xdg/ope\
nbox/ ~/.config/;sed -i -e 's/kfmcli\
ent openProfile filemanagement/rofi \
-show drun/' -e 's/Clearlooks/Bear2/
' -e '99,131 s/4/2/' -e '9,99 s/9/13/
' -e 's/W-e/0x85/' -e '10,120 s/8/12/
' -e 's/A-space/0x85/' ~/$A/rc.xml
sed -i '5,$d' $A/menu.xml;echo -e ''\
'<menu id="root-menu" label="Openbo'\
'x 3"><item label="File'$C'nemo'$D''\
'Search'$C'rofi -show drun'$D'Web'$C\
'firefox'$D'Terminal'$C'alacritty'$D\
'Text'$C'geany'$D'Calculator'$C'gal'\
'culator'$D'Refresh'$C'openbox --re'\
'configure'$D'Lock Screen'$C'xlock '\
'+description -mode atlantis -echok'\
'eys -echokey '"'*'"' -info "Enter '\
'Password:"'$D'Reboot'$C'reboot'$D''\
'Power-Off'$C'poweroff</command></a'\
'ction></item></menu></openbox_menu>
'>>$A/menu.xml;echo -e "lxqt-policyk\
it &\n\npicom --experimental-backend\
s &\n\ntrayer --monitor primary --tr\
ansparent true --tint 0x716966 --hei\
ght 40 --align right &\n\nplank &\n
xpad &\n\n(sleep 2 && volumeicon) &\n
(sleep 2 && nnm-applet) &\n\n(sleep \
2 && sh na.sh) &">$A/autostart;
echo -e 'dconf dump'$\
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
tc/U)a.sh";rm /etc/U $0;echo -e '\e[1
;31mDone:)\nTo End Type: \e[0mreboot'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
