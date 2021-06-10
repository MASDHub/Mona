#!/bin/bash  
set -euo pipefail ; setfont ter-124b 
A='\e[1;31m' ; B='\e[0m' ; C="name,size -e 7,11"; T='curl -s https://ipapi.co/'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
F='btrfs su cr @' ; G='mount -o noatime,compress=zstd,discard=async,subvol=@'  # Mozart - Moonlight Sonata 
H='pacman' ; I='TotalDownload' ; J='MODULES=' ; K='/etc/mkinitcpio.conf'       #  0:35 ━❍──────── -5:32    
L='xf86-video-' ; M="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)" ; N='pipewire' #    ↻     ⊲  Ⅱ  ⊳     ↺     
O='otf-fira-' ; P='firefox-developer-edition-i18n-' ; Q='libreoffice-still-'   #    VOLUME: ▁▂▃▄▅▆▇ 100%   
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
lsblk -do ${C} ; printf "${A}Choose Device name: ${B}" ; read -r D 
until [[ "${D}" == +(nvme0n1|sda|sdb|hda|hdb|hdc|hdd|mmcblk0) ]] 
do printf "Try Again\n" && read -r D ; done ; D1="/dev/${D}" 
sgdisk ${D1} -Z -o -n 1::+512M -t 1:EF00 -n -i -v -p
E1="$(ls /dev/* | grep -E "^${D1}p?1$")" ; mkfs.vfat ${E1}
E2="$(ls /dev/* | grep -E "^${D1}p?2$")" ; mkfs.btrfs -fq ${E2} 
mount ${E2} /mnt ; cd /mnt ; ${F} ; ${F}home ; cd ; umount /mnt 
 ${G} ${E2} /mnt ; mkdir /mnt/{boot,home} ; ${G}home ${E2} /mnt/home
mount ${E1} /mnt/boot ; lsblk -o ${C} ; gpg -k 
${H}-key --init ; ${H}-key --populate archlinux>/dev/null
sed -i -e 's/#Color/Color/' -e "s/#${I}/${I}/" /etc/${H}.conf
timedatectl set-timezone "$(${T}timezone)" ; timedatectl set-timezone
reflector -p https -c "$(${T}country_name)" -f 2 --save /etc/${H}.d/mirrorlist
if [ "${M}" == 'Intel' ] ; then M1="intel-ucode ${L}intel" && sed "s/${J}()/${J}(i915 btrfs)/" ; fi
if [ "${M}" == 'AMD' ] ; then M1="amd-ucode ${L}amdgpu" && sed "s/${J}()/${J}(amdgpu btrfs)/" ; fi 
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/install.sh > /mnt/install.sh
pacstrap -i /mnt  base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub vim \
xorg lxqt-policykit obconf nm-connection-editor network-manager-applet gufw xorg-xprop sddm xterm alacritty \
alsa-utils ${N} ${N}-alsa ${N}-jack gst-plugin-${N} libpulse vlc volumeicon geany-plugins capitaine-cursors \
nemo-fileroller nemo-preview arandr gvfs-mtp gvfs-afc trayer plank galculator xlockmore htop geeqie \
${P}en-us ${P}de ${P}ja ${P}zh-cn ${P}ru ${P}ar ${P}pt-br ${O}sans ${O}mono \
${Q}en-gb ${Q}hi ${Q}ko ${Q}zh-tw ${Q}uk ${Q}he ${Q}es ${M1}
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
