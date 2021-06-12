#!/bin/bash
set -euo pipefail ; setfont ter-124b
A='\e[1;31m' ; B='\e[0m' ; C='nvme0n1|sda|sdb|hda|hdb|hdc|hdd|mmcblk0'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
sed -i -e 's/#Co/Co/' /etc/pacman.conf ; F='etc/mkinitcpio.conf'              #  Mozart - Moonlight Sonata
G='btrfs su cr @' ; H='mount -o noatime,compress=zstd,discard=async,subvol=@' #    0:35 ━❍──────── -5:32
I="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"                                 #     ↻     ⊲  Ⅱ  ⊳     ↺
J='firefox-developer-edition-i18n-' ; K='libreoffice-still-'                  #     VOLUME: ▁▂▃▄▅▆▇ 100%
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --populate ; timedatectl set-ntp true
lsblk -do NAME,SIZE | egrep --color "${C}|NAME"
printf "${A}Choose Device name: ${B}" 
read E ; until [[ "${E}" == +(${C}) ]]
do printf "${A}Try again: ${B}" && read E ; done
sgdisk /dev/${E} -Z -o -n 1::+512M -t 1:EF00 -n -i -v -p
E1="$(ls /dev/* | grep -E "^/dev/${E}p?1$")" 
E2="$(ls /dev/* | grep -E "^/dev/${E}p?2$")" 
mkfs.vfat ${E1} ; mkfs.btrfs -fq ${E2}
mount ${E2} /mnt; cd /mnt ; ${G}home ; ${G} ; cd ; umount  /mnt
 ${H} ${E2} /mnt; mkdir /mnt/{boot,home} ; ${H}home ${E2} /mnt/home
mount ${E1} /mnt/boot ; lsblk -o NAME,MOUNTPOINT,PARTUUID -e 7,11
if [ "${I}" == 'AMD' ]; then I1='amd' && I2='amdgpu ' ; fi
if [ "${I}" == Intel ]; then I1='intel' && I2='i915 ' ; fi
if [[ ${#I} -gt '1' ]]; then I3="${I1}-ucode xf86-video-${I1}"
fi ; sed -i "s/LES=()/LES=(${I2}btrfs)/" /${F}
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/pacman.d/mirrorlist
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub vim git \
lxqt-policykit xlockmore python-pyxdg lxappearance-obconf-gtk3 nm-connection-editor network-manager-applet \
alsa-utils pipewire pipewire-alsa pipewire-jack libpulse volumeicon blueman vlc gst-plugin-pipewire geeqie \
nemo-fileroller nemo-preview geany-plugins gvfs-mtp gvfs-afc capitaine-cursors alacritty xterm trayer rofi \
${J}en-us ${J}de ${J}ja ${J}zh-cn ${J}ru ${J}ar ${J}pt-br otf-fira-sans otf-fira-mono pkg-config sddm gufw \
${K}en-gb ${K}hi ${K}ko ${K}zh-tw ${K}uk ${K}he ${K}es cmake htop arandr galculator plank ${I3}
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/install.sh > /mnt/etc/install.sh
cp /${F} /mnt/${F} ; genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
