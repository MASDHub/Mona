#!/bin/bash
set -euo pipefail
setfont ter-124b; head -n 8 -- $0|tail -n 4
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
    #     Mozart - Moonlight Sonata    #
 #         0:35 ━❍──────── -5:32       #
   #         ↻     ⊲  Ⅱ  ⊳     ↺       #
#         VOLUME: ▁▂▃▄▅▆▇ 100%       #
E='mount -o noatime,compress=zstd,subvol=@'
F='btrfs su cr @'; G='timedatectl set-'
H="$(lscpu|egrep -o 'AMD|Intel'|sort -u)"
I='/etc/mkinitcpio.conf'; J='/etc/pacman.'
T=" $(curl -sSL https://ipapi.co/timezone)"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k|pacman-key --populate;printf '%50s
'|tr ' ' -;lsblk -do NAME,SIZE -e 7,11 |
egrep --color '|NAME';read -p $'\e[1;31m
Enter Disk Name\e[0m: ' A; until sgdisk \
/dev/$A -Z -n 1::+512M -t 1:EF00 -n -p
do lsblk -e 7,11 -o NAME,SIZE&&read -p $'
\e[1;31mRe-try\e[0m: ' A ; done
B="$(ls /dev/*|egrep "^/dev/${A}p?1$") "
C="$(ls /dev/*|egrep "^/dev/${A}p?2$") "
mkfs.vfat ${B};mkfs.btrfs -fq ${C}
mount ${C}/mnt;cd /mnt;${F} ;${F}home
cd; umount/mnt;${E} ${C}/mnt;mkdir /m\
nt/{boot,home};${E}home ${C}/mnt/home
mount ${B}/mnt/boot ;lsblk -ne 7,11
if [ "${H}" == AMD ];then H1='amdgpu '&&
H2='amd-ucode'; elif [ "${H}" == Intel ]
then H1='i915 ' &&H2='intel-ucode'; fi
${G}timezone${T}&&${G}ntp true;sed -\
i "s/ULES=()/ULES=(${H1}btrfs)/" ${I}
sed -i 's/#Co/Co/' ${J}conf;reflector -c \
"$(curl -s https://ipapi.co/country)" -p \
https --sort rate --save ${J}d/mirrorlist||
reflector -p https --score 5 --sort rate \
-a 4 --save ${J}d/mirrorlist;pacstrap -i \
/mnt base base-devel linux xorg grub vim \
efibootmgr obconf-qt networkmanager rofi \
linux-headers linux-firmware htop trayer \
gufw alacritty alsa-utils lxqt-policykit \
pipewire gvfs-mtp network-manager-applet \
nm-connection-editor pipewire-alsa plank \
pipewire-jack pipewire-alsa nemo-preview \
pipewire-pulse gst-plugin-pipewire xterm \
firefox-ublock-origin geany-plugins sddm \
libreoffice-still otf-fira-mono vlc git \
pkg-config otf-fira-sans xlockmore 
libpulse gvfs-afc nemo-fileroller 
firefox \
volumeicon screengrab galculator
 xorg-xinit \
arandr geeqie clipgrab conky-manager 
xpad ${H2}
curl -sSL https://raw.githubusercontent.
com/\
djsharcode/Mona/main/install.sh -o 
/mnt/etc/\
install.sh ; cp ${I} /mnt${I}
cp ${J}conf /mnt${J}conf
echo "zoneinfo/$T" >/mnt/etc/T
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
