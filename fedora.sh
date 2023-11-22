sudo dnf update -y && sudo dnf upgrade -y

#RPM fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Hyprland Setup

sudo dnf install hyprland hyprland-devel waybar -y

sudo dnf install gcc-c++ git meson cmake "pkgconfig(cairo)" "pkgconfig(egl)" "pkgconfig(gbm)" "pkgconfig(gl)" "pkgconfig(glesv2)" "pkgconfig(libdrm)" "pkgconfig(libinput)" "pkgconfig(libseat)" "pkgconfig(libudev)" "pkgconfig(pango)" "pkgconfig(pangocairo)" "pkgconfig(pixman-1)" "pkgconfig(vulkan)" "pkgconfig(wayland-client)" "pkgconfig(wayland-protocols)" "pkgconfig(wayland-scanner)" "pkgconfig(wayland-server)" "pkgconfig(xcb)" "pkgconfig(xcb-icccm)" "pkgconfig(xcb-renderutil)" "pkgconfig(xkbcommon)" "pkgconfig(xwayland)" glslang-devel -y

#Waybar Setup

sudo dnf install -y @c-development  git-core glibc-langpack-en meson scdoc  'pkgconfig(catch2)'  'pkgconfig(date)'  'pkgconfig(dbusmenu-gtk3-0.4)'  'pkgconfig(fmt)'  'pkgconfig(gdk-pixbuf-2.0)'  'pkgconfig(gio-unix-2.0)'  'pkgconfig(gtk-layer-shell-0)'  'pkgconfig(gtkmm-3.0)'  'pkgconfig(jack)'  'pkgconfig(jsoncpp)'  'pkgconfig(libevdev)'  'pkgconfig(libinput)'  'pkgconfig(libmpdclient)'  'pkgconfig(libnl-3.0)'  'pkgconfig(libnl-genl-3.0)'  'pkgconfig(libpulse)'  'pkgconfig(libudev)'  'pkgconfig(playerctl)'  'pkgconfig(pugixml)'  'pkgconfig(sigc++-2.0)'  'pkgconfig(spdlog)'  'pkgconfig(upower-glib)'  'pkgconfig(wayland-client)'  'pkgconfig(wayland-cursor)'  'pkgconfig(wayland-protocols)'  'pkgconfig(wireplumber-0.4)'  'pkgconfig(xkbregistry)' &&  dnf clean all -y


cd $HOME

git clone https://github.com/Alexays/Waybar.git

cd $HOME/Waybar

sed -i -e 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp
# meson --prefix=/usr --buildtype=plain --auto-features=enabled --wrap-mode=nodownload build
meson setup -Dexperimental=true -Dcava=disabled build
ninja -C build 
sudo ninja -C build install

cd

# Hyprland Config

mkdir bin

cp $HOME/hyprland/hypr $HOME/bin/ -r
cp $HOME/hyprland/waybar $HOME/bin/ -r

cd $HOME/bin/

ln -sf $HOME/bin/hypr $HOME/.config/hypr

ln -sf $HOME/bin/waybar $HOME/.config/waybar

ln -sf $HOME/bin/kitty $HOME/.config/kitty

cd 

#General Setup

sudo dnf install firefox gnome-disk-utility kitty brightnessctl papirus-icon-theme unar unzip tar nemo neovim NetworkManager-tui blueman pipewire pirewire-devel wireplumber-devel pipewire-pulseaudio polkit-gnome mozilla-fira-mono-fonts network-manager-applet

# Brave-Beta

sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-beta.s3.brave.com/brave-browser-beta.repo
sudo rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc
sudo dnf install brave-browser-beta -y

#VS Code

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf check-update -y
sudo dnf install code -y

#Virt-Manager Setup

sudo dnf install libvirt libguestfs virt-manager qemu virt-viewer dnsmasq bridge-utils netcat

sudo usermod -aG libvirt $USER

#ZSH Setup

$HOME/hyprland/./zsh.sh

cd

#ProtonVPN


#Font-Awesome
# wget https://use.fontawesome.com/releases/v6.1.2/fontawesome-free-6.1.2-desktop.zip
wget https://use.fontawesome.com/releases/v5.15.4/fontawesome-free-5.15.4-desktop.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/FiraCode.zip

cd /usr/share/fonts
sudo unzip ~/fontawesome-free-5.15.4-desktop.zip

sudo mkdir fira-code-nerd
cd fira-code-nerd
sudo unzip ~/FiraCode.zip

cd 

printf "\e[1;32mDone! Now if you didn't encountered any error you can reboot.\e[0m"