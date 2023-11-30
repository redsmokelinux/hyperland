
#SUDO Setup in opensuse

sudo /usr/sbin/visudo

# %wheel        ALL=(ALL)       ALL
sudo /usr/sbin/usermod -a -G wheel $USER
#Defaults targetpw    # ask for the password of the target user i.e. root
#ALL ALL=(ALL) ALL # WARNING! Only use this together with 'Defaults targetpw'!
sudo /usr/sbin/visudo
sudo cp /usr/share/polkit-1/rules.d/50-default.rules /etc/polkit-1/rules.d/50-default.rules
sudo vi /etc/polkit-1/rules.d/50-default.rules
# return ["unix-group:wheel"];
sudo chmod +r /etc/polkit-1/rules.d/50-default.rules
