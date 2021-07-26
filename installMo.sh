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
fonts picom-git ungoogled-chromium o\
ranchelo-icon-theme;cp -a /etc/xdg/o\
penbox/ ~/.config;sed -i 's/g = no/g\
 = yes/' ~/.config/pikaur.conf;sed -\
i -e '9,99 s/9/13/' -e '9,120 s/8/12/
' -e 's/W-e/0x85/' -e '100,131 s/4/2/
' -e 's/filemanagement/-show drun/' -\
' -e 's/sans/Fira Sans Condensed Book/
-e 's/A-space/0x85/'
' -e 's/kfmclient openProfile/rofi/'\
e 's/Clearlooks/Bear2/' ~/$A/rc.xml
sed -i -e '6,$d' -e 's/apps-accessories/root/' -e 's/Accessories/Openbox 3/' ~/$A/menu.xml
;echo -e "
<menu id='"'root-menu'"' label='"'Op\
enbox 3'"'>"$B"File"$C"nemo$I"$B"Sea\
rch"$C"rofi -show drun$I"$B"Web"$C"f\
irefox$I"$B"Terminal"$C"alacritty$I"
$B"Text"$C"geany$I"$B"Calculator"$C"
galculator$I"$E""$B"Refresh"$C"openb\
ox --reconfigure$I"$E""$B"Lock Screen
"$C"xlock -echokey '*' +description \
-info 'Enter Password' -mode atlanti\
s -echokeys$I"$B"Reboot"$C"reboot"$I"
"$B"Power-Off"$C"poweroff"$I"</menu>\
</openbox_menu>">~/$A/menu.xml;echo \
-e "lxqt-policykit &\n\npicom --expe\
rimental-backends &\n\ntrayer --tint\
 0x716966 --height 40 --monitor prim\
ary --transparent true --align right\
 &\n\n(sleep 2&&volumeicon) &\n\npla\
nk &\n\n(sleep 2&&nm-applet) &\n\n(s\
leep 2&&sh .sh) &">~/$A/autostart;ec\
ho -e 'echo "[PlankDockItemPreferen'\
'ces]\nLauncher=file:///usr/share/a'\
'pplications/nemo.desktop"> ~'$G'ne'\
'mo.dockitem'$F' rm ~'$G'{geeqie.do'\
'ckitem,vlc-1.dockitem}'$F'sed -i '"\
'13,"'$d'"'"' ~/'$A'/autostart'$F'd'\
'conf dump'$D'>'$H''$F'sed -i "s/bo'\
'ttom/right/"'$H''$F'cat'$H' |dconf'\
'load'$D''$F'pkill volumeicon'$F'se'\
d -i -e "13,16 s/fals/tru/" -e "s/x'\
term -e '"'alsamixer'"'/pavucontrol/
" .config/volumeicon/volumeicon&&vol\
umeicon&&sleep 19&&rm'$H'$0'>~/.sh:e\
cho -e '\e[1;31mTo Finish Type:\e[0m
reboot'
