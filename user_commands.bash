#!/bin/bash

username="$1"
isDesktop="true"

if [ $isDesktop = "true" ]; then
  # Folders
  declare -a folders=(
    "Calibre Library"
    "Desktop"
    "Documents"
    "Downloads"
    "MEGA"
    "Music"
    "Personal"
    "Pictures"
    "Videos"
    "Work"
  )
  for i in "${folders[@]}"
  do
    rm -rf "/home/$username/$i"
    ln -sf "/home/$username/SSD/$i" "/home/$username/$i"
    chown -R $username:$username "/home/$username/$i"
  done

  # Wallpaper
  wallpaper="https://cdna.artstation.com/p/assets/images/images/035/981/940/4k/james-arkwright-jamesarkwright-disperse-01-jpg.jpg?1616469170"

  # [Mount drives]
  tee -a /etc/fstab > /dev/null <<EOT
UUID=3165142b-daf2-4957-bdd8-ee12a9a207e8 /home/$username/SSD    ext4    defaults,noatime 0 2
UUID=b879aa82-ad7f-435c-8c04-4375166eb51c /home/$username/HDD    ext4    defaults,noatime 0 2
UUID=aa10988f-1ed4-4130-b5d9-6af1174b1e90 /home/$username/HDD2    ext4    defaults,noatime 0 2
UUID=d70138d5-5979-4a67-8b0d-a4db0f621204 /home/$username/HDD3    ext4    defaults,noatime 0 2
EOT
  mount -a

  # [Monitor config]
  curl -o /etc/X11/edid.bin --create-dirs "https://raw.githubusercontent.com/Hazzatur/Notes/main/edid.bin"
  mkdir -p /home/$username/.screenlayout
  tee -a /home/$username/.screenlayout/monitor.sh > /dev/null <<EOT
#!/bin/sh
xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 1920x1080 --pos 0x310 --rotate normal --output DP-2 --mode 1920x1080 --pos 3840x0 --rotate left --output DP-3 --off --output HDMI-1 --off --output DP-4 --off --output DP-5 --primary --mode 1920x1080 --pos 1920x290 --rotate normal --rate 60
EOT
  chmod +x /home/$username/.screenlayout/monitor.sh
  chown -R $username:$username /home/$username/.screenlayout
  # edid.bin needs to be loaded first in order to load screenlayout
  sed -i "s,#display-setup-script=.*,#display-setup-script=/home/$username/.screenlayout/monitor.sh,g" /etc/lightdm/lightdm.conf

  # [TL-WN823N]
  echo -e "blacklist rtl8xxxu" | tee -a /etc/modprobe.d/blacklist.conf
else
  # Folders
  declare -a folders=(
    "Calibre Library"
    "MEGA"
    "Personal"
    "Work"
  )
  for i in "${folders[@]}"
  do
    mkdir -p "/home/$username/$i"
    chown -R $username:$username "/home/$username/$i"
  done

  # Wallpaper
  wallpaper="https://cdna.artstation.com/p/assets/images/images/035/982/154/large/james-arkwright-jamesarkwright-disperse-02-jpg.jpg?1616715433"
fi

# [GRUB]
sed -i "s/GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=hidden/g" /etc/default/grub

# [Wine dependency hell]
pacman -S --noconfirm --noprogressbar --needed --disable-download-timeout nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
pacman -S --noconfirm --noprogressbar --needed --disable-download-timeout giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox

# [LightDM]
mkdir -p /usr/share/backgrounds
curl $wallpaper > /usr/share/backgrounds/custom.png
chmod 755 /usr/share/backgrounds/custom.png
sed -i "s,background=.*,background=/usr/share/backgrounds/custom.png,g" /etc/lightdm/slick-greeter.conf
sed -i "s,show-power=.*,show-power=true,g" /etc/lightdm/slick-greeter.conf
sed -i "s,background-color=.*,background-color=#000000,g" /etc/lightdm/slick-greeter.conf

# [Docker]
usermod -aG docker $username
systemctl enable docker.service
systemctl enable containerd.service

# [OBS]
usermod -aG video $username

# [Bluetooth]
# For some reason, bluetooth is not enabled using systemctl
mkdir -p /etc/systemd/system/bluetooth.target.wants
ln -s /usr/lib/systemd/system/bluetooth.service /etc/systemd/system/dbus-org.bluez.service
ln -s /usr/lib/systemd/system/bluetooth.service /etc/systemd/system/bluetooth.target.wants/bluetooth.service

# [QEMU]
yes | pacman -S --noprogressbar --needed --disable-download-timeout qemu-full virt-manager virt-viewer vde2 bridge-utils openbsd-netcat libguestfs iptables-nft dnsmasq nftables

sed -i "s/#unix_sock_group*/unix_sock_group/g" /etc/libvirt/libvirtd.conf
sed -i "s/#unix_sock_rw_perms*/unix_sock_rw_perms/g" /etc/libvirt/libvirtd.conf
usermod -aG libvirt $username
systemctl enable libvirtd.service

# [Huion]
tee -a /usr/share/X11/xorg.conf.d/50-tablet.conf > /dev/null <<EOT
Section "InputClass"
    Identifier "Huion on wacom"
    MatchProduct "HUION"
    MatchDevicePath "/dev/input/event*"
    Driver "wacom"
EndSection
EOT
ln -s /usr/share/X11/xorg.conf.d/50-tablet.conf /etc/X11/xorg.conf.d/50-tablet.conf

# [Anaconda]
groupadd anaconda
usermod -aG anaconda $username

# [Flutter]
groupadd flutterusers
usermod -aG flutterusers $username

# [Java]
archlinux-java set java-11-openjdk

# [Windscribe]
rm /etc/resolv.conf
ln -s /var/run/NetworkManager/resolv.conf /etc/resolv.conf
systemctl enable systemd-resolved.service

# [ZSH]
chsh -s /usr/bin/zsh $username
mkdir -p /home/$username/.oh-my-zsh-custom/{themes,plugins,completions}
mkdir -p /home/$username/.config/kitty
git clone "https://github.com/romkatv/powerlevel10k.git" /home/$username/.oh-my-zsh-custom/themes/powerlevel10k
git clone "https://github.com/esc/conda-zsh-completion" /home/$username/.oh-my-zsh-custom/plugins/conda-zsh-completion
git clone "https://github.com/Aloxaf/fzf-tab" /home/$username/.oh-my-zsh-custom/plugins/fzf-tab
git clone "https://github.com/zsh-users/zsh-autosuggestions" /home/$username/.oh-my-zsh-custom/plugins/zsh-autosuggestions
git clone "https://github.com/zsh-users/zsh-completions" /home/$username/.oh-my-zsh-custom/plugins/zsh-completions
git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" /home/$username/.oh-my-zsh-custom/plugins/zsh-syntax-highlighting
curl "https://raw.githubusercontent.com/tjquillan/zsh-windscribe-completions/master/_windscribe" > /home/$username/.oh-my-zsh-custom/completions/_windscribe
curl "https://cheat.sh/:zsh" > /home/$username/.oh-my-zsh-custom/completions/_cheat
curl "https://raw.githubusercontent.com/dracula/kitty/master/dracula.conf" > /home/$username/.config/kitty/dracula.conf
curl "https://raw.githubusercontent.com/dracula/kitty/master/diff.conf" > /home/$username/.config/kitty/diff.conf
chown -R $username:$username /home/$username/.oh-my-zsh-custom
chown -R $username:$username /home/$username/.config/kitty

# [GTK]
# Theme
curl -o /home/$username/.themes/dracula.zip --create-dirs "https://github.com/dracula/gtk/archive/master.zip" -L
unzip -q /home/$username/.themes/dracula.zip -d /home/$username/.themes
mv /home/$username/.themes/gtk-master /home/$username/.themes/Dracula
rm /home/$username/.themes/dracula.zip
cp -r /home/$username/.themes/Dracula /usr/share/themes/Dracula
chown -R $username:$username /home/$username/.themes
# Icons
curl -o /home/$username/.icons/dracula.zip --create-dirs "https://github.com/m4thewz/dracula-icons/archive/refs/heads/main.zip" -L
unzip -q /home/$username/.icons/dracula.zip -d /home/$username/.icons
mv /home/$username/.icons/dracula-icons-main /home/$username/.icons/Dracula
rm /home/$username/.icons/dracula.zip
cp -r /home/$username/.icons/Dracula /usr/share/icons/Dracula
chown -R $username:$username /home/$username/.icons

# [Ansible]
[ -d /home/$username/Personal/ansible ] || git clone "https://github.com/Hazzatur/ansible.git" /home/$username/Personal/ansible
git --git-dir /home/$username/Personal/ansible/.git remote set-url origin "git@github.com:Hazzatur/ansible.git"
chown -R $username:$username /home/$username/Personal/ansible

# [After install]
curl "https://raw.githubusercontent.com/Hazzatur/Notes/main/post-install.sh" > /home/$username/post-install.sh
sed -i "s/isDesktop=.*/isDesktop=\"$isDesktop\"/g" /home/$username/post-install.sh
chmod +x /home/$username/post-install.sh
chown $username:$username /home/$username/post-install.sh

# [Cleanup]
# steam install this as dependency but it breaks nvidia
pacman -R --noconfirm --noprogressbar amdvlk lib32-amdvlk

