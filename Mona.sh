#!/bin/bash
set -euo pipefail ; setfont ter-124b
A='\e[1;31m' ; B='\e[0m' ; C='nvme0n1|sda|sdb|hda|hdb|hdc|hdd|mmcblk0'
D='..............................' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
sed -i -e 's/#Co/Co/' /etc/pacman.conf ; F='etc/mkinitcpio.conf'              #  Mozart - Moonlight Sonata
G='btrfs su cr @' ; H='mount -o noatime,compress=zstd,discard=async,subvol=@' #    0:35 ━❍──────── -5:32
I="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)" ; J='https://ipapi.co/'         #     ↻     ⊲  Ⅱ  ⊳     ↺
K='firefox-developer-edition-i18n-' ; L='libreoffice-still-'                  #     VOLUME: ▁▂▃▄▅▆▇ 100%
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --init | pacman-key --populate 
timedatectl set-timezone "$(curl -s ${J}timezone)" #; timedatectl set-ntp true
lsblk -do NAME,SIZE -e 7,11 | egrep --color "${C}|NAME" #echo "" ;  for i in {1..30} ; do echo -ne "${A}\r${D:0:$i}${B}" && sleep 1.8 ; done
echo -en "\n${A}Choose Device name: ${B}" 
read E ; until [[ "${E}" == +(${C}) ]] 
do printf "${A}try again: ${B}" && read E; done 
ED="/dev/${E}"  ; sgdisk ${ED} -Z -o -n 1::+512M -t 1:EF00 -n #-i -v -p
E1="$(ls /dev/* | grep -E "^${ED}p?1$")" ; mkfs.vfat ${E1}
E2="$(ls /dev/* | grep -E "^${ED}p?2$")" ; mkfs.btrfs -fq ${E2}
mount ${E2} /mnt; cd /mnt ; ${G} ; ${G}home ; cd ; umount  /mnt
${H} ${E2} /mnt ; mkdir /mnt/{boot,home} ; ${H}home ${E2} /mnt/home ; mount ${E1} /mnt/boot
lsblk -o NAME,SIZE,MOUNTPOINT -e 7,11 | egrep  --color '|/mnt/|home|boot|MOUNTPOINT'
if [ "${I}" == 'Intel' ] ; then H1='intel-ucode xf86-video-intel vulkan-intel' && H2='i915'
elif [ "${I}" == 'AMD' ] ; then H1='amd-ucode xf86-video-amdgpu vulkan-radeon' && H2='amdgpu'
fi ; if [[ -n "${I}" ]]  ; then sed -i -e '/#/d' -e "s/LES=()/LES=(${H2} btrfs)/" /${F} ; fi
reflector -p https -c "$(curl -s ${J}country_name)" -f 2 --save /etc/pacman.d/mirrorlist || pacman -Syy
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub git vim \
lxqt-policykit xlockmore python-pyxdg lxappearance-obconf-gtk3 nm-connection-editor network-manager-applet \
alsa-utils pipewire pipewire-alsa pipewire-jack libpulse volumeicon blueman vlc gst-plugin-pipewire geeqie \
nemo-fileroller nemo-preview geany-plugins gvfs-mtp gvfs-afc obconf-qt pkg-config otf-fira-sans plank rofi \
${K}en-us ${K}de ${K}ja ${K}zh-cn ${K}ru ${K}ar ${K}pt-br arandr otf-fira-mono galculator alacritty trayer \
${L}en-gb ${L}hi ${L}ko ${L}zh-tw ${L}uk ${L}he ${L}es gufw cmake xterm htop sddm xorg ${H1}
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/install.sh > /mnt/etc/install.sh
sed -i "s/LES=()/LES=(${H2} btrfs)/" /mnt/${F} ; genfstab -U /mnt >> /mnt/etc/fstab 
arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
