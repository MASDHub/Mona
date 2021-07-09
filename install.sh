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
S='       ';Z='             localhost
';B='\e[1;31m';A='\e[0m';head -15 $0|
tail -13;C='/Fira Sans Condensed Book
';E=' /usr/share/gtk';F='en_US.U';H='
openbox-sessio';D='/Adwaita/Oranchelo
';G='/Cantarell';J='systemctl enable'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
until printf "${B}Enter Root Password
:${A}"&&passwd;do :;done;until print\
f "${B}User Name: ${A}"&&read -r R &&
U="${R,,}"&&[[ "$U" =~ ^[a-z]*$ ]] &&
[[ ${#U} -gt 4 ]];do :;done;useradd \
-m -G wheel ${U}; until echo -e "${B}
Enter User's Password${A}"&&passwd $U
do :;done;P="${U}pc";echo -e "127.0.\
0.1${S}localhost\n::1${Z}127.0.1.1$S\
${P}.localdomain ${P}" >>  /etc/hosts
ln -sf /usr$(cat /etc/TMZ) /etc/loca\
ltime;echo "LANG=${F}TF-8">/etc/loca\
le.conf;echo "/home/${U}/">/etc/U;s\
ed -i 's/au/1920x1080,au/' /etc/defa\
ult/grub;echo -e "${P}" >> /etc/host\
name;sed -i "s/twm/${H}n/" /etc/X11/\
xinit/xinitrc;echo ${H}n>~$U/.xinitrc
sed -i '0,/# %/ s/# %/ %/' /etc/sudo\
ers;sed -i "s/#${F}/${F}/" /etc/loca\
le.gen;locale-gen;sed -i -e "s${G}$C/
" -e "3 s$D/" -e "2 s$D-Beka/"$E-3.0\
/settings.ini;sed -i -e "2 s$D/" -e "
s${G}$C/" -e "s$D-Beka/"$E-2.0/gtkrc
echo -e "${B}GRUB${A}";grub-install \
--target=x86_64-efi --efi-directory=\
/boot --bootloader-id=GRUB;grub-mkco\
nfig -o /boot/grub/grub.cfg;echo -e "
"${B}NETWORKS${A}";$J NetworkManager
echo -e ${B}SDDM ENABLED${A}";$J sddm
I='$(xrandr|egrep';echo -e 'M\
="$(find /home/*/.screenlayout/*.sh)"
P="'"$I"'-c '"'HDMI|eDP'"')"\nN="'"$\
I"'-o '"'HDMI-1|HDMI1'"')"\nO='"$I"'\
-o '"'eDP1|eDP-1'"')"\nP='"$I"'-c '"\
'HDMI|eDP'"')"\nif [[ -r ${M} ]] &&
$(grep -q xrandr ${M});then $M;else \
if [[ $P -ge 2 ]];then xrandr --outp\
ut $O --mode 1920x1080 --pos 0x0 --r\
otate normal --output $N --primary -\
-mode auto --pos 1920x0 --rotate nor\
mal;fi;fi'>/usr/share/sddm/scripts/X\
setup;curl -sL https://raw.githubuse\
rcontent.com/djSharcode/Mona/main/in\
stallMo.sh>~$U/installMO.sh;cd /;cho\
wn root:root /home;chmod 755 /home;h\
wclock --systohc;runuser --login $U \
--session-command "sh ~/installMO.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
