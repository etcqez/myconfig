set -u

# hypr
ln -sf ~/myconfig/appdate/userprefs.conf ~/.config/hypr/userprefs.conf

# zsh
ln -s ~/myconfig/_zprofile ~/.zprofile

# root
sudo sh -c "cat /home/f/myconfig/zshalias > /root/.bashrc"

#sysctl
sudo ln -s ~/myconfig/sysctl.conf /etc/sysctl.d/99-sysctl.conf

# keyd
sudo pacman -S --need --noconfirm keyd
sudo ln -s /home/f/myconfig/appdate/default.conf /etc/keyd

# rime
mkdir /home/f/.local/share/fcitx5
ln -s /home/f/myconfig/appdate/rime /home/f/.local/share/fcitx5

# fonts
ln -sf /home/f/myconfig/appdate/fonts /home/f/.local/share/fonts
