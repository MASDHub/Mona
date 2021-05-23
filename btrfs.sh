#!/bin/bash  
set -euo pipefail 
setfont ter-122n 
# 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#                       ||                                                                         Mozart - Moonlight Sonata   #
#                       ||                                                                           0:35 ━❍──────── -5:32    #
#                       ||                                                                            ↻     ⊲  Ⅱ  ⊳     ↺     #
#                       ||                                                                            VOLUME: ▁▂▃▄▅▆▇ 100%   #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
lsblk -o name,size -e 7,11 ; read -r -p "Device Name: ? " sda ; wipefs -aq /dev/$sda ; BT="/dev/$sda"
sgdisk -o -n 1::+512M -t 1:EF00 -n -i -p /dev/$sda ; PB="$(ls /dev/* | grep -E "^${BT}p?1$")" ; PR="$(ls /dev/* | grep -E "^${BT}p?2$")"
mkfs.vfat "${PB}" ; mkfs.btrfs -fq "${PR}" ; mount "${PR}" /mnt ; cd /mnt ; btrfs subvolume create @ ; btrfs subvolume create @home                          
cd  ; umount /mnt ; mount -o noatime,compress=zstd,discard=async,subvol=@ "${PR}" /mnt ; mkdir /mnt/{boot,home}          
mount -o noatime,compress=zstd,discard=async,subvol=@home "${PR}" /mnt/home ; mount "${PB}" /mnt/boot 
curl -sL https://git.io/Jsde3 -o install.sh ; chmod +x install.sh ; ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
