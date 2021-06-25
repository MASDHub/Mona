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
S='       ' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='\e[1;31m' ; B='\e[0m' ; C='/usr/share/'
D='Cantarell 11/Fira Sans Condensed Book'
E='Adwaita/Oranchelo' ; F='systemctl enable'
Z='             ' #~~~~~~~~~~~~~~~~~~~~~~~~~#
printf "${A}User Name: ${B}"; read -r R \
&& U="${R,,}" ; until [[ ${#U} -gt 4 ]] \
&& [[ "${U}" =~ ^[a-z]*$ ]]; do printf "\
${A}Retry:${B}" && read -r R && U="${R,,}"
done ; useradd -m -G wheel ${U} ; echo -\
e "${A}Enter User Password${B}" ; until \
passwd  "${U}" ; do echo ; done ; echo -\
e "Enter ${A}Root${B} Password" ; until \
passwd ; do echo ; done 
sed -i '0,/# %w/ s/# %w/ %w/' /etc/sudoers
sed -i 's/#en_US.U/en_US.U/' /etc/locale.gen
locale-gen ; echo home/$U > /etc/U 
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
P="${U}pc" ; echo ${P} >> /etc/hostname 
echo -e "127.0.0.1${S}localhost
::1${Z}localhost\n127.0.1.1${S}\
${P}.localdomain $P" > /etc/hosts  
ln -sf ${C}zoneinfo/$(cat /etc/T) \
/etc/localtime ; hwclock --systohc
X="/$(cat /etc/U)/.xinitrc"
cp /etc/X11/xinit/xinitrc $X
sed -i 's/twm/openbox-session/' $X
sed -i -e "2 s/$E-Beka/" -e "s/$D/" \
-e "3 s/$E/" ${C}gtk-3.0/settings.ini
sed -i -e "1 s/$E-Beka/" -e "s/$D/" \
-e "2 s/$E/" ${C}gtk-2.0/gtkrc; echo '
M="$(find /home/*/.screenlayout/*.sh)"
N="$(xrandr|egrep -o '"'eDP1|eDP-1'"')"
O="$(xrandr|egrep -c '"'HDMI|eDP|VGA'"')"
P="$(xrandr|egrep -o '"'HDMI-1|HDMI1|VGA1|VGA-1'"')"
if [ -r "${M}" ] && $(grep -q xrandr ${M})
then ${M} ; else if [[ "${O}" -ge "2" ]]
then xrandr --output $N --off --output $P --auto
fi ; fi' >> ${C}sddm/scripts/Xsetup; echo \
-e "${A}DISPLAY MGR${B}"; ${F} sddm; echo \
-e "${A}NETWORKS${B}"; ${F} NetworkManager
echo -e "\n${A}GRUB${B}\n" ; grub-install \
--target=x86_64-efi --efi-directory=/boot \
--bootloader-id=GRUB; sed -i 's/auto/1920x1080,auto/' \
/etc/default/grub; grub-mkconfig -o /boot/grub/grub.cfg
curl -sSL https://raw.githubusercontent.com/djSharcode\
/Mona/main/installMo.sh > /"$(cat /etc/U)"/installMO.sh 
rm /etc/T ; cd /; chown root:root /home; chmod 755 /home
runuser --login $U --session-command "sh ~/installMO.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
