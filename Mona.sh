#!/bin/bash
E=' -o noatime,compress=zstd,subvol='
F='btrfs su cr ';H='/etc/pacman';J=$(
lscpu | egrep -o 'AMD|Intel'|sort -u)
I='curl -s https://ipapi.co/timezone'
K='/etc/mkinitcpio.conf'setfont ter-\
124n;G='timedatectl set' #~~~~~~~~~~#
gpg -k|pacman-key --populate;printf '
%9s\n'|tr ' ' -;until lsblk -do NAME\
,SIZE -e 7,11|grep --color [A-Z]&&re\
ad -p$'\e[1;31mEnter Installion CD\e[
0m> ' A&&B="/dev/$A"&&sgdisk $B -Z -\
n 1::+512M -t 1:EF00 -n -i -v -p;do :
done;C="$(ls /dev/*|egrep "^${B}p?1$"
) ";D=" $(ls /dev/*|egrep "^${B}p?2$"
) ";mkfs.vfat $C;mkfs.btrfs -fq$D;mo\
unt$D/mnt;cd /mnt;$F@home;$F@;cd;umo\
unt /mnt;mount$E@$D/mnt;mkdir /mnt/{\
boot,home};mount $C/mnt/boot;mount$E\
@home$D/mnt/home;if [[ $J == Intel ]]
then M='intel-ucode'&&L='i915 ';fi;if
[[ $J == AMD ]];then L='amdgpu '&&M='
amd-ucode';fi;lsblk -pe 7,11|egrep -\
-color /?;sed -i 's/#Co/Co/' $H.conf
G-timezone $($I)&&$G-ntp true;sed -i "0,/(/s//(${L}btrfs/" $K;$
reflector -p https --sort rate \
--score 5 -a 5 --save $H.d/mirrorlist

pacstrap -i /mnt base linux-headers \
linux linux-firmware lxqt-policykit \
base-devel xterm pipewire alacritty \
efibootmgr xorg-xinit pipewire-jack \
xorg arandr plank grub nemo-preview \
pipewire-alsa trayer alsa-utils vlc \
firefox network-manager-applet gufw \
geeqie gst-plugin-pipewire libpulse \
firefox-ublock-origin otf-fira-mono \
otf-fira-sans libreoffice-still git \
nemo-fileroller sddm xpad xlockmore \
galculator pkg-config rofi clipgrab \
conky-manager volumeicon screengrab \
gvfs-afc obconf-qt pavucontrol htop \
geany-plugins nitrogen gvfs-mtp vim \
pipewire-pulse ${M};curl -sSL https:\
//raw.githubusercontent.com/djsharco\
de/Mona/main/install.sh>/mnt/etc/i.sh
cp $H.conf /mnt$H.conf;cp $K /mnt$K
echo share/zoneinfo/$($I/timezone)>/\
mnt/etc/TM;genfstab -U /mnt>>/mnt/et\
c/fstab;arch-chroot /mnt sh /etc/i.sh
