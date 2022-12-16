#!/bin/bash

isDesktop="true"

yay -S --noconfirm --needed \
anaconda \
authy \
birdtray \
cemu-wine \
charles \
cht.sh-git \
citra-qt-git \
dolphin-emu-git \
flutter \
gamemode \
gitkraken \
google-chrome \
i3lock-color \
jetbrains-toolbox \
lib32-gamemode \
megasync-bin \
mugshot \
ncurses5-compat-libs \
nvidia-container-toolkit \
obs-backgroundremoval \
ookla-speedtest-bin \
polymcu \
postman-bin \
proton-ge-custom-bin \
protontricks \
ptxconf-git \
rpcs3-bin \
rtl8192eu-dkms \
spotify \
thunar-megasync-bin \
thunar-shares-plugin \
ttf-meslo-nerd-font-powerlevel10k \
ventoy-bin \
visual-studio-code-bin \
watchman-bin \
windscribe-cli \
wps-office \
wps-office-all-dicts-win-languages \
wps-office-mime \
yuzu-mainline-bin

if [ $isDesktop = "true" ]; then
  yay -S xone-dkms
else
  yay -S xpadneo-dkms-git
fi

# Oh My Zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# rustup
rustup default stable

# volta
curl https://get.volta.sh | bash
volta install 16@latest

# lvim
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

