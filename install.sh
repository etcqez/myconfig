set -u

git config --global user.name etcqez
git config --global user.email etcqez@outlook.com
git config --global init.defaultBranch main

# zsh
#ln -s ~/myconfig/_zprofile ~/.zprofile

# bash
sudo sh -c "cat /home/f/myconfig/zshalias >> /etc/bash.bashrc"

# sysctl
[[ ! -a /etc/sysctl.d ]] && sudo mkdir /etc/sysctl.d
sudo ln -s ~/myconfig/99-sysctl.conf /etc/sysctl.d/99-sysctl.conf

# keyd
[[ ! -a /etc/keyd ]] && sudo mkdir /etc/keyd
sudo ln -sf /home/f/myconfig/save/default.conf /etc/keyd

# usb-wakeup
sudo ln -sf /home/f/myconfig/90-usb-wakeup.rules /etc/udev/rules.d/90-usb-wakeup.rules

# rime
[[ -n /home/f/.local/share/fcitx5 ]] && mkdir -p /home/f/.local/share/fcitx5
ln -sf /home/f/myconfig/save/rime /home/f/.local/share/fcitx5

# sysrq
[[ ! -a /etc/sysctl.d/99-sysctl.conf ]] && sudo mkdir /etc/sysctl.d/99-sysctl.conf
sudo sh -c "echo -e 'kernel.sysrq = 1\nvm.swappiness = 1' > /etc/sysctl.d/99-sysctl.conf"

## vlc
#[[ -d ~/.config/vlc ]] && rm ~/.config/vlc
#[[ -n ~/.config ]] && mkdir ~/.config
#ln -s ~/myconfig/save/vlc ~/.config/

# fonts
#ln -sf /home/f/myconfig/save/fonts /home/f/.local/share/fonts
# hypr
#mv ~/.config/hypr/userprefs.conf{,.bak}
#ln -sf ~/myconfig/save/userprefs.conf ~/.config/hypr/userprefs.conf

