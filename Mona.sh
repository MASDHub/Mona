#!/bin/bash  
set -euo pipefail 
setfont ter-122b 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Mozart - Moonlight Sonata  ||                                                                                                                                   #
#  0:35 ━❍──────── -5:32                                                                                                                                           #
#   VOLUME: ▁▂▃▄▅▆▇ 100%    ||                                                                                                                                 #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
R='\e[1;31m' ; N='\e[0m' ; P='pacman' ; T='TotalDownload' ; MO='MODULES=' ; MK='/etc/mkinitcpio.conf' 
XV='xf86-video-' ; BC='btrfs su cr @' ; DV='name,size -e 7,11' ; lsblk -do ${DV} 
printf "${R}Device name: ${N}" ; read D ; sgdisk -Z -o -n 1::+512M -t 1:EF00 -n -i -v -p /dev/$D  
B="/dev/$D" ; D1="$(ls /dev/* | grep -E "^${B}p?1$")" ; D2="$(ls /dev/* | grep -E "^${B}p?2$")" 
mkfs.vfat "${D1}" ; mkfs.btrfs -fq "${D2}" ; MU='mount -o noatime,compress=zstd,discard=async,subvol=@'
mount "${D2}" /mnt ; cd /mnt ; ${BC} ; ${BC}home ; cd ; umount /mnt ; ${MU} "${D2}" /mnt  
mkdir /mnt/{boot,home} ; ${MU}home "${D2}" /mnt/home ; mount "${D1}" /mnt/boot
lsblk -o ${DV} ; if [[ "$(lscpu | grep -Eo "Intel" | sort -u)" == Intel ]]
then VGA="intel-ucode ${XV}intel" && sed -i 's/'${MO}'()/'${MO}'(i915 btrfs)/' ${MK} 
else VGA="amd-ucode ${XV}amdgpu" && sed -i 's/'${MO}'()/'${MO}'(amdgpu btrfs)/' ${MK} ; fi 
sed -i 's/#Color/Color/' /etc/${P}.conf ; sed -i 's/#{T}/{T}/' /etc/${P}.conf ; ${P}-key --init ; ${P}-key --populate archlinux >/dev/null
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/${P}.d/mirrorlist
curl -sL https://git.io/Jsde3 > install.sh ; cp install.sh /mnt/install.sh ; chmod +x /mnt/install.sh
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub-btrfs vim git ${VGA}
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
