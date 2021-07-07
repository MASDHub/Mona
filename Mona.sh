#!/bin/bash
#    Mozart - Moonlight Sonata     #
#     0:35 ━❍──────── -5:32      #
#      ↻     ⊲  Ⅱ  ⊳     ↺        #
#     VOLUME: ▁▂▃▄▅▆▇ 100%     #
E='-o noatime,compress=zstd,subvol=@'
F='btrfs su cr @';K='timedatectl set'
setfont ter-124n;G='/etc/pacman.';I='
curl -s https://ipapi.co';head -5 $0|
tail -4;H=$(lscpu|egrep -o 'AMD|Intel
'|sort -u) ; J='/etc/mkinitcpio.conf'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k|pacman-key --populate;printf '
%47s\n'|tr ' ' -;until lsblk -do NAM\
E,SIZE -e 7,11|grep --color '[A-Z]'&&
read -p$'\e[1;31mEnter Installation -
Disk\e[0m: ' A&&Z="/dev/$A"&&sgdisk \
$Z -Z -n 1::+512M -t 1:EF00 -n 2;do :
done;B="$(ls /dev/*|egrep "^${Z}p?1$"
) "; C="$(ls /dev/*|egrep "^${Z}p?2$"
) ";mkfs.vfat -c $B;mkfs.btrfs -fq $C
mount ${C} /mnt ; cd /mnt;${F}home;$F
cd; umount /mnt ; mount ${E} ${C}/mnt
mkdir /mnt/{boot,home};mount $B/mnt/\
boot;mount ${E}home $C/mnt/home;if [[
$H == Intel ]];then S='intel-ucode'&&
Q='i915 ';elif [[ $H == AMD ]];then \
Q='amdgpu '&&S='amd-ucode';fi;lsblk \
-pe 7,11|egrep --color /....;sed -i "
0,/()/s//(${Q}btrfs)/" ${J} ;sed -i '
s/#Co/Co/' ${G}conf ; ${K}-timezone \
"$(${I}/timezone)" && ${K}-ntp true
reflector -p https -a 8 --sort rate \
-c $(${I}/country) -f 2 --save ${G}d\
/mirrorlist||reflector --score 5 -p \
https -a 12 --sort rate --save ${G}d\
/mirrorlist ; pacstrap -i /mnt base \
base-devel xorg linux xorg pipewire \
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
vim conky-manager nitrogen gvfs-afc \
screengrab pipewire-alsa ${S};curl -\
s https://raw.githubusercontent.com/\
djsharcode/Mona/main/install.sh>/mnt\
/etc/install.sh;cp ${J} /mnt${J};cp \
${G}conf /mnt${G}conf;echo zoneinfo/\
$($I/timezone)>/mnt/etc/T;genfstab -\
U /mnt >>/mnt/etc/fstab;arch-chroot \
/mnt sh /etc/instal.sh
