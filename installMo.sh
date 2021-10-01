#!/usr/bin/bash
set -euo pipefail
A='.config/openbox';B='<item label="'
C='"><action name="Execute"><command>
';G='/.config/plank/docks1/launcher/'
D=' /net/launchpad/plank/docks/ ';F="
sleep 2 &&";I="</command></action></\
item>";E='<separator></separator>';H\
=" ~/docks.ini " #~~~~~~~~~~~~~~~~~~#
git clone -q https://aur.archlinux.o\
rg/pikaur.git;cd pikaur;makepkg -fsri
pikaur -S --needed ttf-ms-fonts time\
shift picom-git oranchelo-icon-theme
cp -a /etc/xdg/openbox/ ~/.config;se\
d -i 's/g = no/g = ye\
s/' ~/.config/pikaur.conf;sed -i -e '
9,99 s/9/13/' -e '9,100 s/8/12/' -e '
s/W-e/0x85/' -e '100,131 s/4/2/' -e \
's/sans/Fira Sans Condensed Book/' -\
e 's/kfmclient openProfile filemanag\
ement/rofi -show drun/' -e 's/A-spac\
e/0x85/' -e 's/Clearlooks/Bear2/' ~/\
$A/rc.xml;mkdir Arcade Media;sed -i \
-e '6,$d' -e 's/accessories/Openbox 3/
' -e 's/apps-accessories/root/' ~/$A\
/menu.xml;;echo -e ''\
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
s &\n\ntrayer --tint 0x716966 --heig\
ht 40 --monitor primary --transparen\
t true --align right &\n\n(sleep 2&&\
volumeicon) &\n\nplank &\n\n(sleep 2\
&&nm-applet) &\n\n(sleep 2&&sh .sh) &
">~/$A/autostart;ec\
ho -e 'echo "[PlankDockItemPreferen'\
'ces]\nLauncher=file:///usr/share/a'\
'pplications/nemo.desktop"> ~'$G'ne'\
'mo.dockitem'$F' rm ~'$G'{geeqie.do'\
'ckitem,vlc-1.dockitem}'$F'sed -i '"\
'13,"'$d'"'"' ~/'$A'/autostart'$F'd'\
'conf dump'$D'>'$H''$F'sed -i "s/bo'\
'ttom/right/"'$H''$F'cat'$H' |dconf'\
'load'$D''$F'pkill volumeicon'$F'se'\
'd -i -e "13,16 s/fals/tru/" -e "s/'\
'term -e '"'alsamixer'"'/pavucontrol/
" .config/volumeicon/volumeicon&&vol\
umeicon&&sleep 19&&rm'$H'$0'>~/.sh:e\
cho -e '\e[1;31mTo Finish Type:\e[0m
reboot'
