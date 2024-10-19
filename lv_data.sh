sudo mkdir /data && sudo chown $USER:$USSER /data
#sudo mkfs.btrfs /dev/mapper/vg_linux-lv_data
#sudo mount /dev/mapper/vg_linux-lv_data /data
#sudo btrfs su cr /data/@
#sudo umount -R /data
#sudo sh -c "echo '/dev/mapper/vg_linux-lv_data /data\tbtrfs\trw,noatime,compress=zstd:3,ssd,discard=async,space_cache=v2,commit=120,subvolid=256,subvol=/@\t0 0' >> /etc/fstab"
sudo sh -c "echo '/dev/nvme0n1p7 /data\tbtrfs\trw,noatime' >> /etc/fstab"
sudo mount -a
sudo systemctl daemon-reload
