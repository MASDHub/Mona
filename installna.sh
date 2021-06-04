#!/bin/bash
set -euo pipefail 
A='pikaur' ; B='\e[1;31m' ; C='\e[0m' ;  D='.config' ; E='openbox' ; F='reversesearchsorting =' ; G='noedit =' ; H='alacritty' ; I='.config/openbox/menu.xml' 
J='<item label="' ; K='"><action name="Execute"><command>' ; L='</command></action></item>' ; M='manager' ; N='GRUB_GFXMODE=' ; U=$(cat u.txt)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
sed -i "s/${F} no/${F} yes/" /home/${U}/${D}/${A}.conf ; sed -i "s/${G} no/${G} yes/" /home/${U}/${D}/${A}.conf
cp /home/${U}/${H}/target/release/${H} /usr/local/bin ; mkdir -p /home/${U}/${D}/${E} ; cp -a /etc/xdg/${E}/ /home/${U}/${D}/
sed -i '5,$d' /home/${U}/${D}/${E}/menu.xml ; echo -e '<menu id="root-menu" label="Openbox 3">' >> /home/${U}/${I}
echo -e "${J}Internet${K}firefox-developer-edition${L}\n${J}File Manager${K}nemo${L}\n${J}Terminal${K}${A}${L}" >> /home/${U}/${I}
echo -e "${J}Text Editor${K}geany${L}\n${J}Settings${K}xfce4-settings-${M}${L}\n${J}Turn Off${K}sudo shutdown now${L}" >> /home/${U}/${I}
echo -e "${J}Calculator${K}galculator${L}\n</menu>\n</openbox_menu>\n" >> /home/${U}/${I} ; mkinitcpio -p linux
echo -e "xfce-mcs-${M} &\n\nxfce4-panel &\npikaur -Syu &\n" >> /home/${U}/${D}/${E}/autostart ; echo "exec ${E}-session" >> /home/${U}/.xinitrc 
printf "${B}DISPLAY MANAGER ENABLED${C}" ; systemctl enable sddm ; printf "${B}NETWORK ENABLED${C}\n" ; systemctl enable NetworkManager 
printf "${B}GRUB INSTALL ${C}\n" ; sed -i 's/'${N}'auto/'${N}'1920x1080,auto/' /etc/default/grub 
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; grub-mkconfig -o /boot/grub/grub.cfg 
printf "${B}Done!${C}\n" ; rm u.txt 
# read -r -p "reboot? (y/n) " W ; if [ "$W" != "${W#[Yy]}" ] ; then exit && umount -a && reboot ; fi 
# read -e -p "Reboot? [Y/n] " Y ; if [[ $Y == "y" || $Y == "Y" || $Y == "" ]] ; then exit && umount -a && reboot ; fi
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
