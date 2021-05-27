#!/bin/bash  
set -euo pipefail 
setfont ter-120b 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Mozart - Moonlight Sonata  ||                                                                                           #
#  0:35 ━❍──────── -5:32                                                                                                 #
#   VOLUME: ▁▂▃▄▅▆▇ 100%     ||                                                                                           #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
lsblk -do name,size -e 7,11 ; LBL='\033[1;31m' ; NC='\033[0m'; printf "${LBL}Device name: ${NC}" ; read -r SDA
BT="/dev/$SDA" ; sgdisk -o -n 1::+512M -t 1:EF00 -n -i -p /dev/$SDA ; PB="$(ls /dev/* | grep -E "^${BT}p?1$")"
PR="$(ls /dev/* | grep -E "^${BT}p?2$")" ; mkfs.vfat "${PB}" ; mkfs.btrfs -fq "${PR}" ; mount "${PR}" /mnt ; cd /mnt 
BC="btrfs subvolume create @" ; ${BC} ; ${BC}home ; cd ; curl -sL https://git.io/Jsde3 -o install.sh
umount /mnt ; mount -o noatime,compress=zstd,discard=async,subvol=@ "${PR}" /mnt ; mkdir /mnt/{boot,home}
mount -o noatime,compress=zstd,discard=async,subvol=@home "${PR}" /mnt/home ; mount "${PB}" /mnt/boot
lsblk -o name,size,type,mountpoint -e 7,11 ; cp install.sh /mnt/install.sh ; chmod +x /mnt/install.sh
sed -i 's/#Color/Color/' /etc/pacman.conf  ; sed -i 's/#TotalDownload/TotalDownload/' /etc/pacman.conf
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/pacman.d/mirrorlist
gpg --list-keys ; pacman-key --init ; pacman-key --populate archlinux >/dev/null ; printf "${LBL}Enter to Accpet${NC}\n"
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware networkmanager efibootmgr grub-btrfs vim git 2>/dev/null 
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt ./install.sh 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
