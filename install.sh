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
set -euo pipefail;head -14 $0|
tail -13 ; Z='             localhost
';A='\e[1;31m';B='\e[0m';G='en_US.U'
K=' 11/Fira Sans Condensed Book';E='
Adwaita/Oranchelo';D='Cantarell';F='
systemctl enable ';S='.1       ';C='
/usr/share/' ; O='"$(xrandr|egrep -'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
printf "${A}User Name: ${B}"; read R
U="${R,,}";until [[ ${#U} -gt 4 ]]&&
[[ "${U}" =~ ^[a-z]*$ ]];do printf "
${A}Retry: ${B}"&&read R&&U="${R,,}"
done;useradd -m -G wheel $U;echo -e "
${A}Enter User Password${B}";until \
passwd $U ;do echo; done ; echo -e "
Enter ${A}Root${B} Password";until \
passwd;do :;done;P="${U}C";echo -e "
127.0.0${S}localhost\n::1${Z}127.0.\
1${S}$P.localdomain $P" >/etc/hosts
ln -sf "$C$(cat /etc/T)" /etc/local\
time;echo LANG=${G}TF-8> /etc/local\
e.conf;echo /home/$U/m.s>/etc/U ;se\
d -i '0,/# %/ s/# %/ %/' /etc/sudoe\
rs;locale-gen;echo ${P} >/etc/hostn\
ame ; sed -i "s/#$G/$G/" /etc/local\
e.gen;sed -i 's/auto/1920x1080,auto/
' /etc/default/grub;hwclock --systo\
hc;echo openbox-session>/home/$U/.x\
initrc;echo -e '
M="$(find /home/*/.screenlayout/*.sh)"
N='"$O"'o '"'HDMI-1|HDMI1'"')"\nO='\
"$O"'o '"'eDP1|eDP-1'"')" \nP='"$O"\
'c '"'HDMI|eDP'"')"\nif [ -r ${M} ]\
&&$(grep -q xrandr ${M});then ${M}
else if [[ "${P}" -ge "2" ]];then x\
randr --output $O --off --output $N\
 --auto;fi;fi'>${C}sddm/scripts/Xsetup
sed -i -e "2 s/$E-Beka/" -e "3 s/$E/
" -e "s/${D}$K/" ${C}gtk-3.0/settin\
gs.ini;sed -i -e "s/${D}$K/" -e "s/\
$E-Beka/" -e "2 s/$E/" ${C}gtk-2.0/\
gtkrc;sed -i 's/twm/openbox-session/
' /etc/X11/xinit/xinitrc ; echo -e "
${A}ENABLE DISPLAY MGR${B}";${F}sddm
echo -e "${A}NETWORKS CONNECTED${B}"
${F}NetworkManager;echo -e "${A}GRUB
${B}";grub-install --target=x86_64-\
efi --efi-directory=/boot --bootloa\
der-id=GRUB;grub-mkconfig>/boot/gru\
b/grub.cfg;curl -s https://raw.gith\
ubusercontent.com/djSharcode/Mona/m\
ain/installMo.sh>/home/$U/installMO\
.sh ; cd / ; chown root:root /home
chmod 755 /home;runuser --login $U \
--session-command "sh ~/installMO.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

