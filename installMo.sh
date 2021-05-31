#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #B4AFB6 #716966 #677254 #170D1D #75422C #643D33 #4C312D #DCBC62 #7D5016 #5B3424                      ʕ•̼͛͡•ʕ-̺͛͡•ʔ•̮͛͡•ʔ #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ; git clone https://aur.archlinux.org/pikaur.git ; pushd pikaur ; makepkg -fsri ; PKR="pikaur -S" 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || ʕु-̫͡-ʔु”♬ ʕ•̭͡•ʕ•̯ͦ͡•ʕ•̻̀•́ʔʕ•̫͡•ʔ❣ʕ-̼͡-ʔ◟ʕ´∀`ʔ◞ʕ*̫͡*ʕ•͡•ʔ-̫͡-ʕ•̼͡•٩(̾●̮̮̃̾•̃̾)۶ʕ-̺͡•ʔ•̮͡•ʔʕ•͡ω•ʔʕ•͡-•ʔ=͟͟͞͞ʕ•̫͡•ʔ✧ƪ(•̃͡•̃͡ ƪʕ•͕͡•ʔʕ•̫͡•ʔ♡*    (҂⌣̀_⌣́)(❛ัॢᵕ❛ั ॢ)✩  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
${PKR} rsync alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack gst-plugin-pipewire libpulse vlc xfce4-mpc-plugin
${PKR} network-manager-applet nm-connection-editor xfce4-datetime-plugin xorg sddm-stellar-theme gufw obkey obmenu-generator openbox
${PKR} firefox-developer-edition otf-fira-sans picom ristretto alacritty bash-completion 
${PKR} xfconf xfce4-whiskermenu-plugin xfce4-taskmanager xfce4-settings xfce4-screenshooter xfce4-notes-plugin xfce4-appfinder xfce4-screensaver 
${PKR} nemo nemo-fileroller nemo-image-converter nemo-preview nemo-python nemo-qt-components timeshift
if [[ -n "$(grep -E '8|9|10|11|12|13|14' /sys/class/dmi/id/chassis_type)" ]]; then ${PKR} xfce4-power-manager xfce4-battery-plugin ; fi
DS='DESKTOP' ; Dk='Desktop"' ; DW='DOWNLOAD' ; Dn='Downloads"' ; MU='MUSIC' ; Me='Media"' ; DIR='_DIR="$HOME/' 
echo -e "XDG_${DS}${DIR}${Dk}\nXDG_${DW}${DIR}${Dn}\nXDG_${MU}${DIR}${Me}" > /home/${USN}/.config/user-dirs.dirs
echo "openbox-session" >> /home/${USN}/.xinitrc ; sudo systemctl enable sddm ; printf "\e[1;31mDone!\e[0m"                     
#echo -n "reboot? (y/n) " ; read ANS ; if [ "$ANS" != "${ANS#[Yy]}" ] ; then exit ; umount -a ; reboot ; fi    #set -m
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
