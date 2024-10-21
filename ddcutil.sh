sudo usermod -aG i2c $USER
sudo cp /usr/share/ddcutil/data/60-ddcutil-i2c.rules /etc/udev/rules.d

#可能需要
echo i2c_dev | sudo tee /etc/modules-load.d/i2c_dev.conf
sudo modprobe i2c_dev
pipx install ddcci-plasmoid-backend
