#!/usr/bin/bash
set -euo pipefail
A='.config/openbox';Z='<item label="'
C='"><action name="Execute"><command>
';G='/net/launchpad/plank/docks/';E='
<separator></separator>';H='sleep 2&&
';F=' .config/plank/docks1/launcher/'
I='docks.ini ';D='</command></action>
</item>' #~~~~~~~~~~~~~~~~~~~~~~~~~~#
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
' 3">'$Z'File'$C'nemo'$D''$Z'Search'\
$C'rofi -show drun'$D''$Z'Web'$C'fi'\
'refox'$D''$Z'Terminal'$C'alacritty'\
$D''$Z'Text'$C'geany'$D''$Z'Calcula'\
'tor'$C'galculator'$D''$Z''E'Refres'\
'h'$C'openbox --reconfigure'$D''$E''\
$Z'Lock Screen'$C'xlock -mode atlan'\
'tis -echokeys -info "Enter Password :
" +description -echokey "*"'$D''$Z''\
'Reboot'$C'reboot'$D''$Z'Power-Off'$\
C'poweroff'$D'</menu></openbox_menu>
'>>~/$A/menu.xml;echo -e "lxqt-polic\
ykit &\n\npicom --experimental-backe\
nds &\n\nplank &\n\ntrayer --height \
40 --transparent true --align right \
--tint 0x716966 --monitor primary &\n
(sleep 2&&nm-applet) &\n\n(sleep 2&&\
volumeicon) &\n\n(sleep 2&&sh .sh) &\
">~/$A/autostart;echo -e 'echo "[Pl'\
'ankDockItemPreferences]\nLauncher='\
'file:///usr/share/applications/nem'\
'o.desktop">'$F'nemo.dockitem'$H'rm'\
$F'{geeqie.dockitem,vlc-1.dockitem}'\
$H'sed -i '"'13,"'$d'"'"' ~/'$A'/au'\
'tostart'$H'dconf dump'$G'> ~/'$I''$\
H'sed -i "s/bottom/right/" ~/'$I''$H'
cat ~/'$I'|dconf load'$G''$H'pkill '\
'volumeicon'$H'sed -i -e "13,16 s/f'\
'als/tru/" "s/xterm -e '"'alsamixer'\
"'/pavucontrol/" .config/volumeicon'\
'/volumeicon&&volumeicon;sleep 19&&'\
'rm ~/'$I'$0'>~/.sh;echo -e '\e[1;31m
Done :)\nTo Finish Type: \e[0mreboot'
