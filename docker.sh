set -ue
sudo systemctl enable --now docker.socket
sudo usermod -aG docker f
docker pull silex/emacs
docker run -it --name emacs silex/emacs bash
