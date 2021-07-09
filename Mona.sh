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
Disk\e[0m: ' A&&D="/dev/$A"&&sgdisk \
$D -Z -n 1::+512M -t 1:EF00 -n 2;do :
done;B="$(ls /dev/*|egrep "^${D}p?1$"
) "; C="$(ls /dev/*|egrep "^${D}p?2$"
) ";mkfs.vfat -c $B;mkfs.btrfs -fq $C
mount ${C} /mnt;cd /mnt;${F}home;${F}
cd; umount /mnt;mount ${E} ${C} /mnt
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
base-devel xorg linux pipewire grub \
efibootmgr xorg-xinit linux-headers \
plank linux-firmware lxqt-policykit \
pipewire-alsa trayer alsa-utils vlc \
firefox network-manager-applet gufw \
geeqie gst-plugin-pipewire libpulse \
firefox-ublock-origin otf-fira-mono \
otf-fira-sans libreoffice-still git \
alacritty nemo-fileroller sddm xpad \
galculator pkg-config rofi clipgrab \
htop pipewire-jack volumeicon xterm \
nemo-preview gvfs-mtp geany-plugins \
conky-manager screengrab arandr vim \
gvfs-afc nitrogen xlockmore pipewire\
-pulse obconf-qt ${M};curl -sL https\
://raw.githubusercontent.com/djsharc\
ode/Mona/main/install.sh>/mnt/etc/in\
stall.sh;cp $K /mnt$K;echo share/zon\
einfo/$($I/timezone)>/mnt/etc/TZ;cp \
${H}conf /mnt${H}conf;genfstab -U /m\
nt>>/mnt/etc/fstab;arch-chroot /mnt \
sh /etc/install.sh
