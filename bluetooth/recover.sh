sudo test -d /var/lib/bluetooth/ && sudo rm -rf /var/lib/bluetooth/
sudo cp -rf ~/myconfig/bluetooth/bluetooth/ /var/lib/
sudo chown -R root:root /var/lib/bluetooth/
