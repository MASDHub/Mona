#!/bin/bash
set -euo pipefail
 #8'         8888
#d8.-=. ,==-.:888b
#>8 `~` :`~' d8888
#88         ,88888
#88b. `-~  ':88888
#888b ~==~ .:88888
#88888o--:':::8888
#`88888| :::' 8888b
#8888^^'       8888b
#d888           ,%888b.
#d88%            %%%8--'-.
#/88:.__ ,       _%-' ---  -
 #  '''::===..-'   =  --.  `
head -n 15 -- $0|tail -n 13 ; S='       '
A='\e[1;31m' ; B='\e[0m' ; C='/usr/share'
D='Cantarell 11/Fira Sans Condensed Book'
E='Adwaita/Oranchelo'; F='systemctl enable'
Z='             localhost' #~~~~~~~~~~~~#
printf "${A}User Name: ${B}"; read -r R \
&& U="${R,,}" ; until [[ ${#U} -gt 4 ]] \
&& [[ "${U}" =~ ^[a-z]*$ ]] ; do printf \
"${A}Retry: ${B}" && read R && U="${R,,}"
done ; useradd -m -G wheel ${U} ; echo -\
e "${A}Enter User Password${B}" ; until \
passwd  "${U}" ; do echo ; done ; echo -\
e "Enter ${A}Root${B} Password" ; until \
passwd; do : ; done; P="${U}pc" ; echo -\
e "127.0.0.1${S}localhost\n::1${Z}\n127.\
0.1.1${S}$P.localdomain $P" > /etc/hosts
sed -i 's/#en_US.U/en_US.U/' /etc/locale.gen
ln -sf "${C}/$(cat /etc/T)" /etc/localtime
sed -i '0,/# %/ s/# %/ %/' /etc/sudoers
locale-gen ; echo ${U} >> /etc/U; sed -i \
's/auto/1920x1080,auto/' /etc/default/grub
echo 'openbox-session' >/home/${U}/.xinitrc
echo LANG=en_US.UTF-8 >/etc/locale.conf; hwcloc\
k --systohc; echo $P >/etc/hostname; echo \
-e 'M="$(find /home/*/.screenlayout/*.sh)"
N="$(xrandr|egrep -o '"'HDMI-1|HDMI1'"')"
O="$(xrandr|egrep -o '"'eDP1|eDP-1'"')"
P="$(xrandr|egrep -c '"'HDMI|eDP'"')"
if [ -r "${M}" ] && $(grep -q xrandr ${M})
then ${M} ; else if [[ "${P}" -ge "2" ]]
then xrandr --output $O --off --output $N \
--auto; fi; fi' > ${C}/sddm/scripts/Xsetup
sed -i -e "2 s/${E}-Beka/" -e "s/${D}/" -\
e "3 s/${E}/" ${C}/gtk-3.0/settings.ini
sed -i -e "1 s/${E}-Beka/" -e "s/${D}/" -\
e "2 s/${E}/" ${C}/gtk-2.0/gtkrc; sed -i \
's/twm/openbox-session/' /etc/X11/xinit/xinitrc
echo -e "${A}NETWORKS${B}"; ${F} NetworkManager
echo -e "${A}ENABLE DISPLAY${B}"; ${F} sddm
echo -e "${A}GRUB-2${B}" ; grub-install --\
target=x86_64-efi --efi-directory=/boot --\
bootloader-id=GRUB; grub-mkconfig > /boot/\
grub/grub.cfg; curl -sL https://raw.github\
usercontent.com/djSharcode/Mona/main/insta\
llMo.sh > /home/${U}/installMO.sh ; cd /
chown root:root /home ; chmod 755 /home
runuser --login ${U} --session-command \
"sh ~/installMO.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
