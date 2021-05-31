#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #B4AFB6 #716966 #677254 #170D1D #75422C #643D33 #4C312D #DCBC62 #7D5016 #5B3424                      ʕ•̼͛͡•ʕ-̺͛͡•ʔ•̮͛͡•ʔ #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ; git clone https://aur.archlinux.org/pikaur.git ; pushd pikaur ; makepkg -fsri ; R='\e[1;31m' ; B='\e[0m'
D="~/.config/pikaur.conf" K1='keepbuilddir =' ; K2='keepbuilddeps =' ; N1='noedit =' ; N2='nodiff ='
sed -i "s/${K1} no/${K1} yes/" ${D} ;  sed -i 's/${K2} no/${K2} yes/' ${D} ; sed -i 's/${N1} no/${N1} yes/' ${D} ;  sed -i 's/${N2} no/${N2} yes/' ${D}
DS='DESKTOP' ; Dk='Desktop"' ; DW='DOWNLOAD' ; Dn='Downloads"' ; MU='MUSIC' ; Me='Media"' ; DIR='_DIR="$HOME/' 
echo -e "XDG_${DS}${DIR}${Dk}\nXDG_${DW}${DIR}${Dn}\nXDG_${MU}${DIR}${Me}" > /home/${USN}/.config/user-dirs.dirs
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || ʕु-̫͡-ʔु”♬ ʕ•̭͡•ʕ•̯ͦ͡•ʕ•̻̀•́ʔʕ•̫͡•ʔ❣ʕ-̼͡-ʔ◟ʕ´∀`ʔ◞ʕ*̫͡*ʕ•͡•ʔ-̫͡-ʕ•̼͡•٩(̾●̮̮̃̾•̃̾)۶ʕ-̺͡•ʔ•̮͡•ʔʕ•͡ω•ʔʕ•͡-•ʔ=͟͟͞͞ʕ•̫͡•ʔ✧ƪ(•̃͡•̃͡ ƪʕ•͕͡•ʔʕ•̫͡•ʔ♡*    (҂⌣̀_⌣́)(❛ัॢᵕ❛ั ॢ)✩  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
X='xfce4' ; P="pikaur -S" ; F='firefox-developer-edition-i18n-' ; O='otf-fira-'
${P} xorg rsync openbox ${X}-settings archlinux-xdg-menu xfconf network-manager-applet nm-connection-editor gufw xterm 
&& alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack gst-plugin-pipewire libpulse vlc picom  
&& nemo nemo-fileroller nemo-image-converter nemo-preview nemo-python nemo-qt-components obkey ristretto timeshift 
&& ${F}en-us ${F}en-gb ${F}en-ca  ${F}fr ${F}de ${F}it ${F}ja ${F}zh-cn ${F}zh-tw ${O}sans ${O}mono
&& ${X}-whiskermenu-plugin ${X}-taskmanager ${X}-screenshooter ${X}-notes-plugin ${X}-appfinder ${X}-datetime-plugin ${X}-mpc-plugin
if [[ -n "$(grep -E '8|9|10|11|12|13|14' /sys/class/dmi/id/chassis_type)" ]]; then ${P} ${X}-power-manager ${X}-battery-plugin ; fi
A='alacritty' ; U='/usr/local/' ; C='completion' ; git clone https://github.com/${A}/${A}.git ; cd ${A} 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh ; rustup override set stable ; rustup update stable
pacman -S --needed cmake freetype2 fontconfig pkg-config make libxcb ; cargo build --release
cp target/release/${A} ${U}bin ; cp extra/logo/${A}-term.svg /usr/share/pixmaps/${A}.svg
desktop-file-install extra/linux/Alacritty.desktop ; update-desktop-database ; mkdir -p ${U}share/man/man1
gzip -c extra/${A}.man | tee ${U}share/man/man1/${A}.1.gz ; mkdir -p ~/.bash_${C}
cp extra/${C}s/${A}.bash ~/.bash_${C}/${A} ; echo "source ~/.bash_${C}/${A}" >> ~/.bashrc
${P} sddm-stellar-theme ; printf "${R}DISPLAY MANAGER ENABLED${B}" ; systemctl enable sddm
echo "openbox-session" >> /home/${USN}/.xinitrc ;  #sed -i "s/#openbox/openbox/" /etc/update-menus.conf ; update-menus ; 
#echo "<menu id="xdg-menu" label="XDG Menu" execute="cat /var/cache/xdg-menu/openbox/menu.xml"/>" >> /home/${USN}/.config/openbox/menu.xml  
printf "\e[1;31mDone!\e[0m" ; EXIT         
#echo -n "reboot? (y/n) " ; read ANS ; if [ "$ANS" != "${ANS#[Yy]}" ] ; then exit ; umount -a ; reboot ; fi    #set -m
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
