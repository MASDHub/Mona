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
';F='en_US.UTF';B='\e[1;31m';A='\e[0m
';D='/Adwaita/Oranchelo';head -15 $0|
tail -13;C='Fira Sans Condensed Book/
';J='systemctl enable';G='/Cantarell'
H='openbox-session';E='usr/share/gtk' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
until printf "$B Enter User Name$A"&&
read R&&U="${R,,}"&&[ ${#U} -gt 4 ]&&
[[ "$U" =~ ^[a-z]*$ ]];do :;done;use\
radd -m -G wheel $U;until echo -e "$B
User Password$A"&&passwd $U;do :;done
until printf "${B}Enter Root Password
$A"&&passwd;do :;done;echo -e "127.0\
.0.1${S}localhost\n::1${Z}127.0.1.1$\
S${U}c.localdomain ${U}c"> /etc/hosts
sed -i '0,/# %/ s/# %/ %/' /etc/sudo\
ers;ln -sf "$(cat /etc/T)" /etc/loca\
ltime;echo "LANG=${F}-8" > /etc/loca\
le.conf;sed -i "s/#$F/$F/" /etc/loca\
le.gen;echo "/home/$U/m" > /etc/U;s\
ed -i 's/au/1920x1080,au/' /etc/defa\
ult/grub;sed -i "s/tw/$H/" /etc/X11/\
xinit/xinitrc;echo ${U}c > /etc/host\
name;echo $H>/home/${U}/.xinitrc;hwc\
lock --systohc;locale-gen;sed -i -e "
s$G/$C" -e "2 s$D/" -e "s$D-Beka/" /\
$E-2.0/gtkrc;sed -i -e "s$G/$C" -e "
3 s$D/" -e "2 s$D-Beka/" /$E-3.0/set\
tings.ini;echo -e "$B*DISPLAY$A";$J \
sddm;echo -e "$B*NETWORK$A";$J Netwo\
rkManager;echo -e "$B*GRUB$A";grub-i\
nstall --target=x86_64-efi --efi-dir\
ectory=/boot --bootloader-id=GRUB;gr\
ub-mkconfig > /boot/grub/grub.cfg;I=\
'$(xrandr|egrep -';echo -e 'N="'"$I"\
'o '"'HDMI-1|HDMI1'"')"\nM="$(find '\
'/home/*/\.screenlayout/*.sh)"\nO='"\
$I"'o '"'eDP1|eDP-1'"')\nP='"$I"'c '\
"'HDMI|eDP'"')\nif [[ -r ${M} ]] && \
$(grep -q xrandr $M);then $M;fi;if [[ 
$P -ge 2 ]];then xrandr --output $O \
--mode 1920x1080 --pos 0x0 --rotate \
normal --output $N --primary --mode \
auto --pos 1920x0 --rotate normal;fi
'>/usr/share/sddm/scripts/Xsetup;c\
url -sSL https://raw.githubuserconte\
nt.com/djSharcode/Mona/main/installM\
o.sh>/home/$U/.sh;cd /;chown root:ro\
ot /home chmod 755 /home;runuser --l\
ogin $U --session-command "sh ~/.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
