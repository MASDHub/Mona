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
P="pikaur -S --needed" ; X='xfce4' ; W='pipewire' ; R='firefox-developer-edition-i18n-' ; O='otf-fira-' 
${P} xorg rsync xfce-polkit openbox ${X}-settings archlinux-xdg-menu xfconf network-manager-applet nm-connection-editor gufw xterm 
${P} alsa-utils ${W} ${W}-alsa ${W}-pulse ${W}-jack gst-plugin-${W} libpulse vlc picom xorg-xprop gvfs xcursor-breeze 
${P} nemo nemo-fileroller nemo-image-converter nemo-preview nemo-python nemo-qt-components obkey ristretto menulibre timeshift 
${P} ${R}en-us ${R}en-gb ${R}en-ca ${R}fr ${R}de ${R}it ${R}ja ${R}zh-cn ${R}zh-tw ${R}ru ${R}he ${R}pt-br ${O}sans ${O}mono ttf-ms-fonts 
${P} ${X}-whiskermenu-plugin ${X}-taskmanager ${X}-screenshooter ${X}-notes-plugin ${X}-appfinder ${X}-datetime-plugin ${X}-mpc-plugin 
if [[ -n "$(grep -E '[8|9|10|11|12|13|14]' /sys/class/dmi/id/chassis_type)" ]] ; then ${P} ${X}-power-manager ${X}-battery-plugin ; fi
echo "openbox-session" >> ~/.xinitrc ; #sudo su
#sudo cp target/release/alacritty /usr/local/bin && cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
#sudo desktop-file-install extra/linux/Alacritty.desktop && sudo update-desktop-database
#G='xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t' ; sudo ${G}string -sa xfsettingsd && ${G}string -sa openbox-session
#sudo sed -i "s/#openbox/openbox/" /etc/update-menus.conf && update-menus ; 
#sudo echo "<menu id="xdg-menu" label="XDG Menu" execute="cat /var/cache/xdg-menu/openbox/menu.xml"/>" >> /home/${USN}/.config/openbox/menu.xml  
printf "${B}DISPLAY MANAGER ENABLED${C}" ; ${P} sddm-stellar-theme ; sudo systemctl enable sddm
printf "${B}NETWORK ENABLED${C}\n" ; sudo systemctl enable NetworkManager 
printf "${B}SYSTEM CLEANUP ${C}\n" ; sudo pacman -Sc && rm ~/.cache/sessions/* && chmod 500 ~/.cache/sessions
printf "\e[1;31mDone!\e[0m" ; #rm -rf ~/.cache/session ; reboot    
#echo -n "reboot? (y/n) " ; read ANS ; if [ "$ANS" != "${ANS#[Yy]}" ] ; then exit ; umount -a ; reboot ; fi    #set -m
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
