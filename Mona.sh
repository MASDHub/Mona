#!/bin/bash
#    Mozart - Moonlight Sonata     #
#     0:35 ━❍──────── -5:32      #
#      ↻     ⊲  Ⅱ  ⊳     ↺        #
#     VOLUME: ▁▂▃▄▅▆▇ 100%     #
E='-o noatime,compress=zstd,subvol=@'
F='btrfs su cr @';G='timedatectl set'
setfont ter-124n;H='/etc/pacman.';I='
curl -s https://ipapi.co';head -5 $0|
tail -4;J=$(lscpu|egrep -o 'AMD|Intel
'|sort -u) ; K='/etc/mkinitcpio.conf'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k|pacman-key --populate;printf '
%46s\n'|tr ' ' -;until lsblk -do NAM\
E,SIZE -e 7,11|grep --color '[A-Z]'&&
read -p$'\e[1;31mEnter Installation -
Disk\e[0m: ' D&&Z="/dev/$A"&&sgdisk \
$Z -Z -n 1::+512M -t 1:EF00 -n 2;do :
done;B="$(ls /dev/*|egrep "^${D}p?1$"
) "; C="$(ls /dev/*|egrep "^${D}p?2$"
) ";mkfs.vfat -c $B;mkfs.btrfs -fq $C
mount ${C} /mnt ; cd /mnt;${F}home;$F
cd; umount /mnt ; mount ${E} ${C}/mnt
mkdir /mnt/{boot,home};mount $B/mnt/\
boot;mount ${E}home $C/mnt/home;if [[
$J == Intel ]];then M='intel-ucode'&&
L='i915 ';elif [[ $J == AMD ]];then \
L='amdgpu '&&M='amd-ucode';fi;lsblk \
-pe 7,11|egrep --color /....;sed -i "
0,/()/s//(${L}btrfs)/" ${K} ;sed -i '
s/#Co/Co/' ${H}conf ; ${G}-timezone \
"$(${I}/timezone)" && ${G}-ntp true
reflector -p https -a 8 --sort rate \
-c $(${I}/country) -f 2 --save ${H}d\
/mirrorlist||reflector --score 5 -p \
https -a 12 --sort rate --save ${H}d\
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
screengrab pipewire-alsa ${M};curl -\
s https://raw.githubusercontent.com/\
djsharcode/Mona/main/install.sh>/mnt\
/etc/install.sh;cp ${K} /mnt${K};cp \
${H}conf /mnt${H}conf;echo zoneinfo/\
$($I/timezone) > /mnt/etc/TZ;genfsta\
b -U /mnt >> /mnt/etc/fstab ;arch-ch\
root /mnt sh /etc/instal.sh
