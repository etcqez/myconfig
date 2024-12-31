sudo pacman -S mariadb
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl enable --now mariadb.service

# sudo 不需要密码
sudo mariadb --user root

# 修改root密码
mariadb-admin -u root -p password

# mysql客户端
sudo pacman -S dbeaver
