sudo pacman -S --need pulseaudio cpupower emacs neovim xclip neofetch firefox flameshot screen network-manager-applet dosfstools reflector docker iotop qt5ct smartmontools v2raya-bin v2ray gparted woeusb vlc htop ntfs-3g newsflash os-prober kitty ripgrep gammastep ncompress apache nginx dolphin

# pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pipx install 'python-lsp-server[all]'

# 输入法
sudo pacman -S --need fcitx5 fcitx5-configtool fcitx5-config-qt fcitx5-rime wqy-microhei

#edit
sudo pacman -S --need hunspell aspell-en hunspell-en_us aspell

# python
sudo pacman -S --need python-pip python-docs

# wifi
sudo pacman -S --need fluxion rtl8812au-aircrack-dkms
