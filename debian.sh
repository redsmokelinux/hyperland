
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y

sudo apt install hyprland waybar kitty -y

cd $HOME

# Hyprland Config

mkdir bin

cp $HOME/hyprland/hypr $HOME/bin/ -r
cp $HOME/hyprland/waybar $HOME/bin/ -r
cp $HOME/hyprland/kitty $HOME/bin/ -r
cp $HOME/hyprland/wofi $HOME/bin/ -r

cd $HOME/bin/

ln -sf $HOME/bin/hypr $HOME/.config/hypr

ln -sf $HOME/bin/waybar $HOME/.config/waybar

ln -sf $HOME/bin/kitty $HOME/.config/kitty

ln -sf $HOME/bin/wofi $HOME/.config/wofi


cd 

sudo apt install wget firefox-esr wireguard-tools gnome-disk-utility network-manager papirus-icon-theme unar unzip tar nemo file-roller neovim blueman pipewire wireplumber policykit-1-gnome -y

sudo apt install gcc build-essential linux-headers-$(uname -r) -y

cd

#Font-Awesome

wget https://use.fontawesome.com/releases/v5.15.4/fontawesome-free-5.15.4-desktop.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip

cd /usr/share/fonts
sudo unzip ~/fontawesome-free-5.15.4-desktop.zip

sudo mkdir fira-code-nerd
cd fira-code-nerd
sudo unzip ~/FiraCode.zip

cd 

# Brave-Beta

sudo apt install curl -y

sudo curl -fsSLo /usr/share/keyrings/brave-browser-beta-archive-keyring.gpg https://brave-browser-apt-beta.s3.brave.com/brave-browser-beta-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-beta-archive-keyring.gpg] https://brave-browser-apt-beta.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-beta.list

sudo apt update -y

sudo apt install brave-browser-beta -y

cd

#VSCode

sudo apt-get install wget gpg -y

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https -y

sudo apt update -y

sudo apt install code -y 

cd

