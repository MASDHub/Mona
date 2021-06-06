#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ; git clone https://aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri ; curl -sL https://git.io/JGVg5 > ~/installna.sh
pikaur -S --needed oranchelo-icon-theme obkey ttf-ms-fonts rofi-theme-menu-1080p timeshift 
mkdir -p ~/.config/openbox ; cp -a /etc/xdg/openbox/ ~/.config/ ; sed -i '5,$d' ~/.config/openbox/menu.xml
{ echo '<menu id="root-menu" label="Openbox 3">' 
echo '<item label="File Manager"><action name="Execute"><command>nemo</command></action></item>'
echo '<item label="Search"><action name="Execute"><command>rofi -show drun</command></action></item>'
echo '<item label="Internet"><action name="Execute"><command>firefox-developer-edition</command></action></item>'
echo '<item label="Terminal"><action name="Execute"><command>alacritty</command></action></item>'
echo '<item label="Text Editor"><action name="Execute"><command>geany</command></action></item>'
echo '<item label="Settings"><action name="Execute"><command>xfce4-settings-manager</command></action></item>'
echo '<item label="Calculator"><action name="Execute"><command>galculator</command></action></item>'
echo '<item label="Refresh"><action name="Execute"><command>openbox --reconfigure</command></action></item>'
echo '<item label="Reboot"><action name="Execute"><command>reboot</command></action></item>'
echo '<item label="Power Off"><action name="Execute"><command>poweroff</command></action></item></menu></openbox_menu>' ; } >> ~/.config/openbox/menu.xml
#sed -i '250,260d' ~/.config/openbox/rc.xml ; sed -e '248s/$/<keybind key="A-Tab"><action name="Execute">\
#<command>rofi -dpi 96 -show window</command></action></keybind>/' ~/.config/openbox/rc.xml
{ echo -e "picom &\nlxqt-policykit &\n(sleep 2s && trayer --monitor primary --height 40 --align right --iconspacing 10 --transparent true --tint 0x716966) &\n"
echo -e "\n (sleep 2s && nm-applet) &\n (sleep 3s && volumeicon) &\n (sleep 6s && plank) &" ; } >> ~/.config/openbox/autostart 
echo -e "exec ${E}-session" >> ~/.xinitrc ;  rofi -upgrade-config ; su --login root -c "sh /home/$USER/installna.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
