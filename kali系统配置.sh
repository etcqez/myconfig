# 换源
sed -i "s@http://http.kali.org/kali@https://mirrors.tuna.tsinghua.edu.cn/kali@g" /etc/apt/sources.list

# 防止snapper 在安装软件时自动备份快照
sudo mv /etc/apt/apt.conf.d/80snapper{,.bak}
# 禁止snapper重启时自动备份快照
sudo systemctl disable snapper-boot.timer snapper-cleanup.timer snapper-timeline.timer
