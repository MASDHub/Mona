#!/bin/bash
E=' -o noatime,compress=zstd,subvol='
F='btrfs su cr ';H='/etc/pacman';J=$(
lscpu |egrep -o 'AMD|Intel' |sort -u)
K='/etc/mkinitcpio.conf';setfont ter\
-124n;I='curl -sSL https://ipapi.co'
G='timedatectl set' #~~~~~~~~~~~~~~~#
gpg -k|pacman-key --populate;printf '
%9s\n'|tr ' ' -;until lsblk -do NAME\
,SIZE -e 7,11|grep --color [A-Z]&&re\
ad -p$'\e[1;31mEnter Installion CD\e[
0m> ' A&&B="/dev/$A"&&sgdisk $B -Z -\
n 1::+512M -t 1:EF00 -n -i -v -p;do :
done;C="$(ls /dev/*|egrep "^${B}p?1$"
) "; D="$(ls /dev/*|egrep "^${B}p?2$"
) ";mkfs.vfat -c $C;mkfs.btrfs -fq $D
mount $D/mnt;cd /mnt;$F@home;$F@;cd
mount /mnt;mount$E $D/mnt;mkdir /mnt\
/{boot,home};mount $C/mnt/boot;mount\
$E@home $D/mnt/home;if [[ $J == Intel
]];then M='intel-ucode'&&L='i915 ';fi
if [[ $J == AMD ]];then L='amdgpu '&&
M='amd-ucode';fi;lsblk -e 7,11|grep \
--color /....;sed -i 's/#Co/Co/' $H.\
conf;sed -i "0,/(/s//(${L}btrfs/" $K
$G-timezone $($I/timezone)&&$G-ntp t\
rue;reflector -p https score 5 -a 5 \
--sort rate --save $H.d/mirrorlist;p\
acstrap -i /mnt base base-devel vim \
linux linux-firmware lxqt-policykit \
base-devel xterm pipewire alacritty \
efibootmgr xorg-xinit linux-headers \
xorg arandr plank grub nemo-preview \
pipewire-alsa trayer alsa-utils vlc \
firefox network-manager-applet gufw \
geeqie gst-plugin-pipewire libpulse \
firefox-ublock-origin otf-fira-mono \
otf-fira-sans libreoffice-still git \
nemo-fileroller sddm xpad xlockmore \
galculator pkg-config rofi clipgrab \
conky-manager volumeicon screengrab \
gvfs-afc obconf-qt pipewire-pulse \
nitrogen pipewire-jack gvfs-mtp htop \
geany-plugins \
 ${M};curl \
-sSL https://raw.githubusercontent.c\
om/djsharcode/Mona/main/install.sh>/\
mnt/etc/install.sh;cp $K /mnt$K;cp $\
H.conf /mnt$H.conf;echo share/zonein\
fo/$($I/timezone)>/mnt/etc/TM;genfst\
ab -U /mnt>>/mnt/etc/fstab;arch-chro\
ot /mnt sh /etc/install.sh
