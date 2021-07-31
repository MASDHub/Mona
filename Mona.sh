#!/bin/bash
E=' -o noatime,compress=zstd,subvol='
F='btrfs su cr';setfont ter-124n;J="\
`lscpu|egrep -o 'AMD|Intel'|sort -u`"
K=/etc/mkinitcpio.conf;H=/etc/pacman
I=`curl -s https://ipapi.co/timezone`
G='timedatectl set' #~~~~~~~~~~~~~~~#
gpg -k|pacman-key --populate;printf '
%9s\n'|tr ' ' -;until lsblk -do NAME\
,SIZE -e 7,11|grep --color [A-Z]&&re\
ad -p$'\e[1;31mInstallion Disk Name\e
[0m→' A&&B=/dev/$A&&sgdisk $B -Z -n \
1::+512M -t 1:EF00 -n 2;do :;done;C=" 
`ls /dev/*|egrep "^${B}p?1$"` ";D=" \
$(ls /dev/*|egrep "^${B}p?2$") ";mkf\
s.vfat$C;mkfs.btrfs -fq$D;mount$D/mnt
cd /mnt;$F @home;$F @;cd;umount /mnt
mount$E@$D/mnt;mkdir /mnt/{boot,home}
mount$C/mnt/boot;mount$E@home$D/mnt/\
home;lsblk -pe 7,11|egrep --color /?
$G-timezone $I&&$G-ntp true;sed -i '
s/#Co/Co/' $H.conf;reflector --sort \
rate -p https --score 6 --save $H.d/\
mirrorlist;pacstrap -i /mnt vim git \
base base-devel linux linux-headers \
linux-firmware lxqt-policykit xterm \
pipewire-pulse trayer pipewire-alsa \
efibootmgr xorg-xinit pipewire-jack \
grub plank nemo-preview pavucontrol \
firefox network-manager-applet gufw \
gst-plugin-pipewire nemo-fileroller \
firefox-ublock-origin otf-fira-mono \
otf-fira-sans libreoffice-still git \
sddm xpad xlockmore galculator rofi \
libpulse conky-manager pipewire vim \
pkg-config alacritty volumeicon vlc \
obconf-qt arandr xorg htop nitrogen \
alsa-utils gvfs-afc geeqie gvfs-mtp \
geany-plugins htop telegram-desktop
curl -s https://raw.githubuserconten\
t.com/djsharcode/Mona/main/install.s\
h>/mnt/s;cp $K /mnt$K;echo usr/share\
/zoneinfo/$I>/mnt/T;genfstab -U /mnt\
>/mnt/etc/fstab;arch-chroot /mnt sh s
