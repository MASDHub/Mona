#!/bin/bash
set -euo pipefail
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#    Mozart - Moonlight Sonata    #
#     0:35 ━❍──────── -5:32       #
#       ↻     ⊲  Ⅱ  ⊳     ↺       #
#    VOLUME: ▁▂▃▄▅▆▇ 100%         #
E='-o noatime,compress=zstd,subvol=@'
F='btrfs su cr @';K='timedatectl set'
I='curl -s https://ipapi';H="$(lscpu|
egrep -o 'AMD|Intel'|sort -u)";head \
-n 7 -- $0|tail -n 4;G='/etc/pacman.'
J='/etc/mkinitcpio.conf';setfont ter\
-124b #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k|pacman-key --populate;printf '
%47s\n'|tr ' ' -;until lsblk -do NAM\
E,SIZE -e 7,11|grep --color '[A-Z]'&&
read -p$'\e[1;31mEnter Installation -
Disk\e[0m: ' A&&Z="/dev/$A"&&sgdisk \
$Z -Z -n 1::+512M -t 1:EF00 -n 2;do :
done;lsblk -pe 7,11|egrep --color ?/*
B="$( ls /dev/*|egrep "^${Z}p?1$" ) "
C="$( ls /dev/*|egrep "^${Z}p?2$" ) "
mkfs.vfat ${B} ;mkfs.btrfs -fq ${C}
mount ${C}/mnt ;cd /mnt;${F}home;${F}
cd;umount /mnt ;mount ${E} ${C}/mnt
mkdir /mnt/{boot,home};mount $B/mnt/\
boot;mount ${E}home $C/mnt/home;if [[
"$H" == Intel ]];then Q='i915 ' &&S='
intel-ucode';else S='amd-ucode' &&Q='
amdgpu ';fi;sed -i 's/#Co/Co/' ${G}c\
cnf;sed -i "0,/()/s//(${Q}btrfs)/" $J
${K}-timezone "$(${I}.co/timezone)"&&
${K}-ntp true;reflector -p https -c \
$($I.co/country) --sort rate --save \
${G}d/mirrorlist||reflector --score \
5 -p https -a 12 --sort rate --save \
${G}d/mirrorlist ; pacstrap -i /mnt \
base base-devel xorg linux xorg vim \
efibootmgr xorg-xinit linux-headers \
linux-headers arandr linux-firmware \
pipewire-alsa trayer alsa-utils vlc \
firefox network-manager-applet gufw \
pipewire-pulse lxqt-policykit plank \
geeqie gst-plugin-pipewire libpulse \
firefox-ublock-origin otf-fira-mono \
otf-fira-sans libreoffice-still git \
alacritty grub nemo-fileroller sddm \
galculator pkg-config rofi clipgrab \
htop pipewire-jack volumeicon xterm \
nemo-preview gvfs-mtp geany-plugins \
xlockmore xpad galculator obconf-qt \
conky-manager pipewire-alsa screengr\
ab gvfs-afc nitrogen pipewire ${S} 
cp ${G}conf /mnt${G}conf;curl -s htt\
ps://raw.githubusercontent.com/djsha\
rcode/Mona/main/install.sh -o /mnt/e\
tc/install.sh;cp ${J} /mnt${J};echo \
zoneinfo/$($I.co/timezone)>/mnt/etc/T
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/instal.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
