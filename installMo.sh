#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='alacritty' ; B='\e[1;31m' ;  C='\e[0m' ; D='.bash' ; E='completion' F='https://' G='git clone' # ʕ•̼͛͡•ʕ-̺͛͡•ʔ•̮͛͡•ʔ 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ;  ${G} ${F}github.com/${A}/${A}.git ; cd ${A} ; curl --proto '=https' --tlsv1.2 -sSf ${F}sh.rustup.rs | sh 
source "$HOME"/.cargo/env ; rustup override set stable ; cargo build --release ; mkdir -p ~/${D}_${E} 
cp extra/${E}s/${A}${D} ~/${D}_${E}/${A} ; echo "source ~/${D}_${E}/${A}" >> ~/${D}rc
cd ~ ; ${G} ${F}aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
P="pikaur -S --needed" ; X='xfce4' ; W='pipewire' ; R='firefox-developer-edition-i18n-' ; O='otf-fira-' H='openbox' I='.config' # ʕु-̫͡-ʔु”♬ ʕ•̭͡•ʕ•̯ͦ͡•ʕ•̻̀•́ʔ❣ 
J='<item label="' ; K='"><action name="Execute"><command>' L='</command></action></item>' M="sudo tee -a ~/${I}/${H}/menu.xml"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
${P} xorg rsync xfce-polkit openbox ${X}-settings archlinux-xdg-menu xfconf network-manager-applet nm-connection-editor gufw xterm 
${P} alsa-utils ${W} ${W}-alsa ${W}-pulse ${W}-jack gst-plugin-${W} libpulse vlc picom xorg-xprop gvfs xcursor-breeze geany geany-plugins
${P} nemo nemo-fileroller nemo-image-converter nemo-preview nemo-python nemo-qt-components obkey ristretto menulibre timeshift 
${P} ${R}en-us ${R}en-gb ${R}en-ca ${R}fr ${R}de ${R}it ${R}ja ${R}zh-cn ${R}zh-tw ${R}ru ${R}he ${R}pt-br ${O}sans ${O}mono ttf-ms-fonts 
${P} ${X}-whiskermenu-plugin ${X}-taskmanager ${X}-screenshooter ${X}-notes-plugin ${X}-appfinder ${X}-datetime-plugin ${X}-mpc-plugin 
${P} galculator
if [[ -n "$(grep -E '[8|9|10|11|12|13|14]' /sys/class/dmi/id/chassis_type)" ]] ; then ${P} ${X}-power-manager ${X}-battery-plugin ; fi
P1='reversesearchsorting =' P2='noedit =' ; P3="~/.config/pikaur.conf" ; sudo -i "s/${P1} no/${P1} yes/" ${P3} ; sudo -i "s/${P2} no/${P2} yes/" ${P3}
sudo cp ~/${A}/target/release/${A} /usr/local/bin ; sudo mkdir -p ~/${I}/${H} ; sudo cp -a /etc/xdg/${H}/ ~/${I}/
sed -i '5,$d' ~/${I}/${H}/menu.xml ; echo "<menu id="root-menu" label="Openbox 3">" | ${M} 
echo -e "${J}Internet${K}firefox-developer-edition${L}\n${J}File Manager${K}nemo${L}\n${J}Terminal${K}${A}${L}\n${J}Calculator${K}galculator${L}" | ${M} 
echo -e "${J}Text Editor${K}geany${L}\n${J}Settings${K}xfce4-settings-manager${L}\n${J}Turn Off${K}sudo shutdown${L}</menu>\n</openbox_menu>" | ${M} 
echo -e "xfce-mcs-manager &\n\nxfce4-panel &\n" | sudo tee ~/${I}/${H}/autostart ; echo "exec ${H}-session" | sudo tee ~/.xinitrc 
printf "${B}DISPLAY MANAGER ENABLED${C}" ; ${P} sddm-stellar-theme ; sudo systemctl enable sddm
printf "${B}NETWORK ENABLED${C}\n" ; sudo systemctl enable NetworkManager 
printf "${B}SYSTEM CLEANUP${C}\n" ; sudo pacman -Sc ; printf "${B}Done!${C}\n"  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
