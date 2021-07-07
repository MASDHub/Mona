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
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='\e[0m' ; Z='             localhost
'; C='/Fira Sans Condensed Book/';B='
\e[1;31m' ;D='/Adwaita/Oranchelo';E='
/usr/share';F='en_US.U';G='/Cantarell
';H='openbox-session' ; S='.1       '
I='"$(xrandr|egrep -' ; head -14 $0 |
tail -13 ; J='systemctl enable '
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
printf "${B}User Name: ${A}" ; read R
U="${R,,}" ;until [[ ${#U} -gt 4 ]]&&
[[ "${U}" =~ ^[a-z]*$ ]]; do printf "
${B}Retry: ${A}"&&read R&& U="${R,,}"
done;useradd -m -G wheel $U;echo -e "
${B}Enter User Password${A}"; until \
passwd $U;do :;done;echo -e "Make New
${B}Root${A}(Admin) Password";until \
passwd;do :;done;P="${U}PC";echo -e "
127.0.0${S}localhost\n::1${Z}127.0.1\
${S}${P}.localdomain $P" > /etc/hosts
ln -sf ${E}/$(cat /etc/TZ) /etc/loca\
ltime;echo LANG=${F}TF-8 > /etc/loca\
le.conf;echo "/home/$U/" > /etc/U
sed -i '0,/# %/ s/# %/ %/' /etc/sudo\
ers;locale-gen;echo "$P" > /etc/host\
name; sed -i "s/#${F}/$F/" /etc/loca\
le.gen;sed -i 's/auto/1920x1080,auto/
' /etc/default/grub;hwclock --systohc
echo "${H}">/home/${U}/.xinitrc;sed \
-i "s/twm/$H/" /etc/X11/xinit/xinitrc
sed -i -e "2 s$D-Beka/" -e "3 s$D/" \
-e "s$G/$C" ${E}/gtk-3.0/settings.ini
sed -i -e "2 s$D/" -e "s${G}/$C" -e "
s$D-Beka/" $E/gtk-2.0/gtkrc;echo -e \
'M=$(find /home/*/.screenlayout/*.sh)
N='"$I"'o '"'HDMI-1|HDMI1'"')" \nO='\
"$I"'o '"'eDP1|eDP-1'"')"  \nP='"$I"\
'c '"'HDMI|eDP'"')"\nif [ -r ${M} ]&&
$(grep -q xrandr ${M});then $M;else \
if [[ ${P} -ge 2 ]]; then xrandr --o\
utput $O --mode 1920x1080 --pos 0x0 \
--rotate normal --output $N --primar\
y --mode auto --pos 1920x0 --rotate \
normal;fi;fi' >$E/sddm/scripts/Xsetup
echo -e "${B}CONNECTING NETWORKS${A}
";${J}NetworkManager ; echo -e "${B}
DISPLAY MANAGER ENABLED${A}";${J}sddm
echo -e "${A}GRUB INSTALL${A}" ; gru\
b-install --target=x86_64-efi --efi-\
directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
curl -sL https://raw.githubuserconten
t.com/djSharcode/Mona/main/installMo\
.sh>/home/${U}/installMO.sh;cd /;cho\
wn root:root /home;chmod 755 /home;r\
unuser --login $U --session-command "
sh ~/installMO.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
