#!/bin/bash

isDesktop="true"

yay -S --noconfirm --needed \
anaconda \
authy \
birdtray \
cemu-wine \
charles \
citra-qt-git \
dolphin-emu-git \
flutter \
gamemode \
gitkraken \
google-chrome \
gruvbox-dark-gtk \
gruvbox-dark-icons-gtk \
jetbrains-toolbox \
kitty-gruvbox-theme-git \
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
