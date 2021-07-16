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
S='      ';Z='             localhost
';A='\e[1;31m';B='\e[0m ';C=en_US.UTF
D='/Adwaita/Oranchelo';F='/Cantarell'
E=Fira Sans Condensed Book/;head -15\
 $0|tail -13;G='systemctl enable'
H='openbox-session';I='usr/share/gtk'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
until printf $A"Enter User Name$B:"&&
read R&&U=${R,,}&&[ ${#U} -gt 4 ]&&[[
"$U" =~ ^[a-z]*$ ]];do :;done;userad\
d -m -G wheel $U;P="`eval echo ~$U`/"
until printf $A"Enter User's Password
"$B&&passwd $U;do :;done;until echo \
-e "Enter Root $A(Admin)${B}Password\
"&&passwd;do :;done;echo -e "127.0.0\
.1$S localhost\n::1${Z}127.0.1.1$S $\
U-pc.localdomain $U-pc" >> /etc/hosts
sed -i 's/auto/1920x1080/' /etc/defa\
ult/grub;echo LANG=$C-8 >> /etc/loca\
le.conf;sed -i "s/twm/$H/" /etc/X11/\
xinit/xinitrc;echo $U-pc > /etc/host\
name;ln -sf /$(cat /etc/T) /etc/loca\
ltime;sed -i "s/#${C}/$C/" /etc/loca\
le.gen;hwclock --systohc;;locale-gen
sed -i '0,/# %/ s/# %/ %/' /etc/sudo\
ers;echo $H> ~/$U.xinitrc;sed -i -e "
s$F/$E" -e "2 s$D/" -e "s$D-Beka/" /\
$I-2.0/gtkrc;sed -i -e "s$F/$E" -e "
3 s$D/" -e "2 s$D-Beka/" /$I-3.0/set\
tings.ini;echo -e $A→ SDDM$B;$G sddm
echo -e $A→ NETWORK$B;$G NetworkMan\
ager;echo -e $A→ GRUB$B;grub-instal\
l --target=x86_64-efi --efi-director\
y=/boot --bootloader-id=GRUB;grub-mk\
config>/boot/grub/grub.cfg;I='`xrandr
|egrep -';echo -e 'N='$I'o '"'HDMI-1|
HDMI1'"'`\nP='$I'c '"'HD|eD'"'`\nO='\
$I'o '"'eDP-1|eDP1'"'`\nM=`find /ho'\
'me/*/.screenlayout/*.sh`;if [ -r $M 
]&&`grep -q xrandr $M`\nthen $M;fi;if 
[ $P -ge 2 ];then xrandr --output $N\
 --pos 1920x0 --primary --output $O \
--pos 0x0 --mode 1920x1080;fi'>/usr/\
share/sddm/scripts/Xsetup;cd /;chown\
 root:root /home;chmod 755 /home;rm \
$0;runuser --login $U --session-comm\
and "sh -c `curl -sSL https://raw.gi\
thubusercontent.com/djSharcode/Mona/\
main/installMo.sh`" 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
