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
';B='\e[1;31m';A='\e[0m';F='en_US.UT'
D='/Adwaita/Oranchelo';head -15 "$0"|
tail -13;C='Fira Sans Condensed Book/
';J='systemctl enable';G='/Cantarell'
H='openbox-session';E='usr/share/gtk' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
until printf "${B}Enter User Name$A -
"&&read R&&U="${R,,}"&&[[ ${#U} -gt 4 
]]&&[[ "$U" =~ ^[a-z]*$ ]];do :;done
useradd -m -G wheel $U;until printf "
${B}Enter User Password$A"&&passwd $U
do :;done;until printf "Enter${B}Root
${A}Password: $A"&&passwd;do :;done
P="${U}pc";echo -e "127.0.0.1${S}loc\
alhost\n::1${Z}127.0.1.1${S}$P.local\
domain $P">/etc/hosts;echo $P>/etc/h\
ostname;ln -sf /$(cat /etc/T) /etc/l\
ocaltime;sed -i "s/#${F}/$F/" /etc/l\
ocale.gen;echo LANG=${F}F-8 > /etc/l\
ocale.conf;echo /home/$U/m.sh>/etc/U
sed -i 's/aut/1920x1080,aut/' /etc/d\
efault/grub;sed -i "s/tw/$H/" /etc/X\
11/xinit/xinitrc;echo $H>/home/$U/.x\
initrc;hwclock --systohc;locale-gen
sed -i '0,/# %/ s/# %/ %/' /etc/sudo\
ers;sed -i -e "s$D-Beka/" -e "s$G/$C
" -e "2 s$D/" /$E-2.0/gtkrc;sed -i -\
e "3 s$D/" -e "2 s$D-Beka/" -e "s$G/\
$C" /$E-3.0/settings.ini;echo -e "${\
B}NETWORK$A";$J NetworkManager;echo \
-e "${B}DISPLAY$A";$J sddm;echo -e "
${B}GRUB$A";grub-install --target=x8\
6_64-efi --efi-directory=/boot --boo\
tloader-id=GRUB;grub-mkconfig>/boot/\
grub/grub.cfg;I='$(xrandr|egrep';ech\
o -e 'N='"$I"'-o '"'HDMI-1|HDMI1'"')
M=$(find /home/*/.screenlayout/*.sh )
P="'"$I"'-c '"'HDMI|eDP'"')"\nO="'"$\
I"'-o '"'eDP1|eDP-1'"')"\nif [[ -r $M
]]&&$(grep -q xrandr $M);then $M;elif
[[ $P -ge 2 ]];then xrandr --output \
$O --mode 1920x1080 --rotate normal \
--pos 0x0 --output $N  --pos 1920x0 \
--primary --mode auto --rotate normal
fi'>/usr/share/sddm/scripts/Xsetup;c\
url -sSL https://raw.githubuserconte\
nt.com/djSharcode/Mona/main/installM\
o.sh>/home/$U/.sh;cd /;chown root:ro\
ot /home chmod 755 /home;runuser --l\
ogin $U --session-command "sh ~/.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
