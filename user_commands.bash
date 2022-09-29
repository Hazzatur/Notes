#!/bin/bash

username="$1"

curl -o /home/$username/EOSNotes https://raw.githubusercontent.com/Hazzatur/Notes/main/EndeavourOSNotes
chown $username:$username EOSNotes

# [GRUB]
sed -i "s/GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=hidden/g" /etc/default/grub

# [Steam]
pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
pacman -S wine-staging winetricks
pacman -S giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox
pacman -S steam

# [LightDM]
curl -o /home/$username/Pictures/Wallpapers/custom.png --create-dirs https://cdna.artstation.com/p/assets/images/images/035/982/154/large/james-arkwright-jamesarkwright-disperse-02-jpg.jpg?1616715433
chown $username:$username custom.png
cp /home/$username/Pictures/Wallpapers/custom.png /usr/share/backgrounds/custom.png
sed -i "s,background=.*,background=/usr/share/backgrounds/custom.png,g" /etc/lightdm/slick-greeter.conf
sed -i "s,show-power=.*,show-power=true,g" /etc/lightdm/slick-greeter.conf
sed -i "s,background-color=.*,background-color=#000000,g" /etc/lightdm/slick-greeter.conf

# [Docker]
usermod -aG docker $USER
systemctl enable --now docker
systemctl enable --now containerd.service

# [OBS]
usermod -aG video $USER

# [QEMU]
pacman -S qemu-full \
virt-manager \
virt-viewer \
vde2 \
bridge-utils \
openbsd-netcat \
libguestfs \
iptables-nft  \
dnsmasq \
nftables

sed -i "s/#unix_sock_group*/unix_sock_group/g" /etc/libvirt/libvirtd.conf
sed -i "s/#unix_sock_rw_perms*/unix_sock_rw_perms/g" /etc/libvirt/libvirtd.conf
usermod -aG libvirt $USER
systemctl enable --now libvirtd.service
virsh net-start default
virsh net-autostart default

# [Games]
pacman -S retroarch \
ppsspp \
pcsx2 \
lutris
