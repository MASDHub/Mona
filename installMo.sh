#!/usr/bin/bash
set -euo pipefail
A='.config/openbox';I=' docks.ini';H='
sleep 2&&'G='net/launchpad/plank/docks
';C='"><actionname="Execute"><command>
';F='config/plank/docks1/launcher';E='
<separator></separator>';D='</command>
</action></item><item label="' #~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
mkdir .config;cp -a /etc/xdg/openbox\
/ .config/; sed -i '5,$d' $A/menu.xml
git clone https://aur.archlinux.org/\
pikaur.git;cd pikaur/ ; makepkg -fsri
pikaur -S oranchelo-icon-theme-git t\
imeshift picom-git ttf-ms-fonts;sed \
-i 's/g = no/g = yes/' .config/pikau\
r.conf;sed -i -e 's/Clearlooks/Bear2/
' -e 's/W-e/0x85/' -e '10,100 s/9/13/
' -e 's/A-space/0x85/' '5,120 s/8/12/
' -e '/kfmclient openProfile /rofi -/
' -e 's/filemanagement/show drun/' -\
e 's/sans/Fira Sans Condensed Book/
' -e '131 s/4/2/' $A/rc.xml;echo -e "
<menu id="'"root-menu"'" label="'"Op\
enbox 3"'"><item label='"Files${C}ne
mo${D}Search${C}rofi -show drun${D}W\
eb${C}Firefox${D}Terminal${C}alacrit\
ty${D}Text${C}geany${D}Calculator${C}
galculator${D}${E}Refresh${C}openbox\
 --reconfigure${D}${E}Lock Screen${C}
xlock -mode atlantis -echokeys -echo\
key '*' -info +description "'"Passwo\
rd: "'"${D}Re-boot${C}reboot${D}Powe\
r-Off${C}poweroff</command></action>\
</item></menu></openbox_menu>">>${A}\
/menu.xml;echo -e "lxqt-policykit &\n
picom --experimental-backends &\n\np\
lank &\n\nxpad &\n\ntrayer --height \
40 --align right --monitor primary -\
-transparent true --tint 0x716966 &\n
(sleep 2 && nm-applet) &\n\n(sleep 2\
&& volumeicon) &\n\n(sleep 2 && sh m\
.sh) &">$A/autostart;echo -e 'dconf \
dump '"$G"' > '"$I"' '"$H"'sed -i '"'
s/bottom/right/'"''"$I"' '"$H"'cat '"
$I"'|dconf load '"$G"''"$H"'echo -e "
'"[PlankDockItemPreferences]\nLaunch\
er=file:///usr/share/applications/ne\
mo.desktop"'">'"$F"'nemo.dockitem'"$H
"'rm '"$F"'{geeqie.dockitem,vlc-1.do\
ckitem}'"$H"'sed -i '"'15,"'$d'"'"' '
"$A"'/autostart'"$H"'pkill volumeicon
'"$H"'sed -i -e '"'13,16 s/fals/tru/'
"' .config/volumeicon/volumeicon'"$H"
'volumeicon'"$H"'sleep 19&&rm'"$I"'&&
rm $0'>m.sh;su root -c "chmod 755 $(\
cat /etc/U)m.sh";rm {/etc/U,$0};echo\
 -e '\e[1;31mDone\nType: reboot\e[0m'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
