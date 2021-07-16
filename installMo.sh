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
pikaur -S --needed timeshift ttf-ms-\
fonts picom-git oranchelo-icon-theme
sed -i 's/g = no/g = yes/' ~/.config\
/pikaur.conf;cp -a /etc/xdg/openbox/\
 ~/.config;sed -i -e 's/A-space/0x85/
' -e '9,99 s/9/13/' -e '9,120 s/8/12/
' -e 's/W-e/0x85/' -e '100,131 s/4/2/
' -e 's/kfmclient openProfile/rofi/'\
 -e 's/filemanagement/-show drun/' -\
e 's/Clearlooks/Bear2/' -e 's/sans/F\
ira Sans Condensed Book/' ~/$A/rc.xml
sed -i '5,$d' ~/$A/menu.xml;echo -e '
<menu id="root-menu" label="Openbox'\
' 3">'$B'File'$C'nemo'$I''$B'Search'\
$C'rofi -show drun'$I''$B'Web'$C'fi'\
'refox'$I''$B'Terminal'$C'alacritty'\
$I''$B'Text'$C'geany'$I''$B'Calcula'\
'tor'$C'galculator'$I''$E''$B'Refre'\
'sh'$C'openbox --reconfigure'$I''$E'
'$B'Lock Screen'$C'xlock -echokey "*\
" +description -info "Enter Password\
" -mode atlantis -echokeys'$I''$B'R'\
'eboot'$C'reboot'$I''$B'Power-Off'$C'
poweroff'$I'</menu></openbox_menu>'>\
>~/$A/menu.xml;echo -e "lxqt-policyk\
it &\n\npicom --experimental-backend\
s &\n\ntrayer --height 40 --monitor \
primary --tint 0x716966 --transparen\
t true --align right &\n\n(sleep 2&&\
volumeicon) &\n\nplank &\n\n(sleep 2\
&&nm-applet) &\n\n(sleep 2&&sh .sh) &
">~/$A/autostart;echo -e 'echo "[Pla\
nkDockItemPreferences]\nLauncher=fil\
e:///usr/share/applications/nemo.des\
ktop"> ~'$G'nemo.dockitem'$F' rm ~'$\
G'{geeqie.dockitem,vlc-1.dockitem}'$\
F'sed -i '"'13,"'$d'"'"' ~/'$A'/auto\
start'$F'dconf dump'$D'>'$H''$F'sed \
-i "s/bottom/right/"'$H''$F'cat'$H' |
dconf load'$D''$F'pkill volumeicon'$\
F'sed -i -e "13,16 s/fals/tru/" -e "
s/xterm -e '"'alsamixer'"'/pavucontr\
ol/" .config/volumeicon/volumeicon&&
volumeicon&&sleep 19&&rm'$H'$0'>~/.sh
echo -e '\e[1;31mTo Finish Type:\e[0m
reboot'
