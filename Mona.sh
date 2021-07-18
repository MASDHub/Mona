#!/bin/bash
E=' -o noatime,compress=zstd,subvol='
F='btrfs su cr ';setfont ter-124n;J="
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
cd /mnt;$F@home;$F@;cd;umount /mntmo\
unt$E@$D/mnt;mkdir /mnt/{boot,home}m\
ount$C/mnt/boot;mount$E@home$D/mnt/h\
ome;if [[ $J =  AMD ]];then L='amdgpu
'&&M=amd-ucode;fi;if [[ $J =  Intel ]]
then L='i915 '&&M='intel-ucode';fi
sed -i "0,/()/s//(${L}btrfs)/" $K
lsblk -pe 7,11|egrep --color /?;sed \
-i 's/#Co/Co/' $H.conf;$G-timezone $I
$G-ntp true;reflector -p https -a 8 \
--score 5 --sort rate --save $H.d/mi\
rrorlist;pacstrap -i /mnt base base-\
devel linux alacritty linux-headers \
linux-firmware lxqt-policykit xterm \
pipewire-pulse trayer pipewire-alsa \
efibootmgr xorg-xinit pipewire-jack \
xorg arandr plank grub nemo-preview \
firefox network-manager-applet gufw \
geeqie gst-plugin-pipewire libpulse \
firefox-ublock-origin otf-fira-mono \
otf-fira-sans libreoffice-still git \
nemo-fileroller sddm xpad xlockmore \
galculator pkg-config rofi clipgrab \
nitrogen pipewire conky-manager vim \
gvfs-afc obconf-qt pavucontrol htop \
alsa-utils volumeicon geany-plugins \
gvfs-mtp vlc $M;curl -s https://raw.\
githubusercontent.com/djsharcode/Mon\
a/main/install.sh>/mnt/s;cp $K /mnt$K
echo usr/share/zoneinfo/$I>/mnt/etc/T
cp $H.conf /mnt$H.conf;genfstab -U /\
mnt>/mnt/etc/fstab;arch-chroot /mnt \
sh s
