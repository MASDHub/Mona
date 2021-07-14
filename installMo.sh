#!/usr/bin/bash
set -euo pipefail
C='"><actionname="Execute"><command>'
G=' /net/launchpad/plank/docks/ ';H='
;sleep 2&& ';D='</command></action>'\
'</item><item label="';I=' docks.ini'
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
' -e 's/sans/Fira Sans Condensed Boo\
k/' -e 's/A-space/0x85/' ~/$A/rc.xml
sed -i '5,$d' ~/$A/menu.xml;echo -e '
<menu id="root-menu" label="Openbox'\
' 3"><item label="Files'$C'nemo'$D''\
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
'>>~/$A/menu.xml;echo -e "lxqt-polic\
ykit &\n\npicom --experimental-backe\
nds &\n\ntrayer --monitor primary --\
transparent true --tint 0x716966 --h\
eight 40 --align right &\n\nplank &\n
(sleep 2 && volumeicon) &\n\n(sleep \
2 && nm-applet) &\n\n(sleep 2 && sh \
na.sh) &">~/$A/autostart;echo -e 'd'\
'conf dump'$G'>'$I''$H'sed -i "s/bo'\
'ttom/right/"'$I''$H'cat'$I'|dconf '\
'load'$G''$H'echo "[PlankDockItemPr'\
'eferences]\nLauncher=file:///usr/sh'\
'are/applications/nemo.desktop"> '$F\
'nemo.dockitem'$H'rm '$F'{geeqie.do'\
'ckitem,vlc-1.dockitem}'$H'sed -i '"'\
13,"'$d'"'"' '$A'/autostart'$H'pki'\
'll volumeicon'$H'sed -i -e "13,16 s'\
'/fals/tru/" -e "s/xterm -e '"'alsa\
mixer'"'/pavucontrol/" .config/volu'\
'meicon/volumeicon'$H'volumeicon;sl'\
'eep 19&&rm'$I'$0'>na.sh;su root -c "
chmod 755 $(cat /etc/U)a.sh";rm /etc\
/U $0;echo -e '\e[1;31mDone :) To End 
Type: \e[0mreboot'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
