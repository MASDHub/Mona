#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #B4AFB6 #716966 #677254 #170D1D #75422C #643D33 #4C312D #DCBC62 #7D5016 #5B3424                      ʕ•̼͛͡•ʕ-̺͛͡•ʔ•̮͛͡•ʔ #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ; git clone https://aur.archlinux.org/pikaur.git ; pushd pikaur ; makepkg -fsri F='firefox-developer-edition' ; O='otf-fira-' 
P="pikaur -S" ; D="~/.config/pikaur.conf" K1='keepbuilddir =' ; K2='keepbuilddeps =' ; N1='noedit =' ; N2='nodiff ='
sed -i "s/${K1} no/${K1} yes/" ${D} ;  sed -i 's/${K2} no/${K2} yes/' ${D} ; sed -i 's/${N1} no/${N1} yes/' ${D} ;  sed -i 's/${N2} no/${N2} yes/' ${D}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || ʕु-̫͡-ʔु”♬ ʕ•̭͡•ʕ•̯ͦ͡•ʕ•̻̀•́ʔʕ•̫͡•ʔ❣ʕ-̼͡-ʔ◟ʕ´∀`ʔ◞ʕ*̫͡*ʕ•͡•ʔ-̫͡-ʕ•̼͡•٩(̾●̮̮̃̾•̃̾)۶ʕ-̺͡•ʔ•̮͡•ʔʕ•͡ω•ʔʕ•͡-•ʔ=͟͟͞͞ʕ•̫͡•ʔ✧ƪ(•̃͡•̃͡ ƪʕ•͕͡•ʔʕ•̫͡•ʔ♡*    (҂⌣̀_⌣́)(❛ัॢᵕ❛ั ॢ)✩  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
${P} xorg rsync alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack gst-plugin-pipewire libpulse vlc xfce4-mpc-plugin
&& openbox network-manager-applet nm-connection-editor gufw xfce4-datetime-plugin xterm picom
&& ${L}-i18n-en-us ${L}-i18n-en-gb ${L}-i18n-en-ca  ${L}-i18n-fr ${L}-i18n-de ${L}-i18n-it ${L}-i18n-ja ${L}-i18n-zh-cn ${L}-zh-tw ${O}sans ${O}mono
&& xfconf xfce4-whiskermenu-plugin xfce4-taskmanager xfce4-settings xfce4-screenshooter xfce4-notes-plugin xfce4-appfinder xfce4-screensaver 
&& nemo nemo-fileroller nemo-image-converter nemo-preview nemo-python nemo-qt-components ristretto
&& sddm-stellar-theme obkey timeshift

git clone https://github.com/alacritty/alacritty.git ; cd alacritty 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh ; rustup override set stable ; rustup update stable
pacman -S --needed cmake freetype2 fontconfig pkg-config make libxcb ; cargo build --release
cp target/release/alacritty /usr/local/bin ; cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
desktop-file-install extra/linux/Alacritty.desktop ; update-desktop-database ; mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | tee /usr/local/share/man/man1/alacritty.1.gz ; mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty ; echo "source ~/.bash_completion/alacritty" >> ~/.bashrc

if [[ -n "$(grep -E '8|9|10|11|12|13|14' /sys/class/dmi/id/chassis_type)" ]]; then ${P} xfce4-power-manager xfce4-battery-plugin ; fi
DS='DESKTOP' ; Dk='Desktop"' ; DW='DOWNLOAD' ; Dn='Downloads"' ; MU='MUSIC' ; Me='Media"' ; DIR='_DIR="$HOME/' 
echo -e "XDG_${DS}${DIR}${Dk}\nXDG_${DW}${DIR}${Dn}\nXDG_${MU}${DIR}${Me}" > /home/${USN}/.config/user-dirs.dirs
echo "openbox-session" >> /home/${USN}/.xinitrc ; sudo systemctl enable sddm ; printf "\e[1;31mDone!\e[0m"                     
#echo -n "reboot? (y/n) " ; read ANS ; if [ "$ANS" != "${ANS#[Yy]}" ] ; then exit ; umount -a ; reboot ; fi    #set -m
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
