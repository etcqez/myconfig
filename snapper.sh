set -ue
sudo snapper create-config -f btrfs /
sudo snapper set-config "TIMELINE_CREATE=no"
sudo snapper set-config "TIMELINE_CLEANUP=no"
