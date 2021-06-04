#!/bin/bash  
set -euo pipefail 
setfont ter-124b 
A='\e[1;31m' ; B='\e[0m' 
C="name,size -e 7,11" ; lsblk -do ${C}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Mozart - Moonlight Sonata ||  A='\e[1;31m' | B='\e[0m' | C="name,size -e 7,11" | read -r D | E="/dev/${D}"
#  0:35 ━❍──────── -5:32    ||  F='btrfs su cr @' | G='mount -o noatime,compress=zstd,discard=async,subvol=@'
#    ↻     ⊲  Ⅱ  ⊳     ↺    ||  H='pacman' | I='TotalDownload' | J='MODULES=' | K='/etc/mkinitcpio.conf'
#    VOLUME: ▁▂▃▄▅▆▇ 100%   ||  L='xf86-video-' | M="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
printf "${A}Device name: ${B}" ; read -r D ; E="/dev/${D}" ; sgdisk ${E} -Z -o -n 1::+512M -t 1:EF00 -n -i -v -p 
E1="$(ls /dev/* | grep -E "^${E}p?1$")" ; E2="$(ls /dev/* | grep -E "^${E}p?2$")" ; mkfs.vfat ${E1} ; mkfs.btrfs -fq ${E2}
F='btrfs su cr @' ; G='mount -o noatime,compress=zstd,discard=async,subvol=@' ; mount ${E2} /mnt ; cd /mnt ; ${F} 
${F}home ; cd ; umount /mnt ; ${G} ${E2} /mnt ; mkdir /mnt/{boot,home} ; ${G}home ${E2} /mnt/home 
mount ${E1} /mnt/boot ; lsblk -o ${C} ; curl -sL https://git.io/Jsde3 > /mnt/install.sh
H='pacman' ; I='TotalDownload' ; sed -i 's/#Color/Color/' /etc/${H}.conf && sed -i s"/#${I}/${I}/" /etc/${H}.conf 
gpg -k ; ${H}-key --init ; ${H}-key --populate archlinux >/dev/null
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/${H}.d/mirrorlist
J='MODULES=' ; K='/etc/mkinitcpio.conf' ; L='xf86-video-' ; M="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"
if [[ "${M}" == "AMD" || "Intel" ]] ; then M1="${M}"; fi ; if [[ "${M1}" == "AMD" ]] 
then M2="amd-ucode ${L}amdgpu" && sed -i "s/${J}()/${J}(amdgpu btrfs)/" ${K}
else M2="intel-ucode ${L}intel" && sed -i "s/${J}()/${J}(i915 btrfs)/" ${K} ; fi
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub vim ${M2}
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
