#!/bin/bash
setfont ter-124b
head -n 8 -- "$0" | tail -n 5
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#        Mozart - Moonlight Sonata            #
#         0:35 ━❍──────── -5:32            #
#          ↻     ⊲  Ⅱ  ⊳     ↺               #
#         VOLUME: ▁▂▃▄▅▆▇ 100%           #
A='\e[1;31m' ; B='\e[0m' ; E='btrfs su cr @'  #
F='mount -o noatime,compress=zstd,subvol=@'   #
G="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)" #
J='/etc/mkinitcpio.conf' ; K='/etc/pacman'    #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --populate
lsblk  | egrep --color 'NAME|SIZE|disk'
echo -en "${A}Enter Device to Install: ${B}"
read -r C ; until sgdisk /dev/${C} -Z \
-o -n 1::+512M -t 1:EF00 -n -i -v -p
do echo -en "${A}Try again:  ${B}" && \
read -r C ; done; sed -e 's/#Co/Co/' ${K}.conf
D1="$(ls /dev/* | grep -E "^/dev/${C}p?1$") "
D2="$(ls /dev/* | grep -E "^/dev/${C}p?2$") "
mkfs.vfat ${D1} ; mkfs.btrfs -fq ${D2}
mount ${D2}/mnt ; cd /mnt ; ${E}home
${E} ; cd ; umount /mnt  ; ${F} ${D2}/mnt
mkdir /mnt/{boot,home}  ; mount ${D1}/mnt/boot
${F}home ${D2}/mnt/home; lsblk -e 7,11
if [[ ${G} == Intel ]]; then I='i915 '\
 && H='intel-ucode'  ; fi
if [[ ${G} == AMD ]]; then I='amdgpu '\
 && H='amd-ucode'  ; fi
sed -i "s/ULES=()/ULES=(${I}btrfs)/" ${J}
timedatectl set-ntp true | reflector -f 2 \
-p https --score 10 --save ${K}.d/mirrorlist
pacstrap -i /mnt base base-devel linux plank \
linux-headers linux-firmware efibootmgr grub \
networkmanager lxappearance-obconf-gtk3 sddm \
network-manager-applet nm--connection-editor \
lxqt-policykit alacritty git nemo-fileroller \
pipewire-alsa pipewire-pulse libpulse arandr \
pipewire-jack alsa-utils gst-plugin-pipewire \
pipewire trayer xorg-xinit vlc xlockmore vim \
volumeicon nemo-preview screengrab gufw htop \
firefox firefox-ublock-origin gvfs-mtp xterm \
otf-fira-sans capitaine-cursors galculator \
pkg-config gvfs-afc otf-fira-mono rofi xorg \
geany-plugins libreoffice-still ${H}
cp ${J} /mnt${J}; cp ${K} /mnt${K}; curl -sL \
https://raw.githubusercontent.com/djsharcode/\
Mona/main/install.sh > /mnt/etc/install.sh
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
