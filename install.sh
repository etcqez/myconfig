set -u

# zsh
ln -s ~/myconfig/_zprofile ~/.zprofile

# keyd
sudo pacman -S --need --noconfirm keyd
sudo ln -s /home/f/myconfig/appdate/default.conf /etc/keyd

# rime
mkdir /home/f/.local/share/fcitx5
ln -s /home/f/myconfig/appdate/rime /home/f/.local/share/fcitx5
