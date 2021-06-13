#!/bin/bash
set -euo pipefail 
setfont ter-124b ; timedatectl set-ntp true 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='\e[1;31m' ; B='\e[0m' ; sed -i -e 's/#Co/Co/' /etc/pacman.conf # Mozart - Moonlight Sonata
C='nvme0n1|sda|sdb|hda|hdb|hdc|hdd|mmcblk0' ; E='btrfs su cr'     #  0:35 ━❍──────── -5:32
F='mount -o noatime,compress=zstd,discard=async,subvol=@'         #   ↻     ⊲  Ⅱ  ⊳     ↺
G="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"                     #  VOLUME: ▁▂▃▄▅▆▇ 100%
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --populate
lsblk  | egrep --color "${C}|NAME"
printf "\n${A}Enter Device name: ${B}"
read D ; until [[ "${D}" == +(${C}) ]]
do printf "${A}Try again: ${B}" && read D ; done
sgdisk /dev/${D} -Z -o -n 1::+512M -t 1:EF00 -n 
D1="$(ls /dev/* | grep -E "^/dev/${D}p?1$")"
D2="$(ls /dev/* | grep -E "^/dev/${D}p?2$")"
mkfs.vfat ${D1} ; mkfs.btrfs -fq ${D2}
mount ${D2} /mnt; cd /mnt ; ${E}home 
${E} ; cd ; umount /mnt ; ${F} ${D2} /mnt
mkdir /mnt/{boot,home} ; ${F}home ${D2} /mnt/home
mount ${D1} /mnt/boot ; lsblk -fs -e 7,11
if [ "${G}" == Intel ] ; then G1='intel' && G2='i915 '
fi ; if [ "${G}" == AMD ]; then G1='amd' && G2='amdgpu ' 
fi ; if [[ ${#G} -gt 1 ]] ; then G3=''${G1}'-ucode xf86-video-'${G1}''
fi ; sed -i "s/ULES=()/ULES=(${G2}btrfs)/" /etc/mkinitcpio.conf
reflector -p https -f 2 --score 10 --save /etc/pacman.d/mirrorlist
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware grub gufw xorg \
networkmanager network-manager-applet nm-connection-editor efibootmgr vim git htop \
lxappearance-obconf-gtk3 lxqt-policykit python-pyxdg xlockmore xorg-xinit sddm vlc \
alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack gst-plugin-pipewire \
volumeicon gvfs-mtp gvfs-afc geany-plugins nemo-fileroller nemo-preview galculator \
firefox-developer-edition libreoffice-still otf-fira-sans otf-fira-mono xterm rofi \
capitaine-cursors plank geeqie trayer arandr alacritty cmake pkg-config libpulse ${G3} 
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/install.sh > /mnt/etc/install.sh
cp /etc/mkinitcpio.conf /mnt/etc/mkinitcpio.conf ; genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/install.sh 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
