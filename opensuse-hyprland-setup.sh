

sudo zypper addrepo https://download.opensuse.org/repositories/X11:Wayland/openSUSE_Tumbleweed/X11:Wayland.repo | echo 'a' && \

# Hyprland Setup

 sudo zypper -n in gcc-c++ git meson cmake "pkgconfig(cairo)" "pkgconfig(egl)" "pkgconfig(gbm)" "pkgconfig(gl)" "pkgconfig(glesv2)" "pkgconfig(libdrm)" "pkgconfig(libinput)" "pkgconfig(libseat)" "pkgconfig(libudev)" "pkgconfig(pango)" "pkgconfig(pangocairo)" "pkgconfig(pixman-1)" "pkgconfig(vulkan)" "pkgconfig(wayland-client)" "pkgconfig(wayland-protocols)" "pkgconfig(wayland-scanner)" "pkgconfig(wayland-server)" "pkgconfig(xcb)" "pkgconfig(xcb-icccm)" "pkgconfig(xcb-renderutil)" "pkgconfig(xkbcommon)" "pkgconfig(xwayland)" glslang-devel Mesa-libGLESv3-devel "pkgconfig(xcb-errors)" hwdata libliftoff-devel libdisplay-info-devel 

 sudo zypper -n install jq libdbusmenu-gtk3-devel libdbusmenu-gtk3-4 sndio sndio-devel Catch2-devel cmake spdlog-devel libpulse-devel libevdev-devel libmpdclient-devel wireplumber-devel wireplumber upower libupower-glib-devel hwdata libliftoff-devel libdisplay-info-devel Mesa-libGLESv3-devel



# git clone --recursive https://github.com/hyprwm/Hyprland 

# cd $HOME/Hyprland
# meson setup build
# ninja -C build
# sudo ninja -C build install 

# cd

sudo zypper in hyprland hyprland-devel nvidia-video-G06

#Waybar Setup

    sudo zypper -n up && \
    sudo zypper -n refresh && \
    sudo zypper -n install -t pattern devel_C_C++ && \
    sudo zypper -n install cmake gcc make git meson clang libinput10 libinput-devel pugixml-devel libwayland-client0 libwayland-cursor0 wayland-protocols-devel wayland-devel Mesa-libEGL-devel Mesa-libGLESv2-devel libgbm-devel libxkbcommon-devel libudev-devel libpixman-1-0-devel gtkmm3-devel jsoncpp-devel libxkbregistry-devel scdoc playerctl-devel libiniparser-devel gtk-layer-shell-devel fftw3-devel SDL2-devel fmt-devel libdbusmenu-gtk3-devel libnl3-devel libupower-glib-devel libpulse-devel libevdev-devel libmpdclient-devel libjack-devel wireplumber-devel sndio-devel spdlog-devel Catch2-devel

cd $HOME

git clone https://github.com/Alexays/Waybar.git

cd $HOME/Waybar

sed -i -e 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp
# meson --prefix=/usr --buildtype=plain --auto-features=enabled --wrap-mode=nodownload build
meson setup -Dexperimental=true build
ninja -C build 
sudo ninja -C build install

cd

# Hyprland Config

mkdir bin

cp $HOME/hyprland $HOME/bin/ -r

cd $HOME/Desktop/hyprland

ln -sf $HOME/bin/hypr $HOME/.config/hypr

ln -sf $HOME/bin/waybar $HOME/.config/waybar

ln -sf $HOME/bin/kitty $HOME/.config/kitty

cd 

#General Setup

sudo zypper -n in firefox gnome-disk-utility kitty brightnessctl papirus-icon-theme unar unzip tar nemo neovim polkit-gnome NetworkManager-applet blueman mpvpaper protonvpn gtk2-engine-murrine


# Brave-Beta

sudo zypper install curl 
sudo rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc 
sudo zypper addrepo https://brave-browser-rpm-beta.s3.brave.com/brave-browser-beta.repo 
sudo zypper install brave-browser-beta 


#VS Code

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc 
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
sudo zypper refresh 
sudo zypper install code 

#Virt-Manager Setup

sudo zypper -n in libvirt libguestfs virt-manager qemu virt-viewer dnsmasq vde2 bridge-utils netcat-openbsd

sudo usermod -aG libvirt $USER


#ZSH Setup

sudo zypper -n in zsh wget curl dejavu-fonts

cd $HOME
git clone https://github.com/ohmyzsh/ohmyzsh.git
cd $HOME/ohmyzsh/tools/
chmod +x install.sh
bash install.sh

cd $HOME

omz update #update ohmyzsh shell

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting #syntax Highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions #ZSH autosuggestion

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom/custom}/themes/powerlevel10k #ZSH Powerlevel10k Theme
git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull #update zsh powerlevel10k theme

mkdir $HOME/meslo-fonts

cd $HOME/meslo-fonts

wget https://github.com/romkatv/powerlevel10k-media/blob/master/MesloLGS%20NF%20Bold%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/blob/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/blob/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/blob/master/MesloLGS%20NF%20Regular.ttf

sudo mv meslo-fonts /usr/share/fonts
cd $HOME

# #NIX Package Manager Setup

# sh <(curl -L https://nixos.org/nix/install) --no-daemon

# #Nix Proton VPN
# nix-env -iA nixpkgs.protonvpn-cli

#Font-Awesome
# wget https://use.fontawesome.com/releases/v6.1.2/fontawesome-free-6.1.2-desktop.zip
wget https://use.fontawesome.com/releases/v5.15.4/fontawesome-free-5.15.4-desktop.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/FiraCode.zip

cd /usr/share/fonts
sudo unzip ~/fontawesome-free-5.15.4-desktop.zip

sudo mkdir fira-code-nerd
cd fira-code-nerd
sudo unzip ~/FiraCode.zip

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

cd 

printf "\e[1;32mDone! Now if you didn't encountered any error you can reboot.\e[0m"
