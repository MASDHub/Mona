#!/bin/bash  
set -euo pipefail ; setfont ter-124b 
A='\e[1;31m' ; B='\e[0m' ; C="name,size -e 7,11"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
F='btrfs su cr @' ; G='mount -o noatime,compress=zstd,discard=async,subvol=@' # Mozart - Moonlight Sonata 
H='pacman' ; I='TotalDownload' ; J='MODULES=' ; K='/etc/mkinitcpio.conf'      #  0:35 ━❍──────── -5:32    
L='xf86-video-' ; M="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"               #    ↻     ⊲  Ⅱ  ⊳     ↺     
N='pipewire' ; O='otf-fira-' ; P='firefox-developer-edition-i18n-'            #    VOLUME: ▁▂▃▄▅▆▇ 100%   
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
lsblk -do ${C} ; printf "${A}Choose Device name: ${B}" ; read -r D 
until [[ "${D}" == +(nvme0n1|sda|sdb|hda|hdb|hdc|hdd|mmcblk0) ]] ; do printf "Try Again\n" && read -r D ; done 
D1="/dev/${D}" ; sgdisk ${D1} -Z -o -n 1::+512M -t 1:EF00 -n -i -v -p
E1="$(ls /dev/* | grep -E "^${D1}p?1$")" ; E2="$(ls /dev/* | grep -E "^${D1}p?2$")" 
mkfs.vfat ${E1} ; mkfs.btrfs -fq ${E2} ; mount ${E2} /mnt ; cd /mnt ; ${F} ; ${F}home 
cd ; umount /mnt ; ${G} ${E2} /mnt ; mkdir /mnt/{boot,home} ; ${G}home ${E2} /mnt/home 
mount ${E1} /mnt/boot ; lsblk -o ${C} ; curl -sL https://git.io/Jsde3 > /mnt/install.sh 
sed -i 's/#Color/Color/' /etc/${H}.conf ; sed -i s"/#${I}/${I}/" /etc/${H}.conf 
gpg -k ; ${H}-key --init ; ${H}-key --populate archlinux >/dev/null
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/${H}.d/mirrorlist
if [[ "${M}" == "AMD" ]] || [[ "${M}" == "Intel" ]] ; then M1="${M}"; fi ; if [[ "${M1}" == "AMD" ]] 
then M2="amd-ucode ${L}amdgpu" && sed -i "s/${J}()/${J}(amdgpu btrfs)/" ${K}
else M2="intel-ucode ${L}intel" && sed -i "s/${J}()/${J}(i915 btrfs)/" ${K} ; fi
if [[ -n "$(grep -E '[8|9|10|11|12|13|14]' /sys/class/dmi/id/chassis_type)" ]] ; then Q="tlp acpid cbatticon" ; fi
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub vim ${M2} \
xorg lxqt-policykit obconf nm-connection-editor network-manager-applet gufw xorg-xprop sddm xterm alacritty \
alsa-utils ${N} ${N}-alsa ${N}-jack gst-plugin-${N} libpulse vlc volumeicon geany-plugins capitaine-cursors \
nemo-fileroller nemo-preview arandr gvfs-mtp gvfs-afc trayer plank galculator xlockmore htop \
${P}en-us ${P}fr ${P}de ${P}it ${P}ja ${P}zh-cn ${P}ru ${P}he ${P}pt-br ${O}sans ${O}mono ${Q}
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
