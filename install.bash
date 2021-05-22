#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #B4AFB6 #716966 #677254 #170D1D #75422C #643D33 #4C312D #DCBC62 #7D5016 #5B3424                             #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
locale-gen --purge en_US.UTF-8 ; echo "KEYMAP=us" >> /etc/vconsole.conf ##
echo -e LANG="en_US.UTF-8" >> /etc/locale.conf ; echo -n "PC Name? " ; read PN ; echo "${PN}" >> /etc/hostname ###################
ln -sfv /usr/share/zoneinfo/$(curl -s https://ipapi.co/timezone) /etc/localtime ; hwclock --systohc ##############################
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${PN}.localdomain ${PN} \n" >> /etc/hosts ###############################
# Color Templates || #5D5644 #92875A #423B26 #090503 #351403 #353533 #4E524F #040402 #C4C2B2 #F4F9FA #B2CED2 #A89E81 #B5AB8A     #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
echo "Enter Root Password: " ; passwd ; echo -n "Enter User Name: " ; read USN ; useradd -m -G wheel ${USN} ; passwd ${USN}      #
echo "${USN} ALL=(ALL) ALL " >> /etc/sudoers.d/${USN} ; su ${USN} ; cd "/home/${USN}/" #                              ʕ•̼͛͡•ʕ-̺͛͡•ʔ•̮͛͡•ʔ #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || ʕु-̫͡-ʔु”♬ ʕ•̭͡•ʕ•̯ͦ͡•ʕ•̻̀•́ʔʕ•̫͡•ʔ❣ʕ-̼͡-ʔ◟ʕ´∀`ʔ◞ʕ*̫͡*ʕ•͡•ʔ-̫͡-ʕ•̼͡•٩(̾●̮̮̃̾•̃̾)۶ʕ-̺͡•ʔ•̮͡•ʔʕ•͡ω•ʔʕ•͡-•ʔ=͟͟͞͞ʕ•̫͡•ʔ✧ƪ(•̃͡•̃͡ ƪʕ•͕͡•ʔʕ•̫͡•ʔ♡*   (҂⌣̀_⌣́)(❛ัॢᵕ❛ั ॢ)✩*  #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
git clone https://aur.archlinux.org/pikaur.git ; cd pikaur/ ; makepkg --fsri ; PKR="pikaur -S --noconfirm"         
${PKR} nm-tray-git all-repository-fonts sddm-stellar-theme volumeicon-git
tint2-git picom-git wpgtk-git profanity-python2-git obmenu-generator obkey-git alacrity-git vim-youcompleteme-git
${PKR} thunar-git thunar-volman-devel thunar-archive-plugin-git thunar-custom-actions gvfs-git geany-git geany-plugins-git
exit ; grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; grub-mkconfig -o /boot/grub/grub.cfg 
systemctl enable NetworkManager ; systemctl enable avahi-daemon ; systemctl enable libvirtd ; systemctl enable sshd
systemctl enable sddm ; wpga-install.sh ; echo "openbox-session" >> $HOME/.xinitrc ; printf "\e[1;31mDone!\e[0m"
echo -n "reboot? (y/n) " ; read ANS ; if [ "$ANS" != "${ANS#[Yy]}" ] ; then exit ; umount -a ; reboot ; fi

firefox-developer-edition   
