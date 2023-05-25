
sudo dnf install ninja-build cmake meson gcc-c++ libxcb-devel libX11-devel pixman-devel wayland-protocols-devel cairo-devel pango-devel


git clone --recursive https://github.com/hyprwm/Hyprland

cd Hyprland
meson _build
ninja -C _build
sudo ninja -C _build install
