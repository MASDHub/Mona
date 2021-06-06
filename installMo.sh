#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='alacritty' ; B='completion' ; C='git clone' ; D="pikaur -Syyu" ; E='pipewire' ; F='firefox-developer-edition-i18n-' ; G='otf-fira-' 
U=$USER
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ; ${C} https://github.com/${A}/${A}.git ; cd ${A} ; curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
source /home/${U}/.cargo/env ; cargo build --release ; mkdir -p ~/.bash_${B} ; mkdir -p ~/.config/${A} ; mkdir ~/.config/openbox
cp extra/${B}s/${A}.bash ~/.bash_${B}/${A} ; cp ${A}.yml ~/.config/${A}/${A}.yml ; echo "source ~/.bash_${B}/${A}" >> ~/.bashrc
cd ~ ; ${C} https://aur.archlinux.org/pikaur.git ; cd pikaur ; makepkg -fsri ; curl -sL https://git.io/JGVg5 > ~/installna.sh 
${D} xorg rsync lxqt-policykit openbox obconf openbox-themes oranchelo-icon-theme nm-connection-editor network-manager-applet gufw \
alsa-utils ${E} ${E}-alsa ${E}-pulse ${E}-jack gst-plugin-${E} libpulse vlc volumeicon picom xorg-xprop capitaine-cursors geany geany-plugins \
nemo nemo-fileroller nemo-image-converter nemo-preview nemo-python nemo-qt-components obkey arandr gvfs gvfs-mtp gvfs-afc \
${F}en-us ${F}en-gb ${F}en-ca ${F}fr ${F}de ${F}it ${F}ja ${F}zh-cn ${F}zh-tw ${F}ru ${F}he ${F}pt-br ${G}sans ${G}mono ttf-ms-fonts \
trayer rofi-theme-menu-1080p plank galculator xterm sddm timeshift 
if [[ -n "$(grep -E '[8|9|10|11|12|13|14]' /sys/class/dmi/id/chassis_type)" ]] ; then ${D} tlp acpi cbatticon ; fi
su --login root -c "sh /home/${U}/installna.sh"
