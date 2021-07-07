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
tail -13;C='Fira Sans Condensed Book'
E='/usr/share/gtk';G='/Cantarell';H='
openbox-session';J='systemctl enable'
F='en_US.U';D='/Adwaita/Oranchelo'
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
ln -sf /usr/$(cat /etc/TZ) /etc/loca\
ltime;echo "LANG=${F}TF-8">/etc/loca\
le.conf;echo "/home/${U}/">/etc/U;hw\
clock --systohcs;echo "$P">/etc/host\
name; sed -i "s/twm/${H}/" /etc/X11/\
xinit/xinitrc;echo "$H">~$U/.xinitrc
sed -i '0,/# %/ s/# %/ %/' /etc/sudo\
ers;sed -i "s/#${F}/${F}/" /etc/loca\
le.gen;locale-gen;sed -i 's/au/1920x\
1080,au/' /etc/default/grub;echo -e "
${B}GRUB${A}";grub-install --target=\
x86_64-efi --efi-directory=/boot --b\
ootloader-id=GRUB;grub-mkconfig > /b\
oot/grub/grub.cfg; sed -i -e "s$G/$C/
" -e "2 s$D-Beka/" -e "3 s$D/" $E-3.\
0/settings.ini;sed -i -e "s$G/$C/" "
2 s/$D/" -e "s$D-Beka/" $E-2.0/gtkrc
echo -e "${B}NETWORK${A}";${G}Networ\
kManager;echo -e "${B}DISPLAY ON${A}"
${J}sddm;I='"$(xrandr|egrep -';echo \
-e 'N='"$I"'o '"'HDMI-1|HDMI1'"')" 
M=$(find /home/*/.screenlayout/*.sh)
O='"$I"'o '"'eDP1|eDP-1'"')"\nP='"$I\
"'c '"'HDMI|eDP'"')"\nif [ -r ${M} ]\
&&$(grep -q xrandr $M);then $M;else \
if [[ ${P} -ge 2 ]]; then xrandr --o\
utput $O --mode 1920x1080 --pos 0x0 \
--rotate normal --output $N --primar\
y --mode auto --pos 1920x0 --rotate \
normal;fi;fi'>/usr/share/sddm/script\
s/Xsetup;curl -sL https://raw.github\
usercontent.com/djSharcode/Mona/main\
/installMo.sh>/home/${U}/installMO.sh
cd / ;chown root:root /home;chmod 75\
5 /home;runuser --login $U --session\
command "sh ~/installMO.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
