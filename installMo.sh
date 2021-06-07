#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; B='<item label="' ; C='"><action name="Execute"><command>' ; D='</command></action></item>' ; E="~/.config/plank"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ; git clone https://aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri ; curl -sL https://git.io/JGVg5 > ~/installna.sh
pikaur -S --needed picom-git rofi-dmenu oranchelo-icon-theme obkey ttf-ms-fonts timeshift 
mkdir -p ~/${A} ; cp -a /etc/xdg/openbox/ ~/.config/ ; sed -i '5,$d' ~/${A}/menu.xml 
{ echo '<menu id="root-menu" label="Openbox 3">' ; echo -e "${B}File Manager${C}nemo${D}\n${B}Search${C}rofi -show drun${D}" 
echo -e "${B}Internet${C}firefox-developer-edition${D}\n${B}Terminal${C}alacritty${D}\n${B}Text Editor${C}geany${D}" 
echo "${B}Settings${C}obconf${D}\n${B}Calculator${C}galculator${D}\n${B}Refresh${C}openbox --reconfigure${D}" ; echo '<separator></separator>' 
echo -e "${B}Lock Screen${C}xlock -mode atlantis +description -echokeys -echokey "'*'" -info "'"Enter password to unlock"'"${D}"
echo -e "${B}Reboot${C}reboot${D}\n${B}Power Off${C}poweroff${D}" ; } >> ~/${A}/menu.xml
#sed -i '250,260d' ~/.config/openbox/rc.xml ; sed -e '248s/$/<keybind key="A-Tab"><action name="Execute">\
#<command>rofi -dpi 96 -show window</command></action></keybind>/' ~/.config/openbox/rc.xml
{ echo -e "lxqt-policykit &\n picom &\n(sleep 2s && trayer --monitor primary --height 40 --align right --iconspacing 10 --transparent true --tint 0x716966) &"
echo -e "(sleep 2s && nm-applet) &\n(sleep 3s && volumeicon) &\n(sleep 6s && plank) &" ; } > ~/${A}/autostart 
mkdir ${E} ; dconf dump /net/launchpad/plank/docks/ > ${E}/docks.ini ; sed -i "s/position='bottom'/position='right'/" ${E}/docks.ini
echo -e "exec openbox-session" >> ~/.xinitrc ; su --login root -c "sh /home/$USER/installna.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
