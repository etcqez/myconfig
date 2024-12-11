echo "适用于btrfs分区的子卷为@，卷组为vg_linux"
echo "请输入逻辑卷名字(如：lv_gentoo)及efi分区名(如：/efi)，用空格分隔"
read lvname efiname
sudo umount $efiname
sudo mount -o defaults,noatime,compress=zstd,commit=120,subvol=@ /dev/mapper/vg_linux-$lvname /mnt/
sudo mount /dev/nvme0n1p1 /mnt$efiname
