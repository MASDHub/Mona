#!/bin/bash
E='-o noatime,compress=zstd,subvol=@'
F='btrfs su cr @';G='timedatectl set'
setfont ter-124n;H='/etc/pacman.';I='
curl -s https://ipapi.co';J="$(lscpu|
egrep -o 'AMD|Intel' | sort -u )";K='
/etc/mkinitcpio.conf' #~~~~~~~~~~~~~#
gpg -k|pacman-key --populate;printf '
%46s\n'|tr ' ' -;until lsblk -do NAM\
E,SIZE -e 7,11|grep --color '[A-Z]'&&
read -p$'\e[1;31mEnter Installation -
Disk\e[0m: ' A&&B="/dev/$A"&&sgdisk \
$B -Z -n 1::+512M -t 1:EF00 -n 2;do :
done;C="$(ls /dev/*|egrep "^${B}p?1$"
) "; D="$(ls /dev/*|egrep "^${B}p?2$"
) ";mkfs.vfat -c $C;mkfs.btrfs -fq $D
mount ${D} /mnt;cd /mnt;${F}home;${F}
cd ; umount /mnt;mount ${E} ${D}/mnt
mkdir /mnt/{boot,home};mount $C/mnt/\
boot;mount ${E}home $D/mnt/home;if [[
$J == Intel ]];then M='intel-ucode'&&
L='i915 ';elif [[ $J == AMD ]];then \
L='amdgpu '&&M='amd-ucode';fi;lsblk \
-pe 7,11|egrep --color /....;sed -i "
0,/()/s//(${L}btrfs)/" ${K} ;sed -i '
s/#Co/Co/' ${H}conf ; ${G}-timezone \
"$($I/timezone)"&&${G}-ntp true;refl\
ector -p https -a 12 --sort rate -c \
$($I/country) --save ${H}d/mirrorlis\
t|| reflector --score 5 -p https -a \
8 --sort rate --save ${H}d/mirrorlist
pacstrap -i /mnt base vim grub xorg \
base-devel linux pipewire alacritty \
efibootmgr xorg-xinit linux-headers \
plank linux-firmware lxqt-policykit \
pipewire-alsa trayer alsa-utils vlc \
firefox network-manager-applet gufw \
geeqie gst-plugin-pipewire libpulse \
firefox-ublock-origin otf-fira-mono \
otf-fira-sans libreoffice-still git \
nemo-fileroller sddm xpad xlockmore \
galculator pkg-config rofi clipgrab \
htop pipewire-jack volumeicon xterm \
nemo-preview gvfs-mtp geany-plugins \
pipewire-pulse screengrab obconf-qt \
gvfs-afc nitrogen conky-manager aran\
dr ${M};curl -sL https://raw.githubu\
sercontent.com/djsharcode/Mona/main/\
install.sh>/mnt/etc/instal.sh;echo /\
share/zoneinfo/$($I/timezone)>>/mnt/\
etc/TMZ;cp $K /mnt${K};cp ${H}conf /\
mnt${H}conf;genfstab -U /mnt >>/mnt/\
etc/fstab; arch-chroot /mnt sh /etc/\
install.sh
