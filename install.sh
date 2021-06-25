#!/bin/bash
set -euo pipefail
head -n 16 -- "$0" | tail -n 13
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
Z='       ' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='\e[1;31m' ; B='\e[0m' ; E='usr/share'
D='Cantarell 11/Fira Sans Condensed Book'
C='Adwaita/Oranchelo' ; F='systemctl enable'
S='             ' #~~~~~~~~~~~~~~~~~~~~~~~~~#
echo -en "\n${A}User Name: ${B}"
read -r R; until [[ ${#U} -gt 4 ]] && \
[[ "${U}" =~ ^[a-z]*$ ]] ; do read -r \
-p 'Try Again : ' R && U="${R,,}"
done ; useradd -m -G wheel "${U}"
echo -e "${A}User Password: ${B}"
until passwd ${U}; do echo; done
echo -e "${A}Root${B} Password:"
until passwd ; do echo ; done
sed -i '0,/# %/ s/# %/ %/' /etc/sudoers
sed -i 's/#en_US./en_US./' /etc/locale.gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
P="${U}pc1" ; echo ${P} >> /etc/hostname
locale-gen; echo home/$U > /etc/U ; echo \
-e "127.0.0.1${Z}localhost\n::1${S}localhost
127.0.1.1${Z}$P.localdomain $P" > /etc/hosts
X="$(cat /etc/U)/.xinitrc" ; ln -sf \
/usr/share/zoneinfo/"$(cat /etc/T)" \
/etc/localtime ; hwclock --systohc
cp /etc/X11/xinit/xinitrc /${X}
sed -i 's/twm/openbox-session/' \
/${X}; sed -i -e "3 s/$C/" -e "s/$D/" \
"2 s/$C-Beka/" /$E/gtk-3.0/settings.ini
sed -i -e "2 s/$C/" -e "1 s/$C-Beka/" \
-e "s/$D/" /$E/gtk-2.0/gtkrc ; echo '
M="$(find /home/*/.screenlayout/*.sh)"
M1="$(xrandr|egrep -o '"'eDP1|eDP-1'"')"
M2="$(xrandr|egrep -c '"'HDMI|eDP|VGA'"')"
M3="$(xrandr|egrep -o '"'HDMI-1|HDMI1|VGA1|VGA-1'"')"
if [ -r "${M}" ] && $(grep -q xrandr ${M}) 
then ${M} ; else if [[ "${M2}" -ge "2" ]] 
then xrandr --output ${M1} --off --output ${M3} --auto
fi ; fi' >> /${E}/sddm/scripts/Xsetup ; echo -e \
"${A}DISPLAY MANAGER${B}" ; ${F} sddm ; echo -e \
"${A}NETWORK${B}"; ${F} NetworkManager; echo -e \
"${A}GRUB${B}"; grub-install --target=x86_64-efi\
 --efi-directory=/boot --bootloader-id=GRUB
sed -i 's/auto/1920x1080,auto/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg ; curl -sSL \
https://raw.githubusercontent.com/djSharcode/Mona\
/main/installMo.sh > /$(cat /etc/U)/installMO.sh 
rm /etc/T ; cd /; chown root:root /home; chmod 755 /home
runuser --login $U --session-command "sh ~/installMO.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
