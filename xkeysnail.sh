ln -sf ~/myconfig/_zprofile ~/.zprofile; ln -sf ~/myconfig/_zprofile ~/.xsession; ln -sf ~/myconfig/_zprofile ~/.xprofile

sudo groupadd -f uinput
sudo gpasswd -a $USER uinput

cat <<EOF | sudo tee /etc/udev/rules.d/70-xkeysnail.rules
KERNEL=="uinput", GROUP="uinput", MODE="0660", OPTIONS+="static_node=uinput"
KERNEL=="event[0-9]*", GROUP="uinput", MODE="0660"
EOF

