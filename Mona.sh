#!/bin/bash  
set -euo pipefail ; setfont ter-124b 
A='\e[1;31m' ; B='\e[0m' ; C='..........' E="name,size -e 7,11"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
sed -i -e 's/#Color/Color/' -e 's/#TotalDownload/TotalDownload/' /etc/pacman.conf # Mozart - Moonlight Sonata 
F='btrfs su cr @' ; G='mount -o noatime,compress=zstd,discard=async,subvol=@'     #  0:35 ━❍──────── -5:32    
H="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"; I='curl -s https://ipapi.co/'      #   ↻     ⊲  Ⅱ  ⊳     ↺     
J='otf-fira-' ; K='firefox-developer-edition-i18n-' ; L='libreoffice-still-'      #  VOLUME: ▁▂▃▄▅▆▇ 100%   
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --init | pacman-key --populate archlinux
timedatectl set-timezone "$(${I}timezone)" ; timedatectl set-ntp true
for i in {1..20} ; do echo -ne "${A}\r${C:0:$i}${A}" && sleep 1.8 
done ; echo "" ; lsblk -do ${E} ; echo "${A}Choose Device name: ${B}" ; read -r D 
until [[ "${D}" == +(nvme0n1|sda|sdb|hda|hdb|hdc|hdd|mmcblk0) ]] 
do printf "Try Again\n" && read -r D ; done ; D1="/dev/${D}" 
sgdisk ${D1} -Z -o -n 1::+512M -t 1:EF00 -n -i -v -p
E1="$(ls /dev/* | grep -E "^${D1}p?1$")" ; mkfs.vfat ${E1}
E2="$(ls /dev/* | grep -E "^${D1}p?2$")" ; mkfs.btrfs -fq ${E2} 
mount ${E2} /mnt ; cd /mnt ; ${F} ; ${F}home ; cd ; umount /mnt 
 ${G} ${E2} /mnt ; mkdir /mnt/{boot,home} ; ${G}home ${E2} /mnt/home
reflector -p https -c "$(${I}country_name)" -f 2 --save /etc/pacman.d/mirrorlist
if [ "${H}" == 'Intel' ] ; then H1='intel-ucode xf86-video-intel' && H2='i915'
elif [ "${H}" == 'AMD' ] ; then H1='amd-ucode xf86-video-amdgpu'  && H2='amdgpu' ; fi
if [ -n "${H}" ] ; then sed -i "s/MODULES=()/MODULES=(${H2} btrfs)/" /etc/mkinitcpio.conf ; fi 
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/install.sh > /mnt/install.sh ; lsblk -o ${E}
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub vim \
xorg lxqt-policykit obconf-qt nm-connection-editor network-manager-applet gufw xorg-xprop sddm xterm alacritty \
alsa-utils pipewire pipewire-alsa pipewire-jack gst-plugin-pipewire libpulse vlc volumeicon geany-plugins \
nemo-fileroller nemo-preview arandr gvfs-mtp gvfs-afc trayer plank galculator xlockmore htop geeqie \
${K}en-us ${K}de ${K}ja ${K}zh-cn ${K}ru ${K}ar ${K}pt-br ${J}sans ${J}mono \
${L}en-gb ${L}hi ${L}ko ${L}zh-tw ${L}uk ${L}he ${L}es ${H1}
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
