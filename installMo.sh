#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; B='<item label="' ; C='"><action name="Execute"><command>' ; D='</command></action></item>' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ; git clone https://aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri ; curl -sL https://git.io/JGVg5 > ~/installna.sh
pikaur -S --needed oranchelo-icon-theme obkey ttf-ms-fonts rofi-theme-menu-1080p timeshift 
mkdir -p ~/${A} ; cp -a /etc/xdg/openbox/ ~/.config/ ; sed -i '5,$d' ~/${A}/menu.xml
{ echo '<menu id="root-menu" label="Openbox 3">' ; echo "${J}File Manager${K}nemo${L}" ; echo "${J}Search${K}rofi -show drun${L}" 
echo "${J}Internet${K}firefox-developer-edition${L}" ; echo "${J}Terminal${K}alacritty${L}" ; echo "${J}Text Editor${K}geany${L}" 
echo "${J}Settings${K}obconf${L}" ; echo "${J}Calculator${K}galculator${L}" ; echo "${J}Refresh${K}openbox --reconfigure${L}" 
echo "${J}Reboot${K}reboot${L}" ; echo "${J}Lock Screen${K}${L}" ; echo "${J}Power Off${K}poweroff now${L}" ; } >> ~/${A}/menu.xml
#sed -i '250,260d' ~/.config/openbox/rc.xml ; sed -e '248s/$/<keybind key="A-Tab"><action name="Execute">\
#<command>rofi -dpi 96 -show window</command></action></keybind>/' ~/.config/openbox/rc.xml
{ echo -e "picom &\nlxqt-policykit &\n(sleep 2s && trayer --monitor primary --height 40 --align right --iconspacing 10 --transparent true --tint 0x716966) &\n"
echo -e "\n (sleep 2s && nm-applet) &\n (sleep 3s && volumeicon) &\n (sleep 6s && plank) &" ; } >> ~/${A}/autostart 
#if [[ "$( pacman -Qd | grep -Ec tpl )" == [1-9] ]] ; then echo "\ncbatticon -x powermenu_1080p &\n" >> ~/.config/openbox/autostart ; fi
echo -e "exec ${E}-session" >> ~/.xinitrc ;  rofi -upgrade-config ; su --login root -c "sh /home/$USER/installna.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
