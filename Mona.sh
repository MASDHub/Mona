#!/bin/bash  
set -euo pipefail 
setfont ter-124b 
A='\e[1;31m' ; B='\e[0m' 
C="name,size -e 7,11" ; lsblk -do ${C}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Mozart - Moonlight Sonata  ||  A='\e[1;31m' | B='\e[0m' | C="name,size -e 7,11" | read -r D | E="/dev/${D}"
#  0:35 ━❍──────── -5:32     ||  F='mount -o noatime,compress=zstd,discard=async,subvol=@' | G='btrfs su cr @'
#       ↻     ⊲  Ⅱ  ⊳     ↺       ||  H='pacman' | I='TotalDownload' | J='MODULES=' | K='/etc/mkinitcpio.conf'
#    VOLUME: ▁▂▃▄▅▆▇ 100%   ||  L='xf86-video-' | M="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)" | N="intel/amd-ucode"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
printf "${A}Device name: ${B}" ; read -r D ; E="/dev/${D}" ; sgdisk ${E} -Z -o -n 1::+512M -t 1:EF00 -n -i -v -p 
E1="$(ls /dev/* | grep -E "^${E}p?1$")" ; E2="$(ls /dev/* | grep -E "^${E}p?2$")" ; mkfs.vfat ${E1} ; mkfs.btrfs -fq ${E2} 
F='mount -o noatime,compress=zstd,discard=async,subvol=@' ; G='btrfs su cr @' ; H='pacman' ; I='TotalDownload' 
mount ${E2} /mnt ; cd /mnt ; ${G} ; ${G}home ; cd ; umount /mnt ; ${F} ${E2} /mnt ; mkdir /mnt/{boot,home} 
${F}home ${E2} /mnt/home ; mount ${E1} /mnt/boot ; lsblk -o ${C}
J='MODULES=' ; K='/etc/mkinitcpio.conf' ; L='xf86-video-'  ; M="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"
if [[ "${M}" == "Intel" ]] ; then N="intel-ucode ${L}intel" && sed -i "s/${J}()/${J}(i915 btrfs)/" ${K} 
elif [[ "${M}" == "AMD" ]] ; then N="amd-ucode ${L}amdgpu" && sed -i "s/${J}()/${J}(amdgpu btrfs)/" ${K} ; fi
sed -i 's/#Color/Color/' /etc/${H}.conf && sed -i "s/#${I}/${I}/" /etc/${H}.conf 
curl -sL https://git.io/Jsde3 > install.sh ; cp install.sh /mnt/install.sh ; chmod +x /mnt/install.sh
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/${H}.d/mirrorlist
gpg -k ; ${H}-key --init ; ${H}-key --populate archlinux >/dev/null
pacstrap -i /mnt base linux linux-headers linux-firmware networkmanager efibootmgr grub vim ${N}
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
