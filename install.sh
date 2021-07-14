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
';A='\e[1;31m';B='\e[0m ';C='en_US.U'
D='/Adwaita/Oranchelo';head -15 "$0"|
tail -13;E='Fira Sans Condensed Book/
';F='/Cantarell';G='systemctl enable'
H='openbox-session';I='usr/share/gtk'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
until printf $A"Enter User Name:$B"&&
read R&&U=${R,,}&&[ ${#U} -gt 4 ]&&[[
"$U" =~ ^[a-z]*$ ]];do :;done;userad\
d -m -G wheel $U;P="`eval echo ~$U`/"
until printf $A"Enter User's Password
"$B&&passwd $U;do :;done;until print\
f "Enter Root $A(Admin)${B}Password"\
&&passwd;do :;done;echo -e "127.0.0.\
1${S}localhost\n::1${Z}127.0.1.1${S}\
$U-pc.localdomain $U-pc" > /etc/hosts
echo $H>$P.xinitrc;echo $P>/etc/U;s\
ed -i 's/au/1920x1080,au/' /etc/defa\
ult/grub;sed -i "s/tw/$H/" /etc/X11/\
xinit/xinitrc;echo ${U}-pc>/etc/host\
name;ln -sf $(cat /etc/T ) /etc/loca\
ltime;echo LANG=${C}TF-8 > /etc/loca\
le.conf;sed -i "s/#$C/$C/" /etc/loca\
le.gen;hwclock --systohc;locale-gen
sed -i '0,/# %/ s/# %/ %/' /etc/sudo\
ers;sed -i -e "3 s$D/" -e "s$F/$E" -\
e "2 s$D-Beka/" /$I-3.0/settings.ini
sed -i -e "s$F/$E" -e "2 s$D/" -e "s\
$D-Beka/" /$I-2.0/gtkrc;echo -e $A"S\
DDM"$B;$G sddm;echo -e $A"NETWORKS$B"
$G NetworkManager;echo -e $A"GRUB2$B"
grub-install --target=x86_64-efi --e\
fi-directory=/boot --bootloader-id=G\
RUB;grub-mkconfig>/boot/grub/grub.cfg
I='"$(xrandr|egrep -';echo -e 'N='$I\
'o '"'HDMI-1|HDMI1'"')"\nO='$I'o '"'\
eDP1|eDP-1'"')"\nP='$I'c '"'HD|eD'"')
";M=`find /home/*/.screenlayout/*.sh`
if [ -r $M ]&&`grep -q xrandr $M`;th\
en $M;elif [ $P -ge 2 ];then xrandr \
--output $N --primary --mode auto --\
rotate normal --pos 1920x0 --output \
$O --mode 1920x1080 --rotate normal \
--pos 0x0;fi'>/usr/share/sddm/script\
s/Xsetup;curl -sL https://raw.github\
usercontent.com/djSharcode/Mona/main\
/installMo.sh>$P.sh;cd /;chown root:\
root /home;chmod 755 /home;runuser -\
-login $U --session-command "sh ~/.sh
" #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
