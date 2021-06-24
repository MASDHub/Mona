#!/bin/bash
setfont ter-124b 
head -n 8 -- "$0" | tail -n 5
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
    #     Mozart - Moonlight Sonata            #
 #         0:35 ━❍──────── -5:32           #
   #       ↻     ⊲  Ⅱ  ⊳     ↺               #
#          VOLUME: ▁▂▃▄▅▆▇ 100%          # 
E='btrfs su cr @'                              #
F='mount -o noatime,compress=zstd,subvol=@'    #
G="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"  #
H='/etc/mkinitcpio.conf'; I='timedatectl set-' #
J='/etc/pacman' ; sed -i 's/#Co/Co/' ${J}.conf #
T=" $(curl -s https://ipapi.co/timezone) "     #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --populate
lsblk  | egrep --color 'NAME|SIZE|disk'
read -r -p "Enter Install Disk :  " \
A ; until sgdisk /dev/${A} -Z -o -n \
1::+512M -t 1:EF00 -n -i -v -p ; do \
read -r -p "No, Try Again :" A ; done
B=" $(ls /dev/* | egrep "^/dev/${A}p?1$") "
C=" $(ls /dev/* | egrep "^/dev/${A}p?2$") "
mkfs.vfat ${B}  ; mkfs.btrfs -fq ${C}
mount ${C} /mnt ; cd /mnt
${E}home ; ${E} ; cd ; umount /mnt
${F} ${C} /mnt  ; mkdir /mnt/{boot,home}
${F}home${C}/mnt/home; mount${B}/mnt/boot
if [ ${G} == Intel ] ; then G1='i915 '\
 && G2='intel-ucode' ; elif [ ${G} == AMD ]
then G2='amd-ucode ' && G1='amdgpu '
fi; ${I}timezone${T} && ${I}ntp true
lsblk -o NAME,SIZE,MOUNTPOINT -e 7,11
sed -i "s/ULES=()/ULES=(${G1}btrfs)/" ${H}
reflector -p https --sort rate -l 4 -f 2 -c \
"$(curl -s https://ipapi.co/country)" -a 12 \
--save ${J}.d/mirrorlist || reflector -a 12 \
-p https --score 5 --save ${J}.d/mirrorlist
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
arandr ${G2}; cp ${H} /mnt${H} ; curl -sL \
https://raw.githubusercontent.com/djsharcode\
/Mona/main/install.sh -o /mnt/etc/install.sh
echo "${T}" > /mnt/etc/T
cp ${J}.conf /mnt${J}.conf
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
