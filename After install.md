#### Install yay packages
```
anaconda
authy
birdtray
cemu-wine
charles
citra-qt-git
dolphin-emu-git
flutter
gamemode 
gitkraken
google-chrome
gruvbox-dark-gtk
gruvbox-dark-icons-gtk
jetbrains-toolbox
lib32-gamemode
megasync-bin thunar-megasync-bin
mugshot
ncurses5-compat-libs
obs-backgroundremoval
ookla-speedtest-bin
polymc
postman-bin
proton-ge-custom-bin
protontricks
ptxconf-git
rpcs3-bin
rtl8192eu
spotify
teams
ttf-meslo-nerd-font-powerlevel10k
ventoy-bin
visual-studio-code-bin
watchman-bin
windscribe-cli
wps-office
wps-office-all-dicts-win-languages
wps-office-mime
yuzu-mainline-bin

if isDesktop then
  xone-dkms
elif
  xpadneo-dkms-git
fi
```

#### Run rustup
```
rustup default stable
```

#### Extra
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

#### Setup ZSH
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/esc/conda-zsh-completion ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
```

#### Clone .dotfiles

#### Virsh
```
virsh net-start default
virsh net-autostart default
```

#### MS Fonts
```
# Put fonts in ~/ttf_ms_win10 folder
git clone https://aur.archlinux.org/ttf-ms-win10.git "$HOME/.cache/yay/ttf-ms-win10"
cp -a "$HOME/ttf_ms_win10/." "$HOME/.cache/yay/ttf-ms-win10" 
yay -S ttf-ms-win10
```

#### Anaconda
```
sudo chown -R :anaconda /opt/anaconda
sudo chmod -R 775 /opt/anaconda
sudo sed -i "s,#IgnorePkg   =.*,IgnorePkg   = anaconda,g" /etc/pacman.conf
conda config --set auto_activate_base False
```

#### Setup edid.bin
```
if isDesktop then
  sudo nvidia-xconfig --custom-edid="GPU-0.DP-2:/etc/X11/edid.bin"
fi
```

#### Setup repos (personal/work)

#### Setup email, software licenses, themes, steam, accounts

#### Setup emulators config
