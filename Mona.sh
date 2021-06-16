#!/bin/bash
setfont ter-124b 
head -n 8 -- "$0" | tail -n 5
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
    #     Mozart - Moonlight Sonata           #
 #         0:35 ━❍──────── -5:32           #
   #       ↻     ⊲  Ⅱ  ⊳     ↺               #
#          VOLUME: ▁▂▃▄▅▆▇ 100%          # 
A='\e[1;31m' ; B='\e[0m' ; E='btrfs su cr @'  #
F='mount -o noatime,compress=zstd,subvol=@'   #
G="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)" #
J='etc/mkinitcpio.conf' ; K='etc/pacman'    # 
L='timedatectl set'                          #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --populate
lsblk  | egrep --color 'NAME|SIZE|disk'
echo -en "${A}Enter Device to Install: ${B}"
read -r C ; until sgdisk /dev/${C} -Z \
-o -n 1::+512M -t 1:EF00 -n -i -v -p
do echo -en "${A}Try again:  ${B}" && \
read -r C ; done; sed -i 's/#Co/Co/' ${K}.conf
D1="$(ls /dev/* | egrep "^/dev/${C}p?1$") "
D2="$(ls /dev/* | egrep "^/dev/${C}p?2$") "
mkfs.vfat ${D1} ; mkfs.btrfs -fq ${D2}
mount ${D2}/mnt ; cd /mnt ; ${E}home
${E} ; cd ; umount /mnt  ; ${F} ${D2}/mnt
mkdir /mnt/{boot,home}  ; mount ${D1}/mnt/boot
${F}home ${D2}/mnt/home; 
if [[ ${G} == Intel ]]; then I='i915 '\
 && H='intel-ucode'  ; fi ; lsblk -e 7,11
if [[ ${G} == AMD ]]; then I='amdgpu '\
 && H='amd-ucode'  ; fi ; ${L}-timezone \
"$(curl -s https://ipapi.co/timezone)"
${L}-ntp true ; reflector -p https -a 12 \
-c "$(curl -s https://ipapi.co/country)" \
--sort rate --save /${K}.d/mirrorlist || \
reflector -p https --score 5 --sort rate \
-a 12 -f 2 --save /${K}.d/mirrorlist 
sed -i "s/ULES=()/ULES=(${I}btrfs)/" /${J}
pacstrap -i /mnt base base-devel linux xorg \
linux-headers linux-firmware efibootmgr vim \
networkmanager rofi gufw htop obconf-qt git \
network-manager-applet nm-connection-editor \
pipewire pipewire-alsa pipewire-pulse plank \
pipewire-jack alsa-utils lxqt-policykit vlc \
gst-plugin-pipewire gvfs-afc gvfs-mtp xterm \
nemo-preview nemo-fileroller alacritty grub \
firefox firefox-ublock-origin geany-plugins \
libreoffice-still otf-fira-mono trayer sddm \
pkg-config otf-fira-sans xlockmore libpulse \
volumeicon screengrab galculator xorg-xinit \
arandr ${H} ; cp /${J} /mnt/${J} ; curl -sL \
https://raw.githubusercontent.com/djsharcode\
/Mona/main/install.sh -o /mnt/etc/install.sh
cp /${K}.conf /mnt/${K}.conf
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
