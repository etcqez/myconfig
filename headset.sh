sudo test ! -d /var/lib/bluetooth/F0:42:1C:30:00:5B/E0:9D:FA:81:FC:AA && sudo mkdir /var/lib/bluetooth/F0:42:1C:30:00:5B/E0:9D:FA:81:FC:AA
sudo test ! -d /var/lib/bluetooth/EA:07:21:44:BE:F6 && sudo mkdir /var/lib/bluetooth/EA:07:21:44:BE:F6
sudo ln -f ~/myconfig/bluetooth/EA:07:21:44:BE:F6/* /var/lib/bluetooth/F0:42:1C:30:00:5B/EA:07:21:44:BE:F6/
sudo ln -f ~/myconfig/bluetooth/E0:9D:FA:81:FC:AA/* /var/lib/bluetooth/F0:42:1C:30:00:5B/E0:9D:FA:81:FC:AA/
