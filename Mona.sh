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
H='etc/mkinitcpio.conf' ; I='timedatectl set-' #
J='/etc/pacman' ; sed -i 's/#Co/Co/' ${J}.conf #
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
${F}home${C}/mnt/home ; mount${B}/mnt/boot
if [[ ${G} == Intel ]]; then G1='i915 ' \  
&& G2='intel-ucode  ' ; elif [[ ${G} == AMD ]]
then G1='amdgpu ' && G2='amd-ucode' ; fi
lsblk -o NAME,SIZE,MOUNTPOINT -e 7,11 
T="$(curl -s https://ipapi.co/timezone)" 
${I}timezone ${T} && ${I}ntp true
reflector -p https -f 2 -a 8 --sort rate \
-c "$(curl -s https://ipapi.co/country)" \
--save ${J}.d/mirrorlist || reflector -p \
https -a 12 -f 10 --score 10 --sort rate \
--save ${J}.d/mirrorlist 
sed -i "s/ULES=()/ULES=(${G1}btrfs)/" /${H}
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
arandr ${G2}; cp /${H} /mnt/${H} ; curl -sL \
https://raw.githubusercontent.com/djsharcode\
/Mona/main/install.sh -o /mnt/etc/install.sh
echo "${T}" > /mnt/etc/T
cp ${J}.conf /mnt${J}.conf 
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
