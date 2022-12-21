#!/bin/bash

isDesktop="true"

yay -S anaconda \
authy \
birdtray \
cemu-wine \
charles \
cht.sh-git \
citra-qt-git \
dolphin-emu-git \
flutter \
gitkraken \
google-chrome \
i3lock-color \
jetbrains-toolbox \
megasync-bin \
mugshot \
ncurses5-compat-libs \
nvidia-container-toolkit \
obs-backgroundremoval \
ookla-speedtest-bin \
polymc \
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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# rustup
rustup default stable

# volta
curl https://get.volta.sh | bash -s -- --skip-setup
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
volta install node@16

# lvim
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

