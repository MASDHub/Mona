#!/usr/bin/bash
set -euo pipefail ;  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; B='<item label="'
C='"><action name="Execute"><command>'
D='</command></action></item>' 
E='<separator></separator>' 
F='~/.config/plank/dock1/launchers/'
G='/net/launchpad/plank/docks/'
H='sleep 2 &&' ; I='~/docks.ini'
Z='.config/pikaur.conf' #~~~~~~~~~~~~~~#
mkdir ~/.config ; git clone \
https://aur.archlinux.org/pikaur.git
cp -a /etc/xdg/openbox/ ~/.config/ 
cd pikaur; makepkg -sri; pikaur -S \
picom-git oranchelo-icon-theme-git \
jbxkb ttf-ms-fonts timeshift; sed -\
i 's/g = no/g = yes/' ~/${Z}; sed -\
i 's/g = no/g = yes/' ~/${Z}; sed -\
i '5,$d' ~/${A}/menu.xml ; sed -i -\
e '5,120 s/8/12/' -e '131 s/4/2/' -\
e 's/kfmclient openProfile/rofi/' -\
e 's/filemanagement/-show drun/g' -\
e 's/sans/Fira Sans Condensed Book/' -\
e 's/W-e/0x85/' -e 's/A-space/0x85/' -\
e 's/Konqueror/m/' -e '5,99 s/9/13/' -\
e 's/Clearlooks/Bear2/' ~/${A}/rc.xml
echo -e "<menu id="'"root-menu"'" \
label="'"Openbox 3"'"> \n${B}Files\
${C}nemo${D}\n${B}Search${C}rofi -\
show drun ${D}\n${B}Web${C}firefox\
${D}\n${B}Terminal${C}alacritty${D}
${B}Text${C}geany${D}\n${B}Calcula\
tor${C}galculator${D}${E}\n${B}Ref\
resh${C}openbox --reconfigure ${D}\
${E}${B}Lock Screen${C}xlock -mode\
atlantis -echokeys -echokey '*' -i\
nfo +description "'"Password : "'"\
${D}\n${B}Reboot${C}reboot${D}${B}\
Power Off${C}poweroff${D}\n</menu>\
</openbox_menu>" >> ~/${A}/menu.xml
echo -e "lxqt-policykit &\n\npicom \
--experimental-backends &\n\nplank &
\ntrayer --monitor primary --align \
right --tint 0x716966 --height 40 -\
-transparent true &\n\nnm-applet &\n
volumeicon &\n\n(sleep 5 && sh ~/m.\
sh) &" > ~/${A}/autostart
echo -e 'dconf dump '"$G"' > '"$I"'
'"$H"' sed -i '"'s/bottom/right/'"' \
'"$I"'\n'"$H"' cat '"$I"' | dconf \
load '"$G"'\n'"$H"' echo -e "'"[Plank\
DockItemPreferences]\nLauncher=file:/\
//usr/share/applications/nemo.deskto\
p"'" >> '"$F"'nemo.dockitem\n'"$H"' \
rm '"$F"'geeqie.dockitem\n'"$H"' rm \
'"$F"'vlc-1.dockitem\n'"$H"' rm '"$F"'\
vlc.dockitem\n'"$H"' \
sed -i '"'13,"'$d'"'"' ~/'"$A"'/\
autostart\n'"$H"' pkill volumeicon
'"$H"' sed -i -e '"'s/5/1/'"' -e \
'"'s/l=false/l=true/'"' -e \
'"'s/b_slider=false/b_slider=true/'"' \
~/.config/volumeicon/volumeicon\n
'"$H"' volumeicon; sleep 10 && \
rm '"$I"' && rm -- $0' > ~/m.sh
su root -c "chmod 755 /home/$(cat /etc/U)\
/m.sh && rm /etc/U && rm -- $0"; echo -e \
'\e[1;31mDone!\nTo Finish Type: reboot\e[0m'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
