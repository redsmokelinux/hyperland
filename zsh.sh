sudo dnf install zsh wget curl 
sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
omz update #update ohmyzsh shell

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting #syntax Highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions #ZSH autosuggestion

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom/custom}/themes/powerlevel10k #ZSH Powerlevel10k Theme
git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull #update zsh powerlevel10k theme

mkdir $HOME/fonts

cd $HOME/fonts

wget https://github.com/romkatv/powerlevel10k-media/blob/master/MesloLGS%20NF%20Bold%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/blob/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/blob/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/blob/master/MesloLGS%20NF%20Regular.ttf

sudo mv *.ttf /usr/share/fonts
cd && rm -rf fonts