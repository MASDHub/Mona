#!/bin/bash  
set -euo pipefail 
setfont ter-122b 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Mozart - Moonlight Sonata  ||                                                                                                                                   #
#  0:35 ━❍──────── -5:32                                                                                                                                           #
#   VOLUME: ▁▂▃▄▅▆▇ 100%    ||                                                                                                                                 #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
lsblk -do name,size -e 7,11 | grep '[a-Z] ; printf "Device name: " | grep [a-Z:] ; read SDA 
sgdisk -Z /dev/$SDA ; sgdisk -o -n 1::+512M -t 1:EF00 -n -i -p /dev/$SDA ; BT="/dev/$SDA" ; BC="btrfs su cr @" 
PB="$(ls /dev/* | grep -E "^${BT}p?1$")" ; PR="$(ls /dev/* | grep -E "^${BT}p?2$")" 
MU="mount -o noatime,compress=zstd,discard=async,subvol=@" ; mkfs.vfat "${PB}" ; mkfs.btrfs -fq "${PR}" 
mount "${PR}" /mnt ; cd /mnt ; ${BC} ; ${BC}home ; cd ; umount /mnt ; ${MU} "${PR}" /mnt  
mkdir /mnt/{boot,home} ; ${MU}home "${PR}" /mnt/home ; mount "${PB}" /mnt/boot 
lsblk -o name,size,type,mountpoint -e 7,11 ; sleep 5
curl -sL https://git.io/Jsde3 > install.sh ; cp install.sh /mnt/install.sh ; chmod +x /mnt/install.sh 
MOD='MODULES=' ; MKC='/etc/mkinitcpio.conf' ; if [[ "$(lscpu | grep -Eo "Intel" | sort -u)" == Intel ]]
then VGA="intel-ucode xf86-video-intel" && sed -i 's/'${MOD}'()/'${MOD}'(i915 btrfs)/' ${MKC} 
else VGA="amd-ucode xf86-video-amdgpu" && sed -i 's/'${MOD}'()/'${MOD}'(amdgpu btrfs)/' ${MKC} ; fi 
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/pacman.d/mirrorlist
sed -i 's/#Color/Color/' /etc/pacman.conf ; sed -i 's/#TotalDownload/TotalDownload/' /etc/pacman.conf
gpg -k ; pacman-key --init ; pacman-key --populate archlinux >/dev/null
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub-btrfs vim git ${VGA}
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
