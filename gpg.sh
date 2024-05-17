echo keyserver hkps://keys.openpgp.org:443 > ~/.gnupg/gpg.conf
sudo sh -c "echo keyserver hkps://keys.openpgp.org > /etc/pacman.d/gnupg/gpg.conf"
