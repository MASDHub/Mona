#!/bin/bash
set -euo pipefail
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#    Mozart - Moonlight Sonata    #
#     0:35 ━❍──────── -5:32  #
#       ↻     ⊲  Ⅱ  ⊳     ↺        #
#    VOLUME: ▁▂▃▄▅▆▇ 100%     #
E='o noatime,compress=zstd,subvol=@'
F='btrfs su cr @' ; G='/etc/pacman.'
I='curl -s https:/';setfont ter-124b
H="$( lscpu | grep -E 'AMD|Intel' )"
K='timedatectl set';head -n 8 -- $0|
tail -n 4 ; J='/etc/mkinitcpio.conf'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k|pacman-key --populate; printf '
%50s' |tr ' ' -;lsblk -do NAME,SIZE -\
e 7,11|egrep --color '|NAME';read -p \
$'\e[1;31mEnter Install Disk\e[0m: ' A
until Z="/dev/$A"&&sgdisk ${Z} -Z -n \
1::+512M -t 1:EF00 -n -p;do lsblk -e \
7,11 -do NAME|egrep --color '|NAME' &&
read -p $'\e[1;31mRetry\e[0m: ' A;done
B="$(ls /dev/* | egrep "^${Z}p?1$") "
C="$(ls /dev/* | egrep "^${Z}p?2$") "
mkfs.vfat ${B} ; mkfs.btrfs -fq${C}
mount ${C}/mnt ; cd /mnt;${F};${F}home
cd ;umount/mnt ; mount -${E} ;${C}/mnt
mkdir /mnt/{boot,home};mount${B}/mnt/\
boot; mount -${E}home ${C}/mnt/home
if [[ -n ${H} ]];then if [ $H == AMD ]
then S='amd-ucode ' && Q='amdgpu '
else S='intel-ucode'&& Q='i915 ';fi;fi
${K}-timezone $($I/ipapi.co/timezone)\
&&${K}-ntp true; lsblk -e 7,11 ; sed \
-i 's/#Co/Co/' ${G}conf ; sed -i "s/U\
LES=(/ULES=(${Q}btrfs/" $J:reflector \
-p https -c $(${I}/ipapi.co/country) \
--sort rate --save ${G}d/mirrorlist ||
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
gst-plugin-pipewire libreoffice-still\
 firefox-ublock-origin xorg-xinit gvf\
s-afc ${S} ; cp ${G}conf \
/mnt${G}conf;curl -sL https://raw.git\
hubusercontent.com/djsharcode/Mona/ma\
in/install.sh -o /mnt/mtc/install.sh
echo zoneinfo/$($I/ipapi.co/timezone)\
>/mnt/etc/T;cp ${J} /mnt${J}
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/instal.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
