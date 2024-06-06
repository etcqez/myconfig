sudo test ! -d /var/lib/bluetooth/F0:42:1C:30:00:5B && sudo mkdir /var/lib/bluetooth/F0:42:1C:30:00:5B
sudo cp -rf ~/myconfig/bluetooth/EA:07:21:44:BE:F6 /var/lib/bluetooth/F0:42:1C:30:00:5B/
sudo cp -rf ~/myconfig/bluetooth/E0:9D:FA:81:FC:AA /var/lib/bluetooth/F0:42:1C:30:00:5B/
sudo chown -R root:root /var/lib/bluetooth/F0:42:1C:30:00:5B/
