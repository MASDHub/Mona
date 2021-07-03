#!/bin/bash
set -euo pipefail
setfont ter-124b; head -n 8 -- $0|tail -n 4
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
    #     Mozart - Moonlight Sonata    #
 #         0:35 ━❍──────── -5:32       #
   #         ↻     ⊲  Ⅱ  ⊳     ↺       #
#         VOLUME: ▁▂▃▄▅▆▇ 100%       #
E='mount -o noatime,compress=zstd,subvol=@'
F='btrfs su cr @'; G='timedatectl set'
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
\e[1;31mRe-try\e[0m: ' A; done
B="$(ls /dev/*|egrep "^/dev/${A}p?1$") "
C="$(ls /dev/*|egrep "^/dev/${A}p?2$") "
mkfs.vfat ${B};mkfs.btrfs -fq ${C}
mount ${C}/mnt;cd /mnt
${F}; ${F}home;cd;umount /mnt
${E} ${C}/mnt ;mkdir /mnt/{boot,home}
${E}home ${C}/mnt/home;lsblk -ne 7,11
mount ${B}/mnt/boot;if [ "${H}" == AMD ]
then H2='amd-ucode' && H1='amdgpu ' ; fi
if [ "${H}" == Intel ];then H1='i915 '&&\
H2='intel-ucode'; fi; ${G}-timezone${T}&&\
${G}-ntp true;sed -i 's/#Co/Co/' ${J}conf
sed -i "s/ULES=()/ULES=(${H1}btrfs)/"${I}
reflector -p https -c \
"$(curl -s https://ipapi.co/country)" -a 12 \
-f 2 --sort rate --save ${J}d/mirrorlist || \
reflector -p https -a 8 --score 5 --verbose \
--sort rate --isos --save ${J}d/mirrorlist
pacstrap -i /mnt base base-devel linux xorg \
linux-headers linux-firmware efibootmgr vim \
networkmanager rofi gufw htop obconf-qt git \
network-manager-applet nm-connection-editor \
pipewire pipewire-alsa pipewire-pulse plank \
pipewire-jack alsa-utils lxqt-policykit vlc \
gst-plugin-pipewire gvfs-afc gvfs-mtp xterm \
nemo-preview nemo-fileroller alacritty grub \
firefox firefox-ublock-origin geany-plugins \
libreoffice-still otf-fira-mono trayer sddm \
pkg-config otf-fira-sans xlockmore libpulse \
volumeicon screengrab galculator xorg-xinit \
arandr geeqie clipgrab conky-manager xpad ${H2}
curl -sSL https://raw.githubusercontent.com/\
djsharcode/Mona/main/install.sh -o /mnt/etc/\
install.sh ; cp ${I} /mnt${I}
cp ${J}conf /mnt${J}conf
echo "zoneinfo/$T" >/mnt/etc/T
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
