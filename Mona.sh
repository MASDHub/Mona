#!/bin/bash
setfont ter-124b
head -n 8 -- "$0" | tail -n 5
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#        Mozart - Moonlight Sonata            #
#         0:35 ━❍──────── -5:32               #
#          ↻     ⊲  Ⅱ  ⊳     ↺                #
#         VOLUME: ▁▂▃▄▅▆▇ 100%                #
A='\e[1;31m' ; B='\e[0m' ; E='btrfs su cr @'  #
F='mount -o noatime,compress=zstd,subvol=@'   #
G="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)" #
J='etc/mkinitcpio.conf' ; K='etc/pacman.conf' #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --populate
lsblk  | egrep --color 'NAME|disk'
echo -en "${A}Enter Device to Install: ${B}"
read -r C ; until sgdisk /dev/${C} \
-Z -n 1::+512M -t 1:EF00 -n -i -v -p
do echo -en "${A}Try again: ${B}" && read C ; done
D1="$( ls /dev/* | grep -E "^/dev/${C}p?1$" )"
D2="$( ls /dev/* | grep -E "^/dev/${C}p?2$" )"
mkfs.vfat ${D1} ; mkfs.btrfs -fq ${D2}
mount ${D2} /mnt ; cd /mnt ; ${E}home
${E} ; cd ; umount /mnt ; ${F} ${D2} /mnt
mkdir /mnt/{boot,home} ; ${F}home ${D2} /mnt/home
mount ${D1} /mnt/boot ; lsblk | egrep --color 'disk|part'
if [[ ${G} == AMD ]] ; then H='amd-ucode' \
&& I='amdgpu ' ; fi ; if [[ ${G} == Intel ]]
then H='intel-ucode' && I='i915 ' ; fi
sed -i "s/ULES=()/ULES=(${I}btrfs)/" /${J} 
sed -i 's/#Co/Co/' /etc/pacman.conf /${K}
timedatectl set-ntp true | reflector -a 12 --score 10 -f 2 \
--save /etc/pacman.d/mirrorlist ; pacstrap -i /mnt \
base base-devel linux linux-headers linux-firmware \
networkmanager network-manager-applet vim gufw git \
nm-connection-editor efibootmgr grub trayer arandr \
xorg-xinit lxqt-policykit xlockmore xorg sddm htop \
pipewire pipewire-alsa pipewire-pulse libpulse vlc \
pipewire-jack alsa-utils gst-plugin-pipewire plank \
volumeicon nemo-fileroller nemo-preview screengrab \
lxappearance-obconf-gtk3 capitaine-cursors firefox \
firefox-ublock-origin libreoffice-still xterm rofi \
otf-fira-sans otf-fira-mono geeqie alacritty cmake \
pkg-config geany-plugins gvfs-mtp gvfs-afc galculator ${H}
cp -f /${J} /mnt/${J} ; cp -f /${K} /mnt/${K}
curl -sSL https://raw.githubusercontent.com/djSharcode/Mona/main/install.sh > /mnt/etc/install.sh
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
