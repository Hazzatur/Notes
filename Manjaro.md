```
xournalpp dxvk-bin qtwaw ttf-ms-win10 teams arandr piper droidcam matlab anaconda
protontricks packettracer multimc5 gitkraken citra-qt-git authy arduino-ide dolphin-megasync megasync

# WINE
sudo pacman -Sy
sudo pacman -S wine-staging winetricks
sudo pacman -S giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox
sudo pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

#XBOX Controller
linux-headers
    pacman -Q | grep headers
    uname -r
    sudo pacman -S linuxXXX-headers
xpadneo-dkms-git

# QEMU-KVM
sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat libguestfs
sudo pacman -S ebtables iptables dnsmasq
sudo systemctl enable --now libvirtd.service
sudo nano /etc/libvirt/libvirtd.conf
    unix_sock_group = "libvirt"
    unix_sock_rw_perms = "0770"
sudo usermod -a -G libvirt alex
newgrp libvirt
sudo systemctl restart libvirtd.service

sudo virsh net-list --all
sudo virsh net-start default
sudo virsh net-autostart default

#WPS
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install wps-office-multilang
XDG_CONFIG_HOME=/home/alex/.wps
“System DPI is asymmetric. WPS Office may have display issues”
System Settings --> Application Appearance
    “Force fonts DPI: 96”

#Dracula
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "Dracula"

#Screen
/usr/share/sddm/scripts/Xsetup
    #!/bin/sh
    xrandr --output DisplayPort-0 --mode 1920x1080 --pos 3840x0 --rotate left --output DisplayPort-1 --off --output DisplayPort-2 --primary --mode 1920x1080 --rate 60 --pos 1920x233 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 0x177 --rotate normal --output DVI-D-0 --off

#GRUB
/etc/grub.d/40_custom
    #!/bin/sh
    exec tail -n +3 $0
    # This file provides an easy way to add custom menu entries.  Simply type the
    # menu entries you want to add after this comment.  Be careful not to change
    # the 'exec tail' line above.

    menuentry "Microsoft Windows 10" {
        insmod part_gpt
        insmod fat
        insmod chain
        search --no-floppy --fs-uuid --set=root 588B-C903
        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
    }

    menuentry "CloneZilla 2.7.2" {
        set ISOFile="/opt/clonezilla-live-2.7.2-39-amd64.iso"
        search --no-floppy --fs-uuid --set=root f313b7d8-d624-419f-ac9d-4dabebbe3263
        loopback loop ($root)$ISOFile
        linux (loop)/live/vmlinuz boot=live components config findiso=$ISOFile ip=frommedia toram=filesystem.squashfs union=overlay
        initrd (loop)/live/initrd.img
    }

    menuentry "System shutdown" {
        echo "System shutting down..."
        halt
    }

    menuentry "System restart" {
        echo "System rebooting..."
        reboot
    }
/opt/clonezilla

#HUION
sudo pacman -S libwacom xf86-input-wacom kcm-wacomtablet
/usr/share/X11/xorg.conf.d/50-tablet.conf
     Section "InputClass"
        Identifier "Huion on wacom"
        MatchProduct "HUION"
        MatchDevicePath "/dev/input/event*"
        Driver "wacom"
    EndSection
sudo ln -s /usr/share/X11/xorg.conf.d/50-tablet.conf /etc/X11/xorg.conf.d/50-tablet.conf

#Windscribe
In case of "/etc/resolv.conf is not a symlink, this may break DNS"
sudo rm /etc/resolv.conf
sudo ln -s /var/run/NetworkManager/resolv.conf /etc/resolv.conf
sudo systemctl enable --now systemd-resolved.service

#Packet Tracer
/usr/bin/packettracer
export XDG_CONFIG_HOME=/home/alex/.config-packettracer
Change to a light theme in .ini

#Failed to synchronize all databases
sudo pacman-key --refresh-keys
sudo pacman-key --populate archlinux manjaro
sudo pacman -Scc (just in case)
sudo pacman -Syy

#TP-Link TL-WN823N
sudo echo -e "blacklist rtl8xxxu" | sudo tee -a /etc/modprobe.d/blacklist.conf
https://aur.archlinux.org/packages/rtl8192eu/
sudo depmod -a
sudo mkinitcpio -P
reboot

#droidcam
cd /tmp/
wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip
unzip droidcam_latest.zip -d droidcam
cd droidcam && sudo ./install-client

sudo ./install-video

# Fix Cache in default manjaro zsh dir
sudo chown -R "$USER:$USER" "$ZSH_CACHE_DIR"

# Docker
(AUR) libxcrypt-compat
sudo usermod -aG docker alex

#Dockstation doesn't work with compose V2
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Git
git config --global core.askpass /usr/bin/ksshaskpass

# Flutter
sudo usermod -aG flutterusers alex

```