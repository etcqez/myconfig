set -u

git config --global user.name etcqez
git config --global user.email etcqez@outlook.com

# hypr
mv ~/.config/hypr/userprefs.conf{,.bak}
ln -sf ~/myconfig/appdate/userprefs.conf ~/.config/hypr/userprefs.conf

# zsh
ln -s ~/myconfig/_zprofile ~/.zprofile

# bash
sudo sh -c "cat /home/f/myconfig/zshalias >> /etc/bash.bashrc"

# sysctl
sudo ln -s ~/myconfig/99-sysctl.conf /etc/sysctl.d/99-sysctl.conf

# keyd
sudo pacman -S --need --noconfirm keyd
sudo ln -s /home/f/myconfig/appdate/default.conf /etc/keyd
sudo systemctl enable keyd --now

# usb-wakeup
sudo ln -sf /home/f/myconfig/90-usb-wakeup.rules /etc/udev/rules.d/90-usb-wakeup.rules

# rime
mkdir /home/f/.local/share/fcitx5
ln -s /home/f/myconfig/appdate/rime /home/f/.local/share/fcitx5

# fonts
#ln -sf /home/f/myconfig/appdate/fonts /home/f/.local/share/fonts
