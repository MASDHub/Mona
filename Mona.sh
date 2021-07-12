#!/bin/bash
E=' -o noatime,compress=zstd,subvol='
F='btrfs su cr ';H='/etc/pacman';J=$(
lscpu |egrep -o 'AMD|Intel'| sort -u)
I=$(curl -s https://ipapi.co/timezone
);G='timedatectl set';setfont ter-12\
4n;K='/etc/mkinitcpio.conf' #~~~~~~~#
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
-color /?;$G-timezone $I&&$G-ntp true
sed -i "0,/()/s//(${L}btrfs)/" $K;re\
flector -p https --score 5 --sort ra\
te -a 2 --save $H.d/mirrorlist;sed -i \
's/#Co/Co/' $H.conf;pacstrap -i /mnt \
base base-devel linux-headers linux \
linux-firmware screengrab alacritty \
lxqt-policykit pipewire-pulse xterm \
efibootmgr xorg-xinit pipewire-jack \
xorg arandr plank grub nemo-preview \
pipewire-alsa trayer alsa-utils vlc \
firefox network-manager-applet gufw \
geeqie gst-plugin-pipewire libpulse \
firefox-ublock-origin otf-fira-mono \
otf-fira-sans libreoffice-still git \
nemo-fileroller sddm xpad xlockmore \
galculator pkg-config rofi clipgrab \
nitrogen pipewire conky-manager vim \
gvfs-afc obconf-qt pavucontrol htop \
geany-plugins gvfs-mtp volumeicon $M
curl -s https://raw.githubuserconten\
t.com/djsharcode/Mona/main/install.s\
h>/mnt/etc/.sh;cp $H.conf /mnt$H.conf
echo usr/share/zoneinfo/$I>/mnt/etc/T
cp $K /mnt$K;genfstab -U /mnt>>/mnt/\
etc/fstab;arch-chroot /mntsh /etc/.sh
