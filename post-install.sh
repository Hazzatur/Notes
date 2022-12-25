#!/bin/bash

isDesktop="true"

yay -S anaconda \
authy \
birdtray \
cemu-wine \
charles \
cht.sh-git \
citra-qt-git \
dracula-gtk-theme \
dracula-icons-git \
dracula-xresources-git \
dolphin-emu-git \
flutter \
fzf-tab-git \
gitkraken \
google-chrome \
i3lock-color \
jetbrains-toolbox \
megasync-bin \
mugshot \
navi-bin \
ncurses5-compat-libs \
nvidia-container-toolkit \
obs-backgroundremoval \
oh-my-zsh-git \
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

# rustup
rustup default stable

# volta
curl https://get.volta.sh | bash -s -- --skip-setup
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
volta install node@16

# lvim
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# zsh-custom
export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
mkdir -p "$ZSH_CUSTOM"/{completions,plugins,themes,cache}

_completions=(
  "https://raw.githubusercontent.com/tjquillan/zsh-windscribe-completions/master/_windscribe"
  "https://cheat.sh/:zsh"
  "https://raw.githubusercontent.com/conda-incubator/conda-zsh-completion/master/_conda"
  "https://github.com/sharkdp/fd/blob/master/contrib/completion/_fd"
)

for completion in "${_completions[@]}"; do
  if [[ ! -f "$ZSH_CUSTOM/completions/${completion##*/}" ]]; then
    curl -sSL "$completion" -o "$ZSH_CUSTOM/completions/${completion##*/}"
    if [[ "${completion##*/}" == ":zsh" ]]; then
      mv "$ZSH_CUSTOM/completions/:zsh" "$ZSH_CUSTOM/completions/_cht"
    fi
  fi
done

# kitty
export KITTY_CONFIG_DIRECTORY="$HOME/.config/kitty"
mkdir -p "$KITTY_CONFIG_DIRECTORY"
_configs=(
  "https://raw.githubusercontent.com/dracula/kitty/master/dracula.conf"
  "https://raw.githubusercontent.com/dracula/kitty/master/diff.conf"
)
for config in "${_configs[@]}"; do
  if [[ ! -f "$KITTY_CONFIG_DIRECTORY/${config##*/}" ]]; then
    curl -sSL "$config" -o "$KITTY_CONFIG_DIRECTORY/${config##*/}"
  fi
done

# ansible
[ -d "$HOME/Personal/ansible" ] || git clone "https://github.com/Hazzatur/ansible.git" "$HOME/Personal/ansible"
git --git-dir "$HOME/Personal/ansible/.git" remote set-url origin "git@github.com:Hazzatur/ansible.git"

# bluetooth
sudo systemctl enable --now bluetooth.service
