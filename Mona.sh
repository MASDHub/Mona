#!/bin/bash
set -euo pipefail
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#    Mozart - Moonlight Sonata     #
#     0:35 ━❍──────── -5:32       #
#       ↻     ⊲  Ⅱ  ⊳     ↺        #
#    VOLUME: ▁▂▃▄▅▆▇ 100%       #
E=' -o noatime,compress=zstd,subvol=@'
F='btrfs su cr @';G='/etc/pacman.';H="
$(lscpu|egrep -o 'AMD|Intel'|sort -u)"
I='curl -s https://ipapi.co';setfont \
ter-124b;head -n 7 -- $0|tail -n 4;J='
/etc/mkinitcpio.conf';K='timedatectl '
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k |pacman-key --populate;printf '
%50s\n'|tr ' ' -;until lsblk -e 7,11 \
-do NAME,SIZE|egrep --color 'G|NAME'&&
read -p$'\e[31mEnter Installation-Disk
Name\e[0m: ' A&&Z="/dev/$A"&& sgdisk \
$Z -Z -n 1::+512M -t 1:EF00 -n -p;do :
done;lsblk -e 7,11|egrep --color '|/*'
B="$(ls /dev/*|egrep "^${Z}p?1$") "
C="$(ls /dev/*|egrep "^${Z}p?2$") "
mkfs.vfat ${B};mkfs.btrfs -fq ${C}
mount ${C}/mnt;cd /mnt;${F};${F}home
cd;umount /mnt;mount${E} ${C}/mnt
mkdir /mnt/{boot,home};mount ${B}/\
mnt/boot;mount${E}home ${C}/mnt/home
; if [[ $H == AMD ]]
then S='amd-ucode ' && Q='amdgpu '
else S='intel-ucode'&& Q='i915 '
fi;${K}set-timezone $(${I}/timezone)&&
${K}set-ntp true ; sed -i 's/#Co/Co/' \
${G}conf ; sed -i "s/ULES=(/ULES=(\
${Q}btrfs/" $J;reflector -p https \
--sort rate -c "$(${I}/country)" \
-a 12 -f 2 --save ${G}d/mirrorlist ||
reflector -p https --score 10 --sort \
rate -a 8 -f 2 --save ${G}d/mirrorlist
pacstrap -i /mnt base base-devel vim \
xorg linux linux xorg networkmanager \
linux-headers linux-firmware firefox \
alsa-utils efibootmgr linux-firmware \
linux-headers network-manager-applet \
pipewire-pulse lxqt-policykit geeqie \
nm-connection-editor nemo-fileroller \
gufw pipewire gvfs-mtp pipewire-alsa \
screengrab galculator git pkg-config \
alacritty rofi grub htop trayer sddm \
plank pipewire-jack nemo-preview vlc \
xterm volumeicon xlockmore obconf-qt \
pipewire-alsa otf-fira-mono libpulse \
xpad otf-fira-sans galculator arandr \
geany-plugins clipgrab conky-manager \
gst-plugin-pipewire nitrogen firefox-\
ublock-origin gvfs-afc xorg-xinit \
libreoffice-still ${S} ; cp ${G}conf \
/mnt${G}conf;curl -sL https://raw.git\
hubusercontent.com/djsharcode/Mona/ma\
in/install.sh -o /mnt/mtc/install.sh
echo zoneinfo/$(${I}/timezone) \
>/mnt/etc/T;cp ${J} /mnt${J}
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/instal.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
