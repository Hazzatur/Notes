#!/bin/bash

username="$1"
isDesktop="false"

# Folders
declare -a folders=(
  "Personal"
)
for i in "${folders[@]}"
do
  mkdir -p "/home/$username/$i"
  chown -R $username:$username "/home/$username/$i"
done

# [GRUB]
sed -i "s/GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=hidden/g" /etc/default/grub

# [ZSH]
cmd=$(sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended)
runuser -u $username "$cmd"
git clone https://github.com/romkatv/powerlevel10k.git /home/$username/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$username/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions /home/$username/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/esc/conda-zsh-completion /home/$username/.oh-my-zsh/plugins/conda-zsh-completion
curl -o /home/$username/.oh-my-zsh/completions/_windscribe --create-dirs https://raw.githubusercontent.com/tjquillan/zsh-windscribe-completions/master/_windscribe
chown -R $username:$username /home/$username/.oh-my-zsh

# [Ansible]
[ -d /home/$username/Personal/ansible ] || git clone https://github.com/Hazzatur/ansible.git /home/$username/Personal/ansible
(cd /home/$username/Personal/ansible; git pull https://github.com/Hazzatur/ansible.git)
chown -R $username:$username /home/$username/Personal/ansible

# [Yay]
curl -o /home/$username/yay.sh https://raw.githubusercontent.com/Hazzatur/Notes/test/yay.sh
if [ $isDesktop = "false" ]; then
  sed -i "s/isDesktop='true'/isDesktop='false'/g" /home/$username/yay.sh
fi
chown $username:$username /home/$username/yay.sh
chmod +x /home/$username/yay.sh
runuser -u $username /home/$username/yay.sh
rm /home/$username/yay.sh
