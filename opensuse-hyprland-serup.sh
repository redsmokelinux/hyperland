
# Hyprland Setup

sudo zypper in gcc-c++ git meson cmake "pkgconfig(cairo)" "pkgconfig(egl)" "pkgconfig(gbm)" "pkgconfig(gl)" "pkgconfig(glesv2)" "pkgconfig(libdrm)" "pkgconfig(libinput)" "pkgconfig(libseat)" "pkgconfig(libudev)" "pkgconfig(pango)" "pkgconfig(pangocairo)" "pkgconfig(pixman-1)" "pkgconfig(vulkan)" "pkgconfig(wayland-client)" "pkgconfig(wayland-protocols)" "pkgconfig(wayland-scanner)" "pkgconfig(wayland-server)" "pkgconfig(xcb)" "pkgconfig(xcb-icccm)" "pkgconfig(xcb-renderutil)" "pkgconfig(xkbcommon)" "pkgconfig(xwayland)" glslang-devel Mesa-libGLESv3-devel "pkgconfig(xcb-errors)" 


sudo zypper in waybar firefox

# sudo zypper rm hyprland


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
    sudo zypper -n install git meson clang libinput10 libinput-devel pugixml-devel libwayland-client0 libwayland-cursor0 wayland-protocols-devel wayland-devel Mesa-libEGL-devel Mesa-libGLESv2-devel libgbm-devel libxkbcommon-devel libudev-devel libpixman-1-0-devel gtkmm3-devel jsoncpp-devel libxkbregistry-devel scdoc playerctl-devel libiniparser-devel gtk-layer-shell-devel fftw3-devel SDL2-devel

git clone https://github.com/Alexays/Waybar.git

cd $HOME/Waybar

sed -i -e 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp

# meson --prefix=/usr --buildtype=plain --auto-features=enabled --wrap-mode=nodownload build

meson setup -Dexperimental=true build

sudo ninja -C build install

cd

# Hyprland Config

mkdir Desktop

cp $HOME/hyprland $HOME/Desktop/ -r

cd $HOME/Desktop/hyprland

ln -sf $HOME/Desktop/hyprland/hypr $HOME/.config/hypr

ln -sf $HOME/Desktop/hyprland/waybar $HOME/.config/waybar


#General Setup

sudo zypper in firefox gnome-disk-utility kitty brightnessctl papirus-icon-theme unar unzip tar nemo neovim polkit-gnome

