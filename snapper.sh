set -ue
sudo pacman -S --need --noconfirm snapper
sudo snapper create-config -f btrfs /
sudo snapper -c home create-config -f btrfs /home
sudo snapper -c root set-config "TIMELINE_MIN_AGE=2592000"
sudo snapper -c home set-config "TIMELINE_MIN_AGE=2592000"
