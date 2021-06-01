#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='alacritty' ; B='\e[1;31m' ;  C='\e[0m' ; D='.bash' ; E='completion' F='https://' G='git clone' # ʕ•̼͛͡•ʕ-̺͛͡•ʔ•̮͛͡•ʔ 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ;  ${G} ${F}github.com/${A}/${A}.git ; cd ${A} ; curl --proto '=https' --tlsv1.2 -sSf ${F}sh.rustup.rs | sh 
source $HOME/.cargo/env ; rustup override set stable ; cargo build --release ; mkdir -p ~/${D}_${E} 
cp extra/${E}s/${A}${D} ~/${D}_${E}/${A} ; echo "source ~/${D}_${E}/${A}" >> ~/${D}rc
cd ~ ; ${G} ${F}aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || ʕु-̫͡-ʔु”♬ ʕ•̭͡•ʕ•̯ͦ͡•ʕ•̻̀•́ʔ🤘❣ʕ-̼͡-ʔ◟ʕ´∀`ʔ◞ʕ*̫͡*ʕ•͡•ʔ-̫͡-ʕ•̼͡•٩(̾●̮̮̃̾•̃̾)۶ʕ-̺͡•ʔ•̮͡•ʔʕ•͡ω•ʔʕ•͡-•ʔ=͟͟͞͞ʕ•̫͡•ʔ✧ƪ(•̃͡•̃͡ ƪʕ•͕͡•ʔʕ•̫͡•ʔ♡*🔆🔅 (҂⌣̀_⌣́)(❛ัॢᵕ❛ั ॢ)✨  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
P="pikaur -S" ; X='xfce4' ; W='pipewire' ; F='firefox-developer-edition-i18n-' ; O='otf-fira-' 
${P} xorg rsync xfce-polkit openbox ${X}-settings archlinux-xdg-menu xfconf network-manager-applet nm-connection-editor gufw xterm \
&& alsa-utils ${W} ${W}-alsa ${W}-pulse ${W}-jack gst-plugin-${W} libpulse vlc picom xorg-xprop gvfs xcursor-breeze \
&& nemo nemo-fileroller nemo-image-converter nemo-preview nemo-python nemo-qt-components obkey ristretto menulibre timeshift \
&& ${F}en-us ${F}en-gb ${F}en-ca  ${F}fr ${F}de ${F}it ${F}ja ${F}zh-cn ${F}zh-tw ${F}$ru {F}he ${F}pt-br ${O}sans ${O}mono ttf-ms-fonts \
&& ${X}-whiskermenu-plugin ${X}-taskmanager ${X}-screenshooter ${X}-notes-plugin ${X}-appfinder ${X}-datetime-plugin ${X}-mpc-plugin 
if [[ -n "$(grep -E '[8|9|10|11|12|13|14]' /sys/class/dmi/id/chassis_type)" ]]; then ${P} ${X}-power-manager ${X}-battery-plugin ; fi
${P} sddm-stellar-theme ; printf "${B}DISPLAY MANAGER ENABLED${C}" ; systemctl enable sddm
echo "openbox-session" >> /home/${USN}/.xinitrc 

#sed -i "s/${F1}dir no/${F1}dir yes/" ${F} ;  sed -i "s/${F1}deps no/${F1}deps yes/" ${F} ; sed -i "s/${F3} no/${F3} yes/" ${F} ;  sed -i "s/${F4} no/${F4} yes/" ${F}
#sed -i "s/#openbox/openbox/" /etc/update-menus.conf ; update-menus ; 
#echo "<menu id="xdg-menu" label="XDG Menu" execute="cat /var/cache/xdg-menu/openbox/menu.xml"/>" >> /home/${USN}/.config/openbox/menu.xml  
#xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -sa xfsettingsd
#xfconf-query -c xfce4-session -p /sessions/Failsafe/Client1_Command -t string -sa openbox-session
#rm ~/.cache/sessions/* && chmod 500 ~/.cache/sessions
#gconftool-2 --type boolean --set /desktop/gnome/interface/buttons_have_icons true
#gconftool-2 --type boolean --set /desktop/gnome/interface/menus_have_icons true
cp target/release/${A} ${D}bin ; cp extra/logo/${A}-term.svg /usr/share/pixmaps/${A}.svg
desktop-file-install extra/linux/Alacritty.desktop ; update-desktop-database ; mkdir -p ${D}share/man/man1
gzip -c extra/${A}.man | tee ${D}share/man/man1/${A}.1.gz ; 

printf "${B}SYSTEM CLEANUP ${C}\n" ; pacman -Sc ; printf "\e[1;31mDone!\e[0m" ; #rm -rf ~/.cache/session ; reboot    
#echo -n "reboot? (y/n) " ; read ANS ; if [ "$ANS" != "${ANS#[Yy]}" ] ; then exit ; umount -a ; reboot ; fi    #set -m
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
