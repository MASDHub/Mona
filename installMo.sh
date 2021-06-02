#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='alacritty' ; B='\e[1;31m' ;  C='\e[0m' ; D='.bash' ; E='completion' F='https://' G='git clone' ; H='pikaur'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ;  ${G} ${F}github.com/${A}/${A}.git ; cd ${A} ; curl --proto '=https' --tlsv1.2 -sSf ${F}sh.rustup.rs | sh 
source "$HOME"/.cargo/env ; rustup override set stable ; cargo build --release ; mkdir -p ~/${D}_${E} 
cp extra/${E}s/${A}${D} ~/${D}_${E}/${A} ; echo "source ~/${D}_${E}/${A}" >> ~/${D}rc
cd ~ ; ${G} ${F}aur.archlinux.org/${H}.git ; cd ${H} ; makepkg -fsri
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
I="pikaur -S --needed" ; J='xfce4' ; K='pipewire' ; L='firefox-developer-edition-i18n-' ; M='otf-fira-' ; N='manager' ; O='plugin' # ʕु-̫͡-ʔु
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
${I} xorg rsync xfce-polkit openbox ${J}-settings archlinux-xdg-menu xfconf nm-connection-editor gufw xterm 
${I} alsa-utils ${K} ${K}-alsa ${K}-pulse ${K}-jack gst-${O}-${K} libpulse vlc picom xorg-xprop gvfs xcursor-breeze geany geany-${O}s
${I} nemo nemo-fileroller nemo-image-converter nemo-preview nemo-python nemo-qt-components obkey ristretto menulibre timeshift 
${I} ${L}en-us ${L}en-gb ${L}en-ca ${L}fr ${L}de ${L}it ${L}ja ${L}zh-cn ${L}zh-tw ${L}ru ${L}he ${L}pt-br ${M}sans ${M}mono ttf-ms-fonts 
${I} ${J}-whiskermenu-${O} ${J}-task${N} ${J}-screenshooter ${J}-notes-${O} ${J}-appfinder ${J}-datetime-${O} ${J}-mpc-${O} 
${I} galculator ; if [[ -n "$(grep -E '[8|9|10|11|12|13|14]' /sys/class/dmi/id/chassis_type)" ]] ; then ${H} ${J}-power-${N} ${J}-battery-${H} ; fi
I2='reversesearchsorting =' I3='noedit =' ; sudo -i "s/${I2} no/${I2} yes/" ~/${I}/${H}.conf ; sudo -i "s/${I3} no/${I3} yes/" ~/${I}/${H}.conf
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
 Q='openbox' R='.config' ; S='<item label="' ; T='"><action name="Execute"><command>' U='</command></action></item>' ; V='menu.xml' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
sudo cp ~/${A}/target/release/${A} /usr/local/bin ; sudo mkdir -p ~/${R}/${Q} ; sudo cp -a /etc/xdg/${Q}/ ~/${R}/
sudo sed -i '5,$d' ~/${R}/${Q}/menu.xml ; echo -e '<menu id="root-menu" label="Openbox 3">' | sudo tee -a ~/${R}/${Q}/${V}
echo -e "${S}Internet${T}firefox-developer-edition${T}\n${S}File Manager${T}nemo${U}\n${S}Terminal${T}${A}${T}\n" | sudo tee -a ~/${R}/${Q}/${V}
echo -e "${S}Text Editor${T}geany${T}\n${S}Settings${T}xfce4-settings-${N}${T}\n${S}Turn Off${T}sudo shutdown now${T}\n" | sudo tee -a ~/${R}/${Q}/${V}
echo -e "${S}Calculator${T}galculator${T}\n</menu>\n</openbox_menu>\n" | sudo tee -a ~/${R}/${Q}/${V}
echo -e "xfce-mcs-${N} &\n\nxfce4-panel &\n" | sudo tee ~/${R}/${Q}/autostart ; echo "exec ${Q}-session" | sudo tee ~/.xinitrc 
printf "${B}DISPLAY MANAGER ENABLED${C}" ; ${P} sddm-stellar-theme ; sudo systemctl enable sddm
printf "${B}NETWORK ENABLED${C}\n" ; sudo systemctl enable NetworkManager ; printf "${B}SYSTEM CLEANUP${C}\n" ; sudo pacman -Sc
 printf "${B}Done!${C}\n" ; read -r "reboot? (y/n) "-p W ; if [ "$W" != "${W#[Yy]}" ] ; then exit ; umount -a ; reboot ; fi    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
