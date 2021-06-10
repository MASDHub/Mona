#!/bin/bash  
set -euo pipefail ; setfont ter-124b 
A='\e[1;31m' ; B='\e[0m' ; C="name,size -e 7,11"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
sed -i -e 's/#Color/Color/' -e 's/#TotalDownload/TotalDownload/' /etc/pacman.conf # Mozart - Moonlight Sonata 
F='btrfs su cr @' ; G='mount -o noatime,compress=zstd,discard=async,subvol=@'     #  0:35 ━❍──────── -5:32    
M="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"; K='curl -s https://ipapi.co/'      #   ↻     ⊲  Ⅱ  ⊳     ↺     
O='otf-fira-' ; P='firefox-developer-edition-i18n-' ; Q='libreoffice-still-'      #  VOLUME: ▁▂▃▄▅▆▇ 100%   
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --init | pacman-key --populate archlinux
timedatectl set-timezone "$(${K}timezone)" ; timedatectl set-ntp true
E='..........' ; for i in {1..20}; do echo -ne "\r${E:0:$i}" && sleep 1 ; done
lsblk -do ${C} ; printf "${A}Choose Device name: ${B}" ; read -r D 
until [[ "${D}" == +(nvme0n1|sda|sdb|hda|hdb|hdc|hdd|mmcblk0) ]] 
do printf "Try Again\n" && read -r D ; done ; D1="/dev/${D}" 
sgdisk ${D1} -Z -o -n 1::+512M -t 1:EF00 -n -i -v -p
E1="$(ls /dev/* | grep -E "^${D1}p?1$")" ; mkfs.vfat ${E1}
E2="$(ls /dev/* | grep -E "^${D1}p?2$")" ; mkfs.btrfs -fq ${E2} 
mount ${E2} /mnt ; cd /mnt ; ${F} ; ${F}home ; cd ; umount /mnt 
 ${G} ${E2} /mnt ; mkdir /mnt/{boot,home} ; ${G}home ${E2} /mnt/home
reflector -p https -c "$(${K}country_name)" -f 2 --save /etc/pacman.d/mirrorlist
if [ "${M}" == 'Intel' ] ; then M1='intel-ucode xf86-video-intel' && M2='i915'
elif [ "${M}" == 'AMD' ] ; then M1='amd-ucode xf86-video-amdgpu'  && M2='amdgpu' ; fi
if [ -n "${M}" ] ; then sed -i "s/MODULES=()/MODULES=(${M2} btrfs)/" /etc/mkinitcpio.conf ; fi 
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/install.sh > /mnt/install.sh ; lsblk -o ${C}
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub vim \
xorg lxqt-policykit obconf-qt nm-connection-editor network-manager-applet gufw xorg-xprop sddm xterm alacritty \
alsa-utils pipewire pipewire-alsa pipewire-jack gst-plugin-pipewire libpulse vlc volumeicon geany-plugins \
nemo-fileroller nemo-preview arandr gvfs-mtp gvfs-afc trayer plank galculator xlockmore htop geeqie \
${P}en-us ${P}de ${P}ja ${P}zh-cn ${P}ru ${P}ar ${P}pt-br ${O}sans ${O}mono \
${Q}en-gb ${Q}hi ${Q}ko ${Q}zh-tw ${Q}uk ${Q}he ${Q}es ${M1}
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
