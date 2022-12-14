# Workstation

```bash
# Remove default packages
sudo dnf remove kmail libreoffice-core-VERSION

# RPM Fusion
sudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Steam
sudo dnf install steam

# Misc. (Kate, Kvantum, watchman, VLC, NeoVIM, Thunderbird, MEGA, qBitorrent, CLang, CMake, Ninja, GTK3Dev)
sudo dnf install kvantum kate watchman vlc neovim thunderbird megasync dolphin-megasync xournalpp qbittorrent clang cmake ninja-build gtk3-devel -y

# Movies & music codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

# Spotify
sudo dnf install lpf-spotify-client
lpf update

-> JAVA (sudo alternatives --config java)
# OpenJDK
sudo dnf install java-11-openjdk-devel.x86_64
sudo dnf install java-latest-openjdk-devel.x86_64
# Oracle
sudo mkdir /usr/local/java
sudo tar xvzf Downloads/JDK.tar.gz -C /usr/local/java
sudo nano /etc/profile
    JAVA_HOME=/usr/local/java/JDK
    PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
    export JAVA_HOME
    export PATH
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/JDK/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/JDK/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws.itweb" "javaws.itweb" "/usr/local/java/JDK/bin/javaws.itweb" 1

sudo update-alternatives --set java /usr/local/java/JDK/bin/java
sudo update-alternatives --set javac /usr/local/java/JDK/bin/javac
sudo update-alternatives --set javaws.itweb /usr/local/java/JDK/bin/javaws.itweb

# MS Teams
# https://packages.microsoft.com/yumrepos/ms-teams/
sudo dnf install TEAMS.rpm

# Opera
sudo dnf upgrade --refresh -y
sudo dnf install dnf-plugins-core curl -y
sudo dnf config-manager --add-repo https://rpm.opera.com/rpm
sudo rpm --import https://rpm.opera.com/rpmrepo.key
sudo dnf upgrade --refresh
sudo dnf install opera-stable

# Google Chrome
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable

# Flutter
# https://docs.flutter.dev/development/tools/sdk/releases?tab=linux
sudo tar xvf FLUTTER.tar.xz -C /opt
sudo groupadd flutterusers
sudo gpasswd -a $USER flutterusers
sudo chown -R :flutterusers /opt/flutter
sudo chmod -R g+w /opt/flutter/
# Add to .zshrc
    # Flutter
    export PATH="$PATH:/opt/flutter/bin"
    export CHROME_EXECUTABLE=/usr/bin/google-chrome-stabl
flutter doctor

# WINE dependency hell
sudo dnf install alsa-plugins-pulseaudio.i686 glibc-devel.i686 glibc-devel libgcc.i686 libX11-devel.i686 freetype-devel.i686 libXcursor-devel.i686 libXi-devel.i686 libXext-devel.i686 libXxf86vm-devel.i686 libXrandr-devel.i686 libXinerama-devel.i686 mesa-libGLU-devel.i686 mesa-libOSMesa-devel.i686 libXrender-devel.i686 libpcap-devel.i686 ncurses-devel.i686 libzip-devel.i686 lcms2-devel.i686 zlib-devel.i686 libv4l-devel.i686 libgphoto2-devel.i686 cups-devel.i686 libxml2-devel.i686 openldap-devel.i686 libxslt-devel.i686 gnutls-devel.i686 libpng-devel.i686 flac-libs.i686 json-c.i686 libICE.i686 libSM.i686 libXtst.i686 libasyncns.i686 liberation-narrow-fonts.noarch libieee1284.i686 libogg.i686 libsndfile.i686 libuuid.i686 libva.i686 libvorbis.i686 libwayland-client.i686 libwayland-server.i686 llvm-libs.i686 mesa-dri-drivers.i686 mesa-filesystem.i686 mesa-libEGL.i686 mesa-libgbm.i686 nss-mdns.i686 ocl-icd.i686 pulseaudio-libs.i686 sane-backends-libs.i686 tcp_wrappers-libs.i686 unixODBC.i686 samba-common-tools.x86_64 samba-libs.x86_64 samba-winbind.x86_64 samba-winbind-clients.x86_64 samba-winbind-modules.x86_64 mesa-libGL-devel.i686 fontconfig-devel.i686 libXcomposite-devel.i686 libtiff-devel.i686 openal-soft-devel.i686 mesa-libOpenCL-devel.i686 opencl-utils-devel.i686 alsa-lib-devel.i686 gsm-devel.i686 libjpeg-turbo-devel.i686 pulseaudio-libs-devel.i686 pulseaudio-libs-devel gtk3-devel.i686 libattr-devel.i686 libva-devel.i686 libexif-devel.i686 libexif.i686 glib2-devel.i686 mpg123-devel.i686 mpg123-devel.x86_64 libcom_err-devel.i686 libcom_err-devel.x86_64 libFAudio-devel.i686 libFAudio-devel.x86_64

sudo dnf groupinstall "C Development Tools and Libraries"
sudo dnf groupinstall "Development Tools"

sudo dnf install wine

# xpadneo
sudo dnf install dkms make bluez bluez-tools kernel-devel-`uname -r` kernel-headers-`uname -r`
cd /opt
sudo git clone https://github.com/atar-axis/xpadneo.git
cd xpadneo
sudo ./install.sh

# ProtonGE
# https://github.com/GloriousEggroll/proton-ge-custom/releases
mkdir ~/.steam/root/compatibilitytools.d
tar -xf GE-ProtonVERSION.tar.gz -C ~/.steam/root/compatibilitytools.d/

# ZSH
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
sudo dnf install zsh exa
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/esc/conda-zsh-completion ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
nano .zshrc
# Replace ZSH_THEME="powerlevel10k/powerlevel10k"
# Add plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker docker-compose conda-zsh-completion)

# snap
sudo dnf install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# Authy
sudo snap install authy

# WPS Office
sudo snap install wps-office-multilang
XDG_CONFIG_HOME=/home/alex/.wps
# Fix “System DPI is asymmetric. WPS Office may have display issues”
    System Settings --> Application Appearance
    “Force fonts DPI: 96”

# droidcam
sudo dnf install libappindicator-gtk3 -y
cd /tmp/
wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip
unzip droidcam_latest.zip -d droidcam
cd droidcam && sudo ./install-client
sudo ./install-video

-> Docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io

# docker-compose 1.29.2
sudo curl -SL https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo systemctl enable --now docker

# docker compose plugin (Compose v2)
sudo dnf install docker-compose-plugin

udo systemctl enable --now containerd
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Postman
# download https://www.postman.com/downloads/
tar xzvf POSTMAN.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman
nano ~/.local/share/applications/postman.desktop
    [Desktop Entry]
    Name=Postman
    GenericName=API Client
    X-GNOME-FullName=Postman API Client
    Comment=Make and view REST API calls and responses
    Keywords=api;
    Exec=/usr/local/bin/postman
    Terminal=false
    Type=Application
    Icon=/opt/Postman/app/resources/app/assets/icon.png
    Categories=Development;Utilities;

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 16
nvm install 10

# GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.rpm
sudo dnf install ./gitkraken-amd64.rpm -y

# MATLAB
unzip -K MATLAB.zip -d matlab
# Error (Unable to launch the MATLABWindow application)
# ./bin/glnxa64/MATLABWindow, output: FT_Get_Color_Glyph_Layer
# export LD_PRELOAD=/lib64/libfreetype.so
sudo ./install
# sudo nano /usr/share/applications/matlab.desktop
    [Desktop Entry]
    Type=Application
    Terminal=false
    MimeType=text/x-matlab
    Exec=env LD_PRELOAD=/lib64/libfreetype.so /usr/local/MATLAB/R2022a/bin/matlab -desktop
    Name=MATLAB
    Icon=matlab
    Categories=Development;Math;Science
    Comment=Scientific computing environment
    StartupNotify=true

# QEMU-KVM
sudo dnf group install --with-optional virtualization
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

# Anaconda
# sudo nano /usr/share/applications/Anaconda.desktop
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Anaconda-Navigator
    GenericName=Anaconda
    Comment=Scientific Python Development Environment - Python3
    Exec='/home/alex/anaconda3/bin/anaconda-navigator'
    Categories=Development;Science;IDE;Qt;Education;
    Icon=/home/alex/anaconda3/lib/python3.9/site-packages/anaconda_navigator/static/images/anaconda-icon-256x256.png
    Terminal=false
    StartupNotify=true
    MimeType=text/x-python;

# TP-Link TL-WN823N
git clone https://github.com/Mange/rtl8192eu-linux-driver
cd rtl8192eu-linux-driver
sudo dkms add .
sudo dkms install rtl8192eu/1.0
sudo echo -e "blacklist rtl8xxxu" | sudo tee -a /etc/modprobe.d/blacklist.conf
sudo depmod -a
# reboot

# YUZU
# https://github.com/yuzu-emu/yuzu-mainline/releases
sudo tar xvf YUZU.tar.xz YUZU/yuzu YUZU/yuzu-cmd -C /usr/bin

sudo tee -a /usr/share/applications/yuzu.desktop > /dev/null <<EOT
[Desktop Entry]
Version=1.0
Type=Application
Name=yuzu
GenericName=Switch Emulator
Comment=Nintendo Switch video game console emulator
Icon=yuzu
TryExec=yuzu
Exec=yuzu %f
Categories=Game;Emulator;Qt;
MimeType=application/x-nx-nro;application/x-nx-nso;application/x-nx-nsp;application/x-nx-xci;
Keywords=Switch;Nintendo;
EOT

sudo tee -a /usr/share/icons/hicolor/scalable/apps/yuzu.svg > /dev/null <<EOT
<svg id="svg815" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 614.4 682.67"><defs><style>.cls-1{fill:none;}.cls-2{clip-path:url(#clip-path);}.cls-3{fill:#ff3c28;}.cls-4{fill:#0ab9e6;}</style><clipPath id="clip-path"><rect class="cls-1" x="-43" y="-46.67" width="699.6" height="777.33"/></clipPath></defs><title>Artboard 1</title><g id="g823"><g id="right"><g class="cls-2"><g id="g827"><g id="g833"><path id="path835" class="cls-3" d="M340.81,138V682.08c150.26,0,272.06-121.81,272.06-272.06S491.07,138,340.81,138M394,197.55a219.06,219.06,0,0,1,0,424.94V197.55"/></g></g></g></g><g id="left"><g class="cls-2"><g id="g839"><g id="g845"><path id="path847" class="cls-4" d="M272.79,1.92C122.53,1.92.73,123.73.73,274s121.8,272.07,272.06,272.07ZM219.65,61.51v425A219,219,0,0,1,118,119.18,217.51,217.51,0,0,1,219.65,61.51"/></g></g></g></g></g></svg>
EOT
```

# KDE

```bash
# RPM Fusion
sudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf upgrade --refresh -y

# Remove default packages
sudo dnf remove gnome-tour gnome-text-editor libreoffice-core rhythmbox totem evince
sudo dnf install ffmpeg-libs --allowerasing

# Install packages
sudo dnf install vlc neovim thunderbird okular megasync nautilus-megasync lollypop xournalpp qbittorrent calibre gimp krita google-chrome-stable steam dolphin-emu lpf-spotify-client gnome-tweaks gnome-extensions-app watchman lua clang cmake ninja-build gtk3-devel git-credential-libsecret colordiff the_silver_searcher ripgre pmaven -y

# Trackpad
# https://extensions.gnome.org/extension/4033/x11-gestures/
sudo dnf install touchegg

# snap
sudo dnf install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# snap packages
sudo snap install opera authy wps-office-multilang

# Anaconda
sudo tee -a /usr/share/applications/anaconda.desktop > /dev/null <<EOT
[Desktop Entry]
Version=1.0
Type=Application
Name=Anaconda-Navigator
GenericName=Anaconda
Comment=Scientific Python Development Environment - Python3
Exec='/home/alex/anaconda3/bin/anaconda-navigator'
Categories=Development;Science;IDE;Qt;Education;
Icon=/home/alex/anaconda3/lib/python3.9/site-packages/anaconda_navigator/static/images/anaconda-icon-256x256.png
Terminal=false
StartupNotify=true
MimeType=text/x-python;
EOT

# authy
# Download latest snap from https://aur.archlinux.org/packages/authy
sudo unsquashfs -q -f -d "/opt/authy" "AUTHY.snap"
cd /opt/authy
sudo sed -i 's|${SNAP}/meta/gui/icon.png|authy|g' "/opt/authy/meta/gui/authy.desktop"
sudo cp meta/gui/authy.desktop /usr/share/applications
sudo cp meta/gui/icon.png /usr/share/pixmaps/authy.png
sudo rm -rf "/opt/authy"/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}
sudo ln -s /opt/authy/authy /usr/bin

# Calibre
sudo sed -i 's/Name=calibre/Name=Calibre/g' /usr/share/applications/calibre-gui.desktop
sudo sed -i '0,/Exec=/!{0,/Exec=/s/Exec=/Exec=env CALIBRE_USE_DARK_PALETTE=1 /}' /usr/share/applications/calibre-gui.desktop

# CEMU
# Pending

# Docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io

# docker-compose 1.29.2
sudo curl -SL https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo systemctl enable --now docker

# docker compose plugin (Compose v2)
sudo dnf install docker-compose-plugin

sudo systemctl enable --now containerd
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# droidcam
sudo dnf install libappindicator-gtk3 -y
cd /tmp
wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip
sudo unzip droidcam_latest.zip -d /opt/droidcam
cd droidcam && sudo ./install-client
sudo ./install-video

# Flutter
# https://docs.flutter.dev/development/tools/sdk/releases?tab=linux
sudo tar xvf FLUTTER.tar.xz -C /opt
sudo groupadd flutterusers
sudo gpasswd -a $USER flutterusers
sudo chown -R :flutterusers /opt/flutter
sudo chmod -R g+w /opt/flutter/
# Add to .zshrc
    # Flutter
    export PATH="$PATH:/opt/flutter/bin"
    export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
flutter doctor

# GitKraken
cd /tmp
wget https://release.gitkraken.com/linux/gitkraken-amd64.rpm
sudo dnf install ./gitkraken-amd64.rpm -y

# MATLAB
unzip -K MATLAB.zip -d matlab
# Error (Unable to launch the MATLABWindow application)
# ./bin/glnxa64/MATLABWindow, output: FT_Get_Color_Glyph_Layer
# export LD_PRELOAD=/lib64/libfreetype.so
su
./install
sudo tee -a /usr/share/applications/matlab.desktop > /dev/null <<EOT
[Desktop Entry]
Type=Application
Terminal=false
MimeType=text/x-matlab
Exec=env LD_PRELOAD=/lib64/libfreetype.so /usr/local/MATLAB/R2022a/bin/matlab -desktop
Name=MATLAB
Icon=matlab
Categories=Development;Math;Science
Comment=Scientific computing environment
StartupNotify=true
EOT

# MultiMC
cd /tmp
wget https://files.multimc.org/downloads/mmc-stable-lin64.tar.gz
sudo tar -xzf mmc-stable-lin64.tar.gz -C /opt
sudo ln -s /opt/MultiMC/MultiMC /usr/bin/multimc
sudo tee -a /usr/share/applications/multimc.desktop > /dev/null <<EOT
[Desktop Entry]
Version=1.0
Name=MultiMC
GenericName=Minecraft Launcher
Comment=Free, open source launcher and instance manager for Minecraft.
Type=Application
Terminal=false
Exec=multimc
Icon=/usr/share/icons/hicolor/scalable/apps/multimc.svg
Categories=Game
Keywords=game;minecraft;
EOT

sudo tee -a /usr/share/icons/hicolor/scalable/apps/multimc.svg > /dev/null <<EOT
<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" version="1">
 <path style="fill:#714f36" d="m 16.9,6.9 v 2 3 2 h -2.8 v -2 H 11.5 9.1 v -3 H 6.9 v 3 H 4 V 42 c 0,1.108 0.892,2 2,2 h 36 c 1.108,0 2,-0.892 2,-2 V 8.9 h -3.1 v 3 H 39 37.1 v -3 h -3.2 v 3 h -2 v 2 h -2.8 v -2 h -2.2 v 2 h -2.8 v -2 -3 h -2.2 v 3 h -2.8 v -3 -2 z"/>
 <path fill="#fff" opacity=".2" d="m4 7v-1c0-1.108 0.892-2 2-2h36c1.108 0 2 0.892 2 2v1c0-1.108-0.892-2-2-2h-36c-1.108 0-2 0.892-2 2z"/>
 <path opacity=".2" d="m4 42v1c0 1.108 0.892 2 2 2h36c1.108 0 2-0.892 2-2v-1c0 1.108-0.892 2-2 2h-36c-1.108 0-2-0.892-2-2z"/>
 <path style="fill:none;stroke:#78c629;stroke-width:3;stroke-linecap:round" d="m 14.5,20.49985 c 7,0 12,12.000075 19,12.000075 3.073181,0 5.999991,-3.171573 6,-6 9e-6,-2.828445 -2.926819,-6.000075 -6,-6.000075 -8,0 -12,12.000075 -19,12.000075"/>
 <path style="fill:none;stroke:#78c629;stroke-width:3;stroke-linecap:round" d="m 33.4,20.5 c -7.795053,0 -11.9,12.000075 -18.9,12.000075 -3.073181,0 -5.9999912,-3.171573 -6,-6 C 8.4999912,23.67163 11.426819,20.5 14.5,20.5"/>
 <path style="opacity:0.2" d="M 6,5 C 4.892,5 4,5.892 4,7 v 3 3 h 3 v -3 h 2 v 3 h 2.5 2.5 v 3 h 3 V 13 10 8 h 2 v 2 3 h 3 v -3 h 2 v 3 3 h 3 v -3 h 2 v 3 h 3 v -3 h 2 v -3 h 3 v 3 h 2 2 v -3 h 3 V 7 C 44,5.892 43.108,5 42,5 H 39 9 Z"/>
 <path style="fill:#629431" d="M 6,4 C 4.892,4 4,4.892 4,6 v 3 3 H 7 V 9 h 2 v 3 h 2.5 2.5 v 3 h 3 V 12 9 7 h 2 v 2 3 h 3 V 9 h 2 v 3 3 h 3 v -3 h 2 v 3 h 3 v -3 h 2 V 9 h 3 v 3 h 2 2 V 9 h 3 V 6 C 44,4.892 43.108,4 42,4 H 39 9 Z"/>
 <path style="fill:#ffffff;opacity:0.1" d="M 6 4 C 4.892 4 4 4.892 4 6 L 4 7 C 4 5.892 4.892 5 6 5 L 9 5 L 39 5 L 42 5 C 43.108 5 44 5.892 44 7 L 44 6 C 44 4.892 43.108 4 42 4 L 39 4 L 9 4 L 6 4 z"/>
 <path style="opacity:0.2" d="M 33.400391 22 C 32.722756 22 32.067399 22.125887 31.425781 22.34375 C 31.42483 22.341221 31.422788 22.340474 31.421875 22.337891 C 31.42078 22.340989 31.420982 22.34263 31.419922 22.345703 C 29.102249 23.134935 26.975756 25.198766 24.734375 27.537109 C 23.302539 29.030887 21.851928 30.585569 20.212891 31.822266 C 18.573853 33.058962 16.678574 34 14.5 34 C 12.447401 34 10.616812 32.98763 9.2734375 31.607422 C 8.047187 30.347549 7.173753 28.739609 7.0292969 27 C 7.0155 27.166157 6.9999995 27.331589 7 27.5 C 7.000006 29.431604 7.930063 31.227214 9.2734375 32.607422 C 10.616812 33.98763 12.447401 35 14.5 35 C 16.678574 35 18.573853 34.058962 20.212891 32.822266 C 21.851928 31.585569 23.302539 30.030887 24.734375 28.537109 C 27.333863 25.825167 29.778575 23.481013 32.546875 23.070312 C 32.875012 23.061178 33.217923 23.041196 33.537109 23.037109 C 34.557682 23.037109 35.726903 23.610737 36.615234 24.523438 C 37.349467 25.277812 37.8202 26.222621 37.96875 27.037109 C 37.99993 26.866166 38.037108 26.692681 38.037109 26.537109 C 38.037112 25.64028 37.503566 24.436138 36.615234 23.523438 C 36.288338 23.187574 35.916721 22.917891 35.535156 22.685547 C 35.531855 22.675435 35.534953 22.670631 35.53125 22.660156 C 35.528539 22.667825 35.522578 22.668703 35.519531 22.675781 C 34.890851 22.296037 34.225289 22.055783 33.603516 22.041016 C 33.532628 22.020414 33.461353 22.000782 33.400391 22 z"/>
 <path style="opacity:0.2;fill:#ffffff" d="M 33.400391 19 C 28.73314 19 25.455924 22.450408 22.568359 25.462891 C 21.124577 26.969132 19.749236 28.414417 18.40625 29.427734 C 17.063264 30.441052 15.821426 31 14.5 31 C 13.479418 31 12.310203 30.426357 11.421875 29.513672 C 10.687645 28.75931 10.216912 27.814489 10.068359 27 C 10.037182 27.170942 9.9999995 27.344427 10 27.5 C 10.000003 28.396823 10.533547 29.600987 11.421875 30.513672 C 12.310203 31.426357 13.479418 32 14.5 32 C 15.821426 32 17.063264 31.441052 18.40625 30.427734 C 19.749236 29.414417 21.124577 27.969132 22.568359 26.462891 C 25.106485 23.814964 27.946022 20.830475 31.765625 20.146484 C 31.767315 20.151424 31.765818 20.155176 31.767578 20.160156 C 31.769894 20.153604 31.774873 20.150841 31.777344 20.144531 C 32.299625 20.051689 32.839726 20 33.400391 20 C 33.422086 19.999722 33.458883 19.998632 33.482422 19.998047 C 33.48919 19.998225 33.497189 19.999914 33.503906 20 C 34.277304 20 35.018673 20.143514 35.714844 20.396484 C 35.722646 20.412056 35.738231 20.422738 35.744141 20.439453 C 35.747829 20.42902 35.744805 20.420474 35.748047 20.410156 C 36.885812 20.830258 37.901464 21.54083 38.730469 22.392578 C 39.95672 23.652467 40.83016 25.260386 40.974609 27 C 40.988409 26.833843 41.003905 26.66841 41.003906 26.5 C 41.003912 24.568384 40.073844 22.772804 38.730469 21.392578 C 37.387095 20.012352 35.556514 19 33.503906 19 C 33.480427 18.999699 33.459007 19.003995 33.435547 19.003906 C 33.424684 19.003942 33.411128 18.999862 33.400391 19 z"/>
</svg>
EOT

# MS Teams
# https://packages.microsoft.com/yumrepos/ms-teams/
sudo dnf install TEAMS.rpm

# NVIDIA Gpu
sudo dnf install akmod-nvidia
# Install latest drivers from website MX450 https://www.nvidia.com/Download/driverResults.aspx/189809/en-us/
# Installer adds nouveau automatically to files:
# /usr/lib/modprobe.d/nvidia-installer-disable-nouveau.conf,                                                  
# /etc/modprobe.d/nvidia-installer-disable-nouveau.conf
# Or manually add to /usr/lib/modprobe.d/blacklist-nouveau.conf
    # blacklist nouveau
    # options nouveau modeset=0
    # sudo dracut --force

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 16
nvm install 10

# JAVA (sudo alternatives --config java)
# OpenJDK
sudo dnf install java-11-openjdk-devel.x86_64 java-latest-openjdk-devel.x86_64 -y
# Oracle
sudo mkdir /usr/local/java
sudo tar xvzf Downloads/JDK.tar.gz -C /usr/local/java
sudo nano /etc/profile
    JAVA_HOME=/usr/local/java/JDK
    PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
    export JAVA_HOME
    export PATH
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/JDK/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/JDK/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws.itweb" "javaws.itweb" "/usr/local/java/JDK/bin/javaws.itweb" 1

sudo update-alternatives --set java /usr/local/java/JDK/bin/java
sudo update-alternatives --set javac /usr/local/java/JDK/bin/javac
sudo update-alternatives --set javaws.itweb /usr/local/java/JDK/bin/javaws.itweb

# OBS
sudo dnf install kmod-v4l2loopback
sudo dnf install obs-studio
# CUDA sudo dnf install xorg-x11-drv-nvidia-cuda

# Opera (snap)
# Edit .desktop file /var/lib/snapd/desktop/applications 
# StartupWMClass=Opera

# Postman
# download https://www.postman.com/downloads/
sudo tar xzvf POSTMAN.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman
sudo tee -a /usr/share/applications/postman.desktop > /dev/null <<EOT
[Desktop Entry]
Name=Postman
GenericName=API Client
X-GNOME-FullName=Postman API Client
Comment=Make and view REST API calls and responses
Keywords=api;
Exec=/usr/local/bin/postman
Terminal=false
Type=Application
Icon=/opt/Postman/app/resources/app/assets/icon.png
Categories=Development;Utilities;
EOT

# QEMU-KVM
sudo dnf group install --with-optional virtualization -y
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

# ProtonGE
# https://github.com/GloriousEggroll/proton-ge-custom/releases
mkdir ~/.steam/root/compatibilitytools.d
tar -xf GE-ProtonVERSION.tar.gz -C ~/.steam/root/compatibilitytools.d/

# Retroarch
# Pending

# scrcpy
sudo dnf copr enable zeno/scrcpy
sudo dnf install scrcpy

# Spotify
lpf update

# TP-Link TL-WN823N
cd /opt
sudo git clone https://github.com/Mange/rtl8193eu-linux-driver
cd rtl8192eu-linux-driver
sudo dkms add .
sudo dkms install rtl8192eu/1.0
sudo echo -e "blacklist rtl8xxxu" | sudo tee -a /etc/modprobe.d/blacklist.conf
sudo depmod -a
# reboot

# tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

# WINE dependecy hell
sudo dnf install alsa-plugins-pulseaudio.i686 glibc-devel.i686 glibc-devel libgcc.i686 libX11-devel.i686 freetype-devel.i686 libXcursor-devel.i686 libXi-devel.i686 libXext-devel.i686 libXxf86vm-devel.i686 libXrandr-devel.i686 libXinerama-devel.i686 mesa-libGLU-devel.i686 mesa-libOSMesa-devel.i686 libXrender-devel.i686 libpcap-devel.i686 ncurses-devel.i686 libzip-devel.i686 lcms2-devel.i686 zlib-devel.i686 libv4l-devel.i686 libgphoto2-devel.i686 cups-devel.i686 libxml2-devel.i686 openldap-devel.i686 libxslt-devel.i686 gnutls-devel.i686 libpng-devel.i686 flac-libs.i686 json-c.i686 libICE.i686 libSM.i686 libXtst.i686 libasyncns.i686 liberation-narrow-fonts.noarch libieee1284.i686 libogg.i686 libsndfile.i686 libuuid.i686 libva.i686 libvorbis.i686 libwayland-client.i686 libwayland-server.i686 llvm-libs.i686 mesa-dri-drivers.i686 mesa-filesystem.i686 mesa-libEGL.i686 mesa-libgbm.i686 nss-mdns.i686 ocl-icd.i686 pulseaudio-libs.i686 sane-backends-libs.i686 tcp_wrappers-libs.i686 unixODBC.i686 samba-common-tools.x86_64 samba-libs.x86_64 samba-winbind.x86_64 samba-winbind-clients.x86_64 samba-winbind-modules.x86_64 mesa-libGL-devel.i686 fontconfig-devel.i686 libXcomposite-devel.i686 libtiff-devel.i686 openal-soft-devel.i686 mesa-libOpenCL-devel.i686 opencl-utils-devel.i686 alsa-lib-devel.i686 gsm-devel.i686 libjpeg-turbo-devel.i686 pulseaudio-libs-devel.i686 pulseaudio-libs-devel gtk3-devel.i686 libattr-devel.i686 libva-devel.i686 libexif-devel.i686 libexif.i686 glib2-devel.i686 mpg123-devel.i686 mpg123-devel.x86_64 libcom_err-devel.i686 libcom_err-devel.x86_64 libFAudio-devel.i686 libFAudio-devel.x86_64

sudo dnf groupinstall "C Development Tools and Libraries"
sudo dnf groupinstall "Development Tools"

sudo dnf install wine protontricks

# xpadneo
sudo dnf install dkms make bluez bluez-tools kernel-devel-`uname -r` kernel-headers-`uname -r`
cd /opt
sudo git clone https://github.com/atar-axis/xpadneo.git
cd xpadneo
sudo ./install.sh

# YUZU
# https://github.com/yuzu-emu/yuzu-mainline/releases
sudo tar xvf YUZU.tar.xz YUZU/yuzu YUZU/yuzu-cmd -C /usr/bin

sudo tee -a /usr/share/applications/yuzu.desktop > /dev/null <<EOT
[Desktop Entry]
Version=1.0
Type=Application
Name=yuzu
GenericName=Switch Emulator
Comment=Nintendo Switch video game console emulator
Icon=yuzu
TryExec=yuzu
Exec=yuzu %f
Categories=Game;Emulator;Qt;
MimeType=application/x-nx-nro;application/x-nx-nso;application/x-nx-nsp;application/x-nx-xci;
Keywords=Switch;Nintendo;
EOT

sudo tee -a /usr/share/icons/hicolor/scalable/apps/yuzu.svg > /dev/null <<EOT
<svg id="svg815" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 614.4 682.67"><defs><style>.cls-1{fill:none;}.cls-2{clip-path:url(#clip-path);}.cls-3{fill:#ff3c28;}.cls-4{fill:#0ab9e6;}</style><clipPath id="clip-path"><rect class="cls-1" x="-43" y="-46.67" width="699.6" height="777.33"/></clipPath></defs><title>Artboard 1</title><g id="g823"><g id="right"><g class="cls-2"><g id="g827"><g id="g833"><path id="path835" class="cls-3" d="M340.81,138V682.08c150.26,0,272.06-121.81,272.06-272.06S491.07,138,340.81,138M394,197.55a219.06,219.06,0,0,1,0,424.94V197.55"/></g></g></g></g><g id="left"><g class="cls-2"><g id="g839"><g id="g845"><path id="path847" class="cls-4" d="M272.79,1.92C122.53,1.92.73,123.73.73,274s121.8,272.07,272.06,272.07ZM219.65,61.51v425A219,219,0,0,1,118,119.18,217.51,217.51,0,0,1,219.65,61.51"/></g></g></g></g></g></svg>
EOT

# ZSH
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
sudo dnf install zsh exa
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/esc/conda-zsh-completion ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
nano .zshrc
# Replace ZSH_THEME="powerlevel10k/powerlevel10k"
# Add plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker docker-compose conda-zsh-completion)

# Pipewire
# Disable Auto mute to change between headphones and line out seamlessly
amixer -c 0 sset 'Auto-Mute Mode' Disabled

```