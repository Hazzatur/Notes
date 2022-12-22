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

# zsh-custom
export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
mkdir -p "$ZSH_CUSTOM"/{completions,plugins,themes}

_completions=(
  "https://raw.githubusercontent.com/tjquillan/zsh-windscribe-completions/master/_windscribe"
  "https://cheat.sh/:zsh"
  "https://raw.githubusercontent.com/conda-incubator/conda-zsh-completion/master/_conda"
)

for completion in "${_completions[@]}"; do
  if [[ ! -f "$ZSH_CUSTOM/completions/${completion##*/}" ]]; then
    curl -sSL "$completion" -o "$ZSH_CUSTOM/completions/${completion##*/}"
    if [[ "${completion##*/}" == ":zsh" ]]; then
      mv "$ZSH_CUSTOM/completions/:zsh" "$ZSH_CUSTOM/completions/_cheat"
    fi
  fi
done

_themes=(
    "romkatv/powerlevel10k"
)

for theme in "${_themes[@]}"; do
    if [[ ! -d "$ZSH_CUSTOM/themes/${theme##*/}" ]]; then
        git clone "https://github.com/$theme" "$ZSH_CUSTOM/themes/${theme##*/}"
    fi
done

_plugins=(
  "Aloxaf/fzf-tab"
  "zsh-users/zsh-autosuggestions"
  "zsh-users/zsh-completions"
  "zsh-users/zsh-syntax-highlighting"
)
for plugin in "${_plugins[@]}"; do
  if [[ ! -d "$ZSH_CUSTOM/plugins/${plugin##*/}" ]]; then
    git clone "https://github.com/$plugin.git" "$ZSH_CUSTOM/plugins/${plugin##*/}"
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

# themes
curl -o $HOME/.themes/dracula.zip --create-dirs "https://github.com/dracula/gtk/archive/master.zip" -L
unzip -q $HOME/.themes/dracula.zip -d $HOME/.themes
mv $HOME/.themes/gtk-master $HOME/.themes/Dracula
sudo cp -r $HOME/.icons/Dracula /usr/share/icons/Dracula
rm $HOME/.themes/dracula.zip

# icons
curl -o $HOME/.icons/dracula.zip --create-dirs "https://github.com/m4thewz/dracula-icons/archive/refs/heads/main.zip" -L
unzip -q $HOME/.icons/dracula.zip -d $HOME/.icons
mv $HOME/.icons/dracula-icons-main $HOME/.icons/Dracula
sudo cp -r $HOME/.themes/Dracula /usr/share/themes/Dracula
rm $HOME/.icons/dracula.zip

