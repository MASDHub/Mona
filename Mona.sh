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
home;if [[ $J = AMD ]];then L='amdgpu
'&&M=amd-ucode;fi;if [[ $J = Intel ]]
then L='i915 '&&M=intel-ucode;fi;lsb\
lk -pe 7,11|egrep --color /?;sed -i '
s/#Co/Co/' $H.conf;sed -i "0,/()/s//\
(${L}btrfs)/" $K;$G-timezone $I&&$G-\
ntp true;reflector -p https --score \
6 -a 12 --sort rate --save $H.d/mirr\
orlist;pacstrap -i /mnt base arandr \
base-devel linux linux-headers grub \
linux-firmware lxqt-policykit xterm \
pipewire-pulse trayer pipewire-alsa \
efibootmgr xorg-xinit pipewire-jack \
xorg plank nemo-preview pavucontrol \
firefox network-manager-applet gufw \
geeqie gst-plugin-pipewire libpulse \
firefox-ublock-origin otf-fira-mono \
otf-fira-sans libreoffice-still git \
nemo-fileroller sddm xpad xlockmore \
galculator pkg-config vim alacritty \
nitrogen pipewire conky-manager vlc \
alsa-utils volumeicon geany-plugins \
obconf-qt gvfs-mtp gvfs-afc htop rof\
i $M;curl -s https://raw.githubuserc\
ontent.com/djsharcode/Mona/main/inst\
all.sh>/mnt/s;cp $H.conf /mnt$H.conf
echo usr/share/zoneinfo/$I>/mnt/etc/T
cp $K /mnt$K;genfstab -U /mnt>/mnt/e\
tc/fstab;arch-chroot /mnt sh s
