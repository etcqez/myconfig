sed -i "s@http://http.kali.org/kali@https://mirrors.tuna.tsinghua.edu.cn/kali@g" /etc/apt/sources.list
sudo mv /etc/apt/apt.conf.d/80snapper{,.bak}
sudo systemctl disable snapper-boot.timer snapper-cleanup.timer snapper-timeline.timer
