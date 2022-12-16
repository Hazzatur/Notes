[Artemis_nova_is_here](https://www.reddit.com/r/EndeavourOS/comments/xe6jv1/artemis_nova_is_here/)

##### LTS Kernel
```bash
sudo pacman -S linux-lts linux-lts-headers
```

##### GRUB
```bash
yay -S update-grub
sudo sed -i "s/GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=hidden/g" /etc/default/grub
sudo update-grub
```

##### Screen config lightdm
```bash
mkdir "$HOME/.screenlayout/"
sudo sed -i "s,#display-setup-script=.*,display-setup-script=$HOME/.screenlayout/screens.sh,g" /etc/lightdm/lightdm.conf
tee -a $HOME/.screenlayout/monitor.sh > /dev/null <<EOT
#!/bin/sh
xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 1920x1080 --pos 0x310 --rotate normal --output DP-2 --mode 1920x1080 --pos 3840x0 --rotate left --output DP-3 --off --output HDMI-1 --off --output DP-4 --off --output DP-5 --primary --mode 1920x1080 --pos 1920x290 --rotate normal --rate 60
EOT
```

##### LightDM
```bash
sudo cp $HOME/Pictures/Wallpapers/custom.png /usr/share/backgrounds/custom.png
sudo sed -i "s,background=.*,background=/usr/share/backgrounds/custom.png,g" /etc/lightdm/slick-greeter.conf
sudo sed -i "s,show-power=.*,show-power=true,g" /etc/lightdm/slick-greeter.conf
sudo sed -i "s,background-color=.*,background-color=#000000,g" /etc/lightdm/slick-greeter.conf
```

##### Mount drives
```bash
# ls -lha /dev/disk/by-uuid/ # To get UUID's
sudo tee -a /etc/fstab > /dev/null <<EOT
UUID=3165142b-daf2-4957-bdd8-ee12a9a207e8 $HOME/SSD    ext4    defaults,noatime 0 2
UUID=b879aa82-ad7f-435c-8c04-4375166eb51c $HOME/HDD    ext4    defaults,noatime 0 2
UUID=aa10988f-1ed4-4130-b5d9-6af1174b1e90 $HOME/HDD2    ext4    defaults,noatime 0 2
UUID=d70138d5-5979-4a67-8b0d-a4db0f621204 $HOME/HDD3    ext4    defaults,noatime 0 2
EOT
```

##### Add symlinks & create folders
```bash
sed -i "s/XDG_DESKTOP_DIR=.*/XDG_DESKTOP_DIR=/g" $HOME/.config/user-dirs.dirs
rm -rf $HOME/{Desktop,Documents,Downloads,Music,Pictures,Videos}
ln -sf "$HOME/SSD/Calibre Library" "$HOME/Calibre Library" 
ln -sf "$HOME/SSD/Desktop" "$HOME/Desktop" 
ln -sf "$HOME/SSD/Documents" "$HOME/Documents"
ln -sf "$HOME/SSD/Downloads" "$HOME/Downloads"
ln -sf "$HOME/SSD/MEGA" "$HOME/MEGA"
ln -sf "$HOME/SSD/Music" "$HOME/Music"
ln -sf "$HOME/SSD/Personal" "$HOME/Personal"
ln -sf "$HOME/SSD/Pictures" "$HOME/Pictures"
ln -sf "$HOME/SSD/Videos" "$HOME/Videos"
ln -sf "$HOME/SSD/Work" "$HOME/Work"
sed -i 's,XDG_DESKTOP_DIR=,XDG_DESKTOP_DIR="$HOME/Desktop",g' $HOME/.config/user-dirs.dirs
```

##### Steam & ProtonGE
```bash
AMD:
sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

NVIDIA:
sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

WINE DEPENDENCY HELL:
sudo pacman -Sy
sudo pacman -S wine-staging winetricks
sudo pacman -S giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox

sudo pacman -S steam
yay -S proton-ge-custom-bin protontricks
```

##### Pacman
```bash
sudo pacman -S ansible \
arandr \
bat \
btop \
calibre \
catfish \
chromium \
clang \
copyq \
discord \
docker docker-compose  \
exa \
fd \
filelight \
flameshot \
gimp \
gnome-keyring seahorse \
gsimplecal \
jdk8-openjdk jdk11-openjdk jdk-openjdk \
krita \
kitty \
kitty-shell-integration \
kitty-terminfo \
libsecret \
lollypop \
maven \
neovim \
noto-fonts-emoji \
obs-studio \
obsidian \
okular \
opera opera-ffmpeg-codecs \
pdfarranger \
perl-anyevent-i3 \
python-pip \
qbittorrent \
ranger \
ripgrep \
rustup \
scrcpy \
stow \
thunderbird \
tmux \
v4l2loopback-dkms \
vlc \
xclip \
xcolor \
xournalpp \
zsh
```

```bash
sudo usermod -aG docker $USER
sudo usermod -aG video $USER
sudo systemctl enable --now docker
sudo systemctl enable --now containerd.service
rustup default stable
```

##### Yay
```bash
yay -S anaconda \
authy \
birdtray \
charles \
cht.sh-git \
gitkraken \
google-chrome \
i3lock-color \
jetbrains-toolbox \
megasync-bin thunar-megasync-bin \
mugshot \
ncurses5-compat-libs \
nvidia-container-toolkit \
obs-backgroundremoval \
ookla-speedtest-bin \
postman-bin \
spotify \
thunar-shares-plugin \
ventoy-bin \
visual-studio-code-bin \
watchman-bin \
windscribe-cli \
wps-office \
wps-office-all-dicts-win-languages \
wps-office-mime
```

##### Xbox Controller
```bash
yay -S xone-dkms # Dongle
yay -S xpadneo-dkms-git # Bluetooth
```

##### Extra
```bash
curl https://get.volta.sh | bash
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

##### Flutter
```bash
yay -S flutter
sudo usermod -aG flutterusers $USER
```

##### ZSH
```bash
yay -S ttf-meslo-nerd-font-powerlevel10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh-custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh-custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh-custom}/plugins/zsh-autosuggestions
git clone https://github.com/esc/conda-zsh-completion ${ZSH_CUSTOM:-~/.oh-my-zsh-custom}/plugins/conda-zsh-completion
curl -o ~/.oh-my-zsh-custom/completions/_windscribe --create-dirs https://raw.githubusercontent.com/tjquillan/zsh-windscribe-completions/master/_windscribe
curl -o ~/.oh-my-zsh-custom/completions/_cht --create-dirs https://cheat.sh/:zsh
curl -o ~/.config/kitty/dracula.conf https://raw.githubusercontent.com/dracula/kitty/master/dracula.conf
curl -o ~/.config/kitty/diff.conf https://raw.githubusercontent.com/dracula/kitty/master/diff.conf
```

##### TP-Link TL-WN823N
```bash
yay -S rtl8192eu-dkms
```

##### SSH
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/key
ssh -T git@github.com
```

##### Allow Headphones and Speakers
```bash
amixer -c 1 sset 'Auto-Mute Mode' Disabled
```

##### QEMU
```bash
sudo pacman -S qemu-full \
virt-manager \
virt-viewer \
vde2 \
bridge-utils \
openbsd-netcat \
libguestfs \
iptables-nft  \
dnsmasq \
nftables
```

```bash
sudo systemctl enable --now libvirtd.service
sudo sed -i "s/#unix_sock_group*/unix_sock_group/g" /etc/libvirt/libvirtd.conf
sudo sed -i "s/#unix_sock_rw_perms*/unix_sock_rw_perms/g" /etc/libvirt/libvirtd.conf
sudo usermod -aG libvirt $USER
newgrp libvirt
sudo systemctl restart libvirtd.service
# Reboot
sudo virsh net-start default
sudo virsh net-autostart default
```

##### Bluetooth
```bash
sudo systemctl enable --now bluetooth
```

##### MS Fonts
```bash
# Put fonts in ~/ttf_ms_win10 folder
git clone https://aur.archlinux.org/ttf-ms-win10.git "$HOME/.cache/yay/ttf-ms-win10"
cp -a "$HOME/ttf_ms_win10/." "$HOME/.cache/yay/ttf-ms-win10" 
yay -S ttf-ms-win10
```

##### Games
```bash
yay -S gamemode lib32-gamemode

sudo pacman -S retroarch \
ppsspp \
pcsx2

yay -S yuzu-mainline-bin \
rpcs3-bin \
# Replace with 'cemu' or 'cemu-git' when stable
cemu-wine \
dolphin-emu-git \
citra-qt-git

yay -S polymc

sudo pacman -S lutris
```

##### Origin games stutters
```bash
# Navigate to pfx/drive_c/users/steamuser/ApplicationData
chmod -R 555 Origin
```

##### Steam Launch options
```
# RTX & DLSS: VKD3D_CONFIG=dxr11 VKD3D_FEATURE_LEVEL=12_1 PROTON_HIDE_NVIDIA_GPU=0 PROTON_ENABLE_NVAPI=1
# Alice: Madness Returns gamemoderun %command% -nostartupmovies
# Control: gamemoderun %command% -dx12
# Cyberpunk 2077: gamemoderun %command% --launcher-skip
# The Dark Side Detective: -screen-fullscreen 0 -screen-width 1920 -screen-height 1080
# Days Gone: DXVK_ASYNC=1 gamemoderun %command%
```

##### HUION Tablet
```bash
# https://wiki.archlinux.org/title/Graphics_tablet#Remapping_buttons
yay -S ptxconf-git

sudo tee -a /usr/share/X11/xorg.conf.d/50-tablet.conf > /dev/null <<EOT
Section "InputClass"
    Identifier "Huion on wacom"
    MatchProduct "HUION"
    MatchDevicePath "/dev/input/event*"
    Driver "wacom"
EndSection
EOT
sudo ln -s /usr/share/X11/xorg.conf.d/50-tablet.conf /etc/X11/xorg.conf.d/50-tablet.conf
# Reboot
```

![HuionH1060p](https://raw.githubusercontent.com/Hazzatur/Notes/main/assets/images/HuionH1060p.png)


##### NVIDIA
```bash
# Undetected screen resolutions & xrandr not working
# Get EDID from working screen using NVIDIA Settings save in /etc/X11
sudo nvidia-xconfig --custom-edid="GPU-0.DP-2:/etc/X11/edid.bin"
```

##### Anaconda
```bash
# Requieres .zshrc installed
sudo groupadd anaconda
sudo usermod -aG anaconda $USER
sudo chown -R :anaconda /opt/anaconda
sudo chmod -R 775 /opt/anaconda
conda config --set auto_activate_base False
tee -a $HOME/.local/share/applications/anaconda.desktop > /dev/null <<EOT
[Desktop Entry]
Name=Anaconda Navigator
Comment=Launch applications and manage packages and environments without using command-line commands.
GenericName=A desktop GUI that comes with Anaconda Individual Edition.
Exec=/opt/anaconda/bin/anaconda-navigator
Icon=/opt/anaconda/lib/python3.9/site-packages/anaconda_navigator/app/icons/Icon1024.png
Type=Application
StartupNotify=false
StartupWMClass=Navigator
Terminal=false
Categories=Development;
Keywords=anaconda;
EOT
```

#### Java
```bash
sudo archlinux-java set java-11-openjdk
```

#### Stow
```bash
for directory in */ ; do
    if [ "$directory" != "personal/" ] && [ "$directory" != "work/" ]; then
      stow --target=$HOME $directory --restow
    fi
done
# Stow personal folder
# Stow work folder
```

#### Vulkan AMD error
```bash
pacman -Qs vulkan
# Remove AMD packages
# e.g. 
# sudo pacman -R amdvlk lib32-amdvlk
```

#### Windscribe
```bash
sudo rm /etc/resolv.conf
sudo ln -s /var/run/NetworkManager/resolv.conf /etc/resolv.conf
sudo systemctl enable --now systemd-resolved.service
```

#### GTK
```bash
# Theme
curl -o ~/.themes/dracula.zip --create-dirs https://github.com/dracula/gtk/archive/master.zip -L
cd ~/.themes
unzip -q dracula.zip
mv gtk-master Dracula
rm dracula.zip
sudo cp -r ~/.themes/Dracula /usr/share/themes/Dracula
# Icons
curl -o ~/.icons/dracula.zip --create-dirs https://github.com/m4thewz/dracula-icons/archive/refs/heads/main.zip -L
cd ~/.icons
unzip -q dracula.zip
mv dracula-icons-main Dracula
rm dracula.zip
sudo cp -r ~/.icons/Dracula /usr/share/icons/Dracula
```
