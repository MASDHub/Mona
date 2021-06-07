#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; B='<item label="' ; C='"><action name="Execute"><command>' ; D='</command></action></item>' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ; git clone https://aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri ; curl -sL https://git.io/JGVg5 > ~/installna.sh
pikaur -S --needed oranchelo-icon-theme obkey ttf-ms-fonts rofi-theme-menu-1080p timeshift 
mkdir -p ~/${A} ; cp -a /etc/xdg/openbox/ ~/.config/ ; sed -i '5,$d' ~/${A}/menu.xml
{ echo '<menu id="root-menu" label="Openbox 3">' ; echo "${B}File Manager${C}nemo${D}" ; echo "${B}Search${C}rofi -show drun${D}" 
echo "${B}Internet${C}firefox-developer-edition${D}" ; echo "${B}Terminal${C}alacritty${D}" ; echo "${B}Text Editor${C}geany${D}" 
echo "${B}Settings${C}obconf${D}" ; echo "${B}Calculator${C}galculator${D}" ; echo "${B}Refresh${C}openbox --reconfigure${D}" 
echo "${B}Reboot${C}reboot${D}" ; echo "${B}Lock Screen${C}${D}" ; echo "${B}Power Off${C}poweroff${D}" ; } >> ~/${A}/menu.xml
#sed -i '250,260d' ~/.config/openbox/rc.xml ; sed -e '248s/$/<keybind key="A-Tab"><action name="Execute">\
#<command>rofi -dpi 96 -show window</command></action></keybind>/' ~/.config/openbox/rc.xml
{ echo -e "picom &\nlxqt-policykit &\n(sleep 2s && trayer --monitor primary --height 40 --align right --iconspacing 10 --transparent true --tint 0x716966) &"
echo -e "(sleep 2s && nm-applet) &\n (sleep 3s && volumeicon) &\n (sleep 6s && plank) &" ; } >> ~/${A}/autostart 
#if [[ "$( pacman -Qd | grep -Ec tpl )" == [1-9] ]] ; then echo "\ncbatticon -x powermenu_1080p &\n" >> ~/.config/openbox/autostart ; fi
echo -e "exec openbox-session" >> ~/.xinitrc ; su --login root -c "sh /home/$USER/installna.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
