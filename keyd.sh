[[ ! -a /etc/keyd ]] && sudo mkdir /etc/keyd
sudo ln -sf /home/f/myconfig/save/default.conf /etc/keyd
sudo systemctl enable --now keyd.service
