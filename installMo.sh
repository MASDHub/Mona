#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; B='<item label="' ; C='"><action name="Execute"><command>' ; D='</command></action></item>' ; E='.config/plank'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ; git clone https://aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri ; curl -sL https://git.io/JGVg5 > ~/installna.sh
pikaur -S --needed picom-git rofi-dmenu oranchelo-icon-theme obkey ttf-ms-fonts timeshift 
mkdir -p ~/${A} ; cp -a /etc/xdg/openbox/ ~/.config/ ; sed -i '5,$d' ~/${A}/menu.xml 
{ echo -e "<menu id="'"root-menu"'" label="'"Openbox 3"'">\n${B}File Manager${C}nemo${D}\n${B}Search${C}rofi -show drun${D}
${B}Web${C}firefox-developer-edition${D}\n${B}Terminal${C}alacritty${D}\n${B}Text Editor${C}geany${D}
${B}Calculator${C}galculator${D}\n${B}Refresh${C}openbox --reconfigure${D}\n<separator></separator> 
${B}Lock Screen${C}xlock -mode atlantis +description -echokeys -echokey '*' -info "'"Enter password to unlock"'"${D}
${B}Reboot${C}reboot${D}\n${B}Power Off${C}poweroff${D}</menu></openbox_menu>" ; } >> ~/${A}/menu.xml
#sed -i '250,260d' ~/.config/openbox/rc.xml ; sed -e '248s/$/<keybind key="A-Tab"><action name="Execute">\
#<command>rofi -dpi 96 -show window</command></action></keybind>/' ~/.config/openbox/rc.xml
echo -e "exec openbox-session" >> ~/.xinitrc ; { echo -e 'lxqt-policykit &\n\npicom &\n 
(sleep 2s && trayer --monitor primary --height 40 --align right --iconspacing 10 --transparent true --tint 0x716966) & 
\n(sleep 2s && plank) &\n\n(sleep 2s && nm-applet) &\n\n(sleep 2s && volumeicon) &' ; } > ~/${A}/autostart 
mkdir ~/${E} ; dconf dump /net/launchpad/plank/docks/ > ~/${E}/docks.ini ; sed -i "s/position='bottom'/position='right'/" ~/${E}/docks.ini
su --login root -c "sh /home/$USER/installna.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
