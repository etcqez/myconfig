sudo mount -o defaults,noatime,compress=zstd,commit=120,subvol=@ /dev/mapper/vg_linux-lv_gentoo /mnt/gentoo
sudo mkdir -p /mnt/gentoo/efi
sudo umount /efi
sudo mount /dev/nvme0n1p1 /mnt/gentoo/efi
sudo arch-chroot /mnt/gentoo
