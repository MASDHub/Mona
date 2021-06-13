#!/bin/bash
set -euo pipefail 
setfont ter-124b ; timedatectl set-ntp true
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='\e[1;31m' ; B='\e[0m' ; sed -i 's/#Co/Co/' /etc/pacman.conf    # Mozart - Moonlight Sonata
C='nvme0n1|sda|sdb|hda|hdb|hdc|hdd|mmcblk0' ; E='btrfs su cr @'   #  0:35 ━❍──────── -5:32
F='mount -o noatime,compress=zstd,discard=async,subvol=@'         #   ↻     ⊲  Ⅱ  ⊳     ↺
G="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"                     #  VOLUME: ▁▂▃▄▅▆▇ 100%
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --populate
lsblk  | egrep --color ${C}
printf "\n${A}Enter Device name: ${B}"
read D ; until [[ "${D}" == +(${C}) ]]
do printf "${A}Try again: ${B}" && read D ; done
sgdisk /dev/${D} -Z -o -n 1::+512M -t 1:EF00 -n -p
D1="$(ls /dev/* | grep -E "^/dev/${D}p?1$")"
D2="$(ls /dev/* | grep -E "^/dev/${D}p?2$")"
mkfs.vfat ${D1} ; mkfs.btrfs -fq ${D2}
mount ${D2} /mnt; cd /mnt ; ${E}home
${E} ; cd ; umount /mnt ; ${F} ${D2} /mnt
mkdir /mnt/{boot,home} ; ${F}home ${D2} /mnt/home
mount ${D1} /mnt/boot ; lsblk -fs -e 7,11
if [ "${G}" == Intel ] ; then H='intel' && I='i915 '
fi ; if [ "${G}" == AMD ]; then H='amd' && I='amdgpu '
fi ; if [[ ${#G} -gt 1 ]] ; then J=''${H}'-ucode xf86-video-'${H}''
fi ; sed -i "s/ULES=()/ULES=(${I}btrfs)/"  /etc/mkinitcpio.conf
reflector -p https --score 10 -f 2 --save /etc/pacman.d/mirrorlist
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware \
networkmanager network-manager-applet nm-connection-editor vim gufw \
lxqt-policykit xorg grub efibootmgr xlockmore xterm alacritty plank \
pipewire alsa-utils pipewire-alsa pipewire-jack pipewire-pulse rofi \
libpulse gst-plugin-pipewire geany-plugins gvfs-mtp gvfs-afc arandr \
lxappearance-obconf-gtk3 geeqie nemo-fileroller nemo-preview trayer \
firefox firefox-ublock-origin libreoffice-still galculator htop git \
capitaine-cursors otf-fira-sans otf-fira-mono python-pyxdg sddm vlc \
xorg-xinit volumeicon cmake pkg-config ${J} ; cp /etc/mkinitcpio.conf /mnt/etc/mkinitcpio.conf
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/install.sh > /mnt/etc/install.sh
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
