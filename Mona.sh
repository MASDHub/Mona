#!/bin/bash  
set -euo pipefail ; setfont ter-124b 
A='\e[1;31m' ; B='\e[0m' ; C='..........' ; E="name,size -e 7,11"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
sed -i -e 's/#Color/Color/' -e 's/#TotalDownload/TotalDownload/' /etc/pacman.conf # Mozart - Moonlight Sonata 
F='btrfs su cr @' ; G='mount -o noatime,compress=zstd,discard=async,subvol=@'     #  0:35 ━❍──────── -5:32    
H="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)" ; I='curl -s https://ipapi.co/'     #   ↻     ⊲  Ⅱ  ⊳     ↺     
J='etc/mkinitcpio.conf' ; K='firefox-developer-edition-i18n-' ; L='libreoffice-still-' #  VOLUME: ▁▂▃▄▅▆▇ 100%   
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --init | pacman-key --populate archlinux
timedatectl set-timezone "$(${I}timezone)" ; timedatectl set-ntp true
for i in {1..20} ; do echo -ne "${A}\r${C:0:$i}${B}" && sleep 2 
done ; echo "" ; lsblk -do ${E} ; printf "${A}Choose Device name: ${B}"
read -r D ; until [[ "${D}" == +(nvme0n1|sda|sdb|hda|hdb|hdc|hdd|mmcblk0) ]] 
do printf "${A}Sorry, try again.${B}\n" && read -r D ; done ; D1="/dev/${D}" 
sgdisk ${D1} -Z -o -n 1::+512M -t 1:EF00 -n -i -v -p
E1="$(ls /dev/* | grep -E "^${D1}p?1$")" ; mkfs.vfat ${E1}
E2="$(ls /dev/* | grep -E "^${D1}p?2$")" ; mkfs.btrfs -fq ${E2} 
mount ${E2} /mnt ; cd /mnt ; ${F} ; ${F}home ; cd ; umount /mnt 
 ${G} ${E2} /mnt ; mkdir /mnt/{boot,home} ; ${G}home ${E2} /mnt/home ; mount ${E1} /mnt/boot 
if [ "${H}" == 'Intel' ] ; then H1='intel-ucode xf86-video-intel vulkan-intel' && H2='i915'
elif [ "${H}" == 'AMD' ] ; then H1='amd-ucode xf86-video-amdgpu vulkan-radeon' && H2='amdgpu' 
fi ; if [[ -n "${H}" ]]  ; then sed -i -e '/#/d' -e "s/MODULES=()/MODULES=(${H2} btrfs)/" /${J}
fi ; curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/install.sh > /mnt/install.sh
lsblk -o ${E} ; reflector -p https -c "$(${I}country_name)" -f 2 --save /etc/pacman.d/mirrorlist 
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub vim \
lxqt-policykit xlockmore python-pyxdg nm-connection-editor network-manager-applet arandr htop vlc xorg \
alsa-utils pipewire pipewire-alsa pipewire-jack libpulse volumeicon blueman geeqie gst-plugin-pipewire \
nemo-fileroller nemo-preview geany-plugins gvfs-mtp gvfs-afc trayer otf-fira-sans plank obconf-qt sddm \
${K}en-us ${K}de ${K}ja ${K}zh-cn ${K}ru ${K}ar ${K}pt-br xterm git otf-fira-mono galculator alacritty \
${L}en-gb ${L}hi ${L}ko ${L}zh-tw ${L}uk ${L}he ${L}es pkg-config gufw cmake ${H1} ; cp /${J} /mnt/${J}
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
