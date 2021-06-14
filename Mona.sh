#!/bin/bash
set -euo pipefail 
setfont ter-124b 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='\e[1;31m' ; B='\e[0m' ; E='btrfs su cr @'              # Mozart - Moonlight Sonata
F='mount -o noatime,compress=zstd,discard=async,subvol=@' #  0:35 ━❍──────── -5:32
G="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"             #   ↻     ⊲  Ⅱ  ⊳     ↺
sed -i 's/#Co/Co/' /etc/pacman.conf                       #  VOLUME: ▁▂▃▄▅▆▇ 100%
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --populate
lsblk  | grep --color 'NAME|disk'
echo -en "${A}Enter Device to Install: ${B}"
read C ; until sgdisk /dev/${C} -Z \
-n 1::+512M -t 1:EF00 -n -i -v -p ; do
echo -en "${A}Try again: ${B}" && read C ; done
D1="$(ls /dev/* | grep -E "^$/dev/{C}p?1$")"
D2="$(ls /dev/* | grep -E "^$/dev/{C}p?2$")"
mkfs.vfat ${D1} ; mkfs.btrfs -fq ${D2}
mount ${D2} /mnt; cd /mnt ; ${E}home
${E} ; cd ; umount /mnt ; ${F} ${D2} /mnt
mkdir /mnt/{boot,home} ; ${F}home ${D2} /mnt/home
mount ${D1} /mnt/boot ; lsblk -e 7,11 | egrep --color /
if [ "${G}" == Intel ] ; then H='intel' && I='i915 '
fi ; if [ "${G}" == AMD ]; then H='amd' && I='amdgpu '
fi ; if [[ ${#G} -gt 1 ]] ; then J=''${H}'-ucode xf86-video-'${H}''
fi ; sed -i "s/ULES=()/ULES=(${I}btrfs)/" /etc/mkinitcpio.conf
timedatectl set-ntp true | reflector -a 12 --score 10 -f 2 --save /etc/pacman.d/mirrorlist
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware \
networkmanager network-manager-applet nm-connection-editor vim gufw \
lxqt-policykit xorg grub efibootmgr xlockmore xterm alacritty plank \
pipewire alsa-utils pipewire-alsa pipewire-jack pipewire-pulse rofi \
libpulse gst-plugin-pipewire geany-plugins gvfs-mtp gvfs-afc arandr \
lxappearance-obconf-gtk3 geeqie nemo-fileroller nemo-preview trayer \
firefox firefox-ublock-origin libreoffice-still galculator htop git \
capitaine-cursors otf-fira-sans otf-fira-mono python-pyxdg sddm vlc \
xorg-xinit volumeicon cmake pkg-config screengrab ${J}
cp /etc/mkinitcpio.conf /mnt/etc/mkinitcpio.conf
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/install.sh > /mnt/etc/install.sh
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
