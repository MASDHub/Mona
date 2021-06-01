#!/bin/bash  
set -euo pipefail 
setfont ter-124b 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Mozart - Moonlight Sonata  ||                                                                                                                                   #
#  0:35 ━❍──────── -5:32                                                                                                                                           #
#   VOLUME: ▁▂▃▄▅▆▇ 100%    ||                                                                                                                                   #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='\e[1;31m' ; B='\e[0m' ; C="name,size -e 7,11" ; lsblk -do ${C} ; printf "${A}Device name: ${B}"
read C && D="/dev/${C}" && D1="$(ls /dev/* | grep -E "^${D}p?1$")" && D2="$(ls /dev/* | grep -E "^${D}p?2$")"
sgdisk "${D}" -Z -o -n 1::+512M -t 1:EF00 -n -i -v -p ; mkfs.vfat ${D1} ; mkfs.btrfs -fq ${D2}
E='mount -o noatime,compress=zstd,discard=async,subvol=@' ; F="btrfs su cr @"
mount ${D2} /mnt ; cd /mnt ; ${F} ; ${F}home ; cd ; umount /mnt ; ${E} ${D2} /mnt
mkdir /mnt/{boot,home} ; ${E}home ${D2} /mnt/home ; mount ${D1} /mnt/boot ; lsblk -o ${C}
G='pacman' ; H='TotalDownload' ; gpg -k ; ${G}-key --init ; ${G}-key --populate archlinux >/dev/null
sed -i 's/#Color/Color/' /etc/${G}.conf && sed -i 's/#{H}/{H}/' /etc/${G}.conf
I='MODULES=' ; J='/etc/mkinitcpio.conf' ; K='xf86-video-' 
if [[ "$(lspu | grep 'Intel' | sort -u)" == "Intel" ]] ; then N="intel-ucode ${K}intel" \
&& sed -i "s/${I}()/${I}(i915 btrfs)/" ${J} ; elif [[ "$(lspu | grep 'AMD' | sort -u)" == "AMD" ]] 
then N="amd-ucode ${K}amdgpu" && sed -i "s/${I}()/${I}(amdgpu btrfs)/" ${J} ; fi
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/${G}.d/mirrorlist
curl -sL https://git.io/Jsde3 > install.sh ; cp install.sh /mnt/install.sh ; chmod +x /mnt/install.sh
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub-btrfs vim git ${N}
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
