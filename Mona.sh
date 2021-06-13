#!/bin/bash
set -euo pipefail 
setfont ter-124b ; timedatectl set-ntp true 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='\e[1;31m' ; B='\e[0m' ; sed -i -e 's/#Co/Co/' /etc/pacman.conf #  Mozart - Moonlight Sonata         
C='nvme0n1|sda|sdb|hda|hdb|hdc|hdd|mmcblk0' ; G='btrfs su cr'     #    0:35 ━❍──────── -5:32
H='mount -o noatime,compress=zstd,discard=async,subvol=@'         #     ↻     ⊲  Ⅱ  ⊳     ↺
I="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"                     #     VOLUME: ▁▂▃▄▅▆▇ 100%
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --populate
lsblk  | egrep --color "${C}|NAME"
printf "\n${A}Enter Device name: ${B}"
read E ; until [[ "${E}" == +(${C}) ]]
do printf "${A}Try again: ${B}" && read E ; done
sgdisk /dev/${E} -Z -o -n 1::+512M -t 1:EF00 -n 
E1="$(ls /dev/* | grep -E "^/dev/${E}p?1$")"
E2="$(ls /dev/* | grep -E "^/dev/${E}p?2$")"
mkfs.vfat ${E1} ; mkfs.btrfs -fq ${E2}
mount ${E2} /mnt; cd /mnt ; ${G}home 
${G} ; cd ; umount  /mnt ; ${H} ${E2} /mnt
mkdir /mnt/{boot,home} ; ${H}home ${E2} /mnt/home
mount ${E1} /mnt/boot ; lsblk -fs -e 7,11
if [ "${I}" == Intel ] ; then I1='intel' && I2='i915 '
fi ; if [ "${I}" == AMD ]; then I1='amd' && I2='amdgpu ' 
fi ; if [[ ${#I} -gt 1 ]] ; then I3=''${I1}'-ucode xf86-video-'${I1}''
fi ; sed -i "s/ULES=()/ULES=(${I2}btrfs)/" /etc/mkinitcpio.conf
reflector -p https -f 2 --score 10 --save /etc/pacman.d/mirrorlist
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware grub gufw xorg \
networkmanager network-manager-applet nm-connection-editor efibootmgr vim git htop \
lxappearance-obconf-gtk3 lxqt-policykit python-pyxdg xlockmore xorg-xinit sddm vlc \
alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack gst-plugin-pipewire \
volumeicon gvfs-mtp gvfs-afc geany-plugins nemo-fileroller nemo-preview galculator \
firefox-developer-edition libreoffice-still otf-fira-sans otf-fira-mono xterm rofi \
capitaine-cursors plank geeqie trayer arandr alacritty cmake pkg-config libpulse ${I3} 
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/install.sh > /mnt/etc/install.sh
cp /etc/mkinitcpio.conf /mnt/etc/mkinitcpio.conf ; genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/install.sh 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
