sudo ntfsfix /dev/nvme0n1p4;sudo mount -o rw /dev/nvme0n1p4 /mnt
cd /mnt/Windows/System32/config
chntpw -e system

cd ControlSet001\Services\BTHPORT\Parameters\Keys
cd f0421c30005b
hex e09dfa81fcaa

sudo su
cd /var/lib/bluetooth/F0\:42\:1C\:30\:00\:5B/E0\:9D\:FA\:81\:FC\:AA/
sudo cp -r ~/myconfig/bluetooth/EA:07:21:44:BE:F6 /var/lib/bluetooth/F0:42:1C:30:00:5B/
sudo cp -r ~/myconfig/bluetooth/E0:9D:FA:81:FC:AA /var/lib/bluetooth/F0:42:1C:30:00:5B/

