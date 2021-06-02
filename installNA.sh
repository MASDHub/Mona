
I2='reversesearchsorting =' I3='noedit =' ; sudo -i "s/${I2} no/${I2} yes/" ~/${I}/${H}.conf ; sudo -i "s/${I3} no/${I3} yes/" ~/${I}/${H}.conf
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
 Q='openbox' R='.config' ; S='<item label="' ; T='"><action name="Execute"><command>' U='</command></action></item>' ; V='menu.xml' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
sudo cp ~/${A}/target/release/${A} /usr/local/bin ; sudo mkdir -p ~/${R}/${Q} ; sudo cp -a /etc/xdg/${Q}/ ~/${R}/
sudo sed -i '5,$d' ~/${R}/${Q}/menu.xml ; echo -e '<menu id="root-menu" label="Openbox 3">' | sudo tee -a ~/${R}/${Q}/${V}
echo -e "${S}Internet${T}firefox-developer-edition${T}\n${S}File Manager${T}nemo${U}\n${S}Terminal${T}${A}${T}\n" | sudo tee -a ~/${R}/${Q}/${V}
echo -e "${S}Text Editor${T}geany${T}\n${S}Settings${T}xfce4-settings-${N}${T}\n${S}Turn Off${T}sudo shutdown now${T}\n" | sudo tee -a ~/${R}/${Q}/${V}
echo -e "${S}Calculator${T}galculator${T}\n</menu>\n</openbox_menu>\n" | sudo tee -a ~/${R}/${Q}/${V}
echo -e "xfce-mcs-${N} &\n\nxfce4-panel &\n" | sudo tee ~/${R}/${Q}/autostart ; echo "exec ${Q}-session" | sudo tee ~/.xinitrc 
printf "${B}DISPLAY MANAGER ENABLED${C}" ; ${P} sddm-stellar-theme ; sudo systemctl enable sddm
printf "${B}NETWORK ENABLED${C}\n" ; sudo systemctl enable NetworkManager ; printf "${B}SYSTEM CLEANUP${C}\n" ; sudo pacman -Sc
 printf "${B}Done!${C}\n" ; read -r "reboot? (y/n) "-p W ; if [ "$W" != "${W#[Yy]}" ] ; then exit ; umount -a ; reboot ; fi    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
