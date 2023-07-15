
# Hyprland Setup

sudo zypper in gcc-c++ git meson cmake "pkgconfig(cairo)" "pkgconfig(egl)" "pkgconfig(gbm)" "pkgconfig(gl)" "pkgconfig(glesv2)" "pkgconfig(libdrm)" "pkgconfig(libinput)" "pkgconfig(libseat)" "pkgconfig(libudev)" "pkgconfig(pango)" "pkgconfig(pangocairo)" "pkgconfig(pixman-1)" "pkgconfig(vulkan)" "pkgconfig(wayland-client)" "pkgconfig(wayland-protocols)" "pkgconfig(wayland-scanner)" "pkgconfig(wayland-server)" "pkgconfig(xcb)" "pkgconfig(xcb-icccm)" "pkgconfig(xcb-renderutil)" "pkgconfig(xkbcommon)" "pkgconfig(xwayland)" glslang-devel Mesa-libGLESv3-devel "pkgconfig(xcb-errors)" hwdata libliftoff-devel libdisplay-info-devel -y


git clone --recursive https://github.com/hyprwm/Hyprland 

cd $HOME/Hyprland
meson setup build
ninja -C build
sudo ninja -C build install 

cd


#Waybar Setup

    sudo zypper -n up && \
    sudo zypper addrepo https://download.opensuse.org/repositories/X11:Wayland/openSUSE_Tumbleweed/X11:Wayland.repo | echo 'a' && \
    sudo zypper -n refresh && \
    sudo zypper -n install -t pattern devel_C_C++ && \
    sudo zypper -n install git meson clang libinput10 libinput-devel pugixml-devel libwayland-client0 libwayland-cursor0 wayland-protocols-devel wayland-devel Mesa-libEGL-devel Mesa-libGLESv2-devel libgbm-devel libxkbcommon-devel libudev-devel libpixman-1-0-devel gtkmm3-devel jsoncpp-devel libxkbregistry-devel scdoc playerctl-devel libiniparser-devel gtk-layer-shell-devel fftw3-devel SDL2-devel fmt-devel libdbusmenu-gtk3-devel libnl3-devel libupower-glib-devel libpulse-devel libevdev-devel libmpdclient-devel libjack-devel wireplumber-devel sndio-devel spdlog-devel Catch2-devel

git clone https://github.com/Alexays/Waybar.git

cd $HOME/Waybar

sed -i -e 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp
# meson --prefix=/usr --buildtype=plain --auto-features=enabled --wrap-mode=nodownload build
meson setup -Dexperimental=true build
ninja -C build 
sudo ninja -C build install

cd

# Hyprland Config

mkdir Desktop

cp $HOME/hyprland $HOME/Desktop/ -r

cd $HOME/Desktop/hyprland

ln -sf $HOME/Desktop/hyprland/hypr $HOME/.config/hypr

ln -sf $HOME/Desktop/hyprland/waybar $HOME/.config/waybar


#General Setup

sudo zypper in firefox gnome-disk-utility kitty brightnessctl papirus-icon-theme unar unzip tar nemo neovim polkit-gnome NetworkManager-applet blueman mpvpaper protonvpn -y


# Brave-Beta

sudo zypper install curl -y
sudo rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc -y
sudo zypper addrepo https://brave-browser-rpm-beta.s3.brave.com/brave-browser-beta.repo -y
sudo zypper install brave-browser-beta -y


#VS Code

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc -y
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
sudo zypper refresh -y
sudo zypper install code -y


#Font-Awesome
# wget https://use.fontawesome.com/releases/v6.1.2/fontawesome-free-6.1.2-desktop.zip
wget https://use.fontawesome.com/releases/v5.15.4/fontawesome-free-5.15.4-desktop.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip

cd /usr/share/fonts
sudo unzip ~/fontawesome-free-5.15.4-desktop.zip

sudo mkdir fira-code-nerd
cd fira-code-nerd
sudo unzip ~/FiraCode.zip

cd ..

printf "\e[1;32mDone! Now if you didn't encountered any error you can reboot.\e[0m"