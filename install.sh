set -u

# ssh
git config --global user.name etcqez
git config --global user.email etcqez@outlook.com
git config --global init.defaultBranch main
git config --global http.version HTTP/1.1
git config --global core.quotepath false

# font
[[ ! -d /usr/share/fonts ]] && sudo mkdir /usr/share/fonts
sudo ln -sf ~/myconfig/myfonts /usr/share/fonts

# bash
sudo sh -c "cat ~/myconfig/zshalias >> /etc/bash.bashrc"

# sysctl
[[ ! -e /etc/sysctl.d ]] && sudo mkdir /etc/sysctl.d
sudo ln -s ~/myconfig/save/99-sysctl.conf /etc/sysctl.d/999-sysctl.conf

# usb-wakeup
sudo ln -sf ~/myconfig/save/90-usb-wakeup.rules /etc/udev/rules.d/90-usb-wakeup.rules

# rime
[[ ! -e ~/.local/share/fcitx5 ]] && mkdir -p ~/.local/share/fcitx5
ln -sf ~/myconfig/save/rime ~/.local/share/fcitx5
[[ -e ~/.config/fcitx5 ]] && rm -rf ~/.config/fcitx5
ln -s ~/myconfig/save/fcitx5 ~/.config

# sysrq
#[[ ! -a /etc/sysctl.d/99-sysctl.conf ]] && sudo mkdir /etc/sysctl.d/99-sysctl.conf
#sudo sh -c "echo -e 'kernel.sysrq = 1\nvm.swappiness = 1' > /etc/sysctl.d/99-sysctl.conf"

## vlc
#[[ -d ~/.config/vlc ]] && rm ~/.config/vlc
#[[ -a ~/.config ]] && mkdir ~/.config
#ln -s ~/myconfig/save/vlc ~/.config/

# fonts
#ln -sf ~/myconfig/save/fonts ~/.local/share/fonts
# hypr
#mv ~/.config/hypr/userprefs.conf{,.bak}
#ln -sf ~/myconfig/save/userprefs.conf ~/.config/hypr/userprefs.conf

# x11
ln -sf ~/myconfig/_zprofile ~/.zprofile; ln -sf ~/myconfig/_zprofile ~/.xsession; ln -sf ~/myconfig/_zprofile ~/.xprofile
