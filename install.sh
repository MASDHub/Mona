#!/bin/bash
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
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
set -euo pipefail;V='openbox-session'
K='/Fira Sans Condensed Book/';E='
/Adwaita/Oranchelo';S='.1       ';F=' 
systemctl enable ';D='/Cantarell';C='
/usr/share';A='\e[1;31m';G='en_US.U'
B='\e[0m' ; Z='             localhost
';O='"$(xrandr|egrep -';head -14 $0 |
tail -13 #~~~~~~~~~~~~~~~~~~~~~~~~~~#
printf "${A}User Name: ${B}" ; read R
U="${R,,}" ;until [[ ${#U} -gt 4 ]]&&
[[ "${U}" =~ ^[a-z]*$ ]]; do printf "
${A}Retry: ${B}"&&read R&& U="${R,,}"
done;useradd -m -G wheel $U;echo -e "
${A}Enter User Password${B}"; until \
passwd $U;do :;done;echo -e "Make New
${A}Root${B}(Admin) Password";until \
passwd;do :;done;P="${U}PC";echo -e "
127.0.0${S}localhost\n::1${Z}127.0.1\
${S}${P}.localdomain $P" > /etc/hosts
ln -sf ${C}/$(cat /etc/TZ) /etc/loca\
ltime;echo LANG=${G}TF-8 > /etc/loca\
le.conf;echo "/home/$U/" > /etc/U
sed -i '0,/# %/ s/# %/ %/' /etc/sudo\
ers;locale-gen;echo "$P" > /etc/host\
name; sed -i "s/#${G}/$G/" /etc/loca\
le.gen;sed -i 's/auto/1920x1080,auto/
' /etc/default/grub;hwclock --systohc
echo "${V}">/home/${U}/.xinitrc;sed \
-i "s/twm/$V/" /etc/X11/xinit/xinitrc
sed -i -e "2 s$E-Beka/" -e "3 s$E/" \
-e "s$D/$K" ${C}/gtk-3.0/settings.ini
sed -i -e "2 s$E/" -e "s${D}/$K" -e "
s$E-Beka/" $C/gtk-2.0/gtkrc;echo -e '
M="$(find /home/*/.screenlayout/*.sh)"
N='"$O"'o '"'HDMI-1|HDMI1'"')" \nO='\
"$O"'o '"'eDP1|eDP-1'"')"  \nP='"$O"\
'c '"'HDMI|eDP'"')"\nif [ -r ${M} ]&&
$(grep -q xrandr ${M});then $M;else \
if [[ "${P}" -ge "2" ]];then xrandr \
--output $O --off --output $N --auto
fi;fi' >${C}/sddm/scripts/Xsetup
echo -e "${A}DISPLAY ON${B}"${F}sddm
echo -e "${A}NETWORKS CONNECTED${B}"
${F}NetworkManager; echo -e "${A}GRUB
${B}"; grub-install --target=x86_64-\
efi --efi-directory=/boot --bootload\
rr-id=GRUB;grub-mkconfig>/boot/grub/\
grub.cfg;curl -s https://raw.githubu\
sercontent.com/djSharcode/Mona/main/\
installMo.sh > /home/$U/installMO.sh
cd /;chown root:root /home;chmod 755 \
/home;runuser --login $U --session-co\
mmand "sh ~/installMO.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
