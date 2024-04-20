sudo pacman -S --need cpupower emacs neovim xclip neofetch firefox screen network-manager-applet dosfstools reflector iotop qt5ct smartmontools gparted woeusb vlc htop ntfs-3g newsflash os-prober kitty ripgrep gammastep ncompress apache nginx dolphin tcpdump iotop smartmontools pipewire-pulse python-pipx v2raya-git cpu-x virtualbox usbutils pot-translation-git snapper tesseract-ocr-eng net-tools wireshark-qt nmap syncthing at jupyter-notebook

# pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pipx install 'python-lsp-server[all]'

# 输入法
sudo pacman -S --need fcitx5 fcitx5-configtool fcitx5-config-qt fcitx5-rime wqy-microhei

#edit
sudo pacman -S --need hunspell aspell-en hunspell-en_us aspell

# python
sudo pacman -S --need python-pip python-docs
