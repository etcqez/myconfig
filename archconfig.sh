# reflector
sudo pacman -S --need --noconfirm reflector
sudo ln -sf /home/f/myconfig/appdate/reflector.conf /etc/xdg/reflector/reflector.conf
sudo systemctl enable --now reflector.timer
