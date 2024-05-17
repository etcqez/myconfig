set -ue
sudo pacman -S --need --noconfirm snapper
sudo snapper create-config -f btrfs /
sudo snapper set-config "TIMELINE_CREATE=no"
