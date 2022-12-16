#### Clone .dotfiles

#### Virsh
```
virsh net-start default
virsh net-autostart default
```

#### MS Fonts
```
# Put fonts in ~/ttf_ms_win10 folder
git clone https://aur.archlinux.org/ttf-ms-win10.git "$HOME/.cache/yay/ttf-ms-win10"
cp -a "$HOME/ttf_ms_win10/." "$HOME/.cache/yay/ttf-ms-win10" 
yay -S ttf-ms-win10
```

#### Anaconda
```
sudo chown -R :anaconda /opt/anaconda
sudo chmod -R 775 /opt/anaconda
sudo sed -i "s,#IgnorePkg   =.*,IgnorePkg   = anaconda,g" /etc/pacman.conf
conda config --set auto_activate_base False
```

#### Setup edid.bin
```
if isDesktop then
  sudo nvidia-xconfig --custom-edid="GPU-0.DP-2:/etc/X11/edid.bin"
fi
```

#### Setup repos (personal/work)

#### Setup email, software licenses, themes, steam, accounts

#### Setup emulators config
