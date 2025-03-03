# ps -ef
# ps aux
# lsof -i:6379
#
# stow
# 覆盖已存在的文件
# stow --adopt .

# macos
alias b="brew install"
alias yq="yabai -m query --windows | grep app"
alias ps -ef

# ddcutil 亮度控制
alias d+="ddcutil -b 5 setvcp 10 + 5"
alias d-="ddcutil -b 5 setvcp 10 - 5"

# git
# alias gi="git init -b main"
# sudo dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress oflag=sync
alias gi="git init;gam"
alias gam="git add * .*;git commit -am '更新配置文件'"
alias gg="git remote get-url origin"
alias grr="git remote remove origin"
alias gra="git remote add origin"
alias gs="git status"
alias gcl="git clone --depth 1"
alias ga="git add"
alias gc="git commit"
alias gps="git push --set-upstream origin main"
alias gpl="git pull"
alias gl="git log"
alias gp="gam;git push"
function g {
  if [ "~" -eq "$2" ]; then
    git clone --depth 1 git@github.com:etcqez/"$1".git ~/.config/"$1"
  else
    git clone --depth 1 git@github.com:etcqez/"$1".git ~/".$1"
  fi
}

test -f /bin/pipx && eval "$(register-python-argcomplete pipx)"

# pyenv
[ -e ~/.pyenv/bin/pyenv ] && eval "$(pyenv virtualenv-init -)"

# 函数
function mcd {
  mkdir $1 && cd $1;
}
function ,touch {
mkdir -p "$(dirname "$1")" && touch "$1"
}
function ,take() {
mkdir -p "$(dirname "$1")" && touch "$1" && take "$(dirname "$1")"
}

# show error
alias j="journalctl"
alias jx="journalctl -xe" # xe (x: show explanatory texts e: end)
alias ju="journalctl -u" # u: unit
alias jbl="journalctl -u bluetooth"
alias dm="sudo dmesg"
#
# memorandum
# sudo sysctl --system
# nixos
alias ni="sudo nix-env -iA"
alias niu="sudo nix-env --uninstall"
# alias nc="vim ~/mynix/configuration.nix"
alias ns="sudo nixos-rebuild switch"
# 字体
alias font="fc-list :lang=zh"
alias fcc="sudo fc-cache -f -v"

#同步文件系统
# ext4: resize2fs /dev/lvm
# xfs: xfs_growfs /mountpoint
# btrfs: sudo btrfs filesystem resize max /
#lvm
# lvcreate -n lv1 -l 100%vg vg0 (100%vg: 卷组的百分比)
# lvextend -l +100%free /dev/mapper/vg1-lv1 (100%free: 剩于的百分比)
# lvextend -r -l +100%free /dev/mapper/vg1-lv1 #  -r: 既扩展空间又扩展文件系统
# 缩减逻辑卷 (ext4)
# umount /dev/VG_NAME/LV_NAME
# fsck -f /dev/VG_NAME/LV_NAME
# resize2fs /dev/VG_NAME/LV_NAME 1G
# lvreduce -L 1G /dev/VG_NAME/LV_NAME
# mount
# thin
#s udo lvcreate -L 150G -T vg_linux/thin_pool
# sudo lvcreate -V 50G -T vg_linux/thin_pool -n thin_pop
# sudo lvremove vg_linux/thin_pop
alias lvs="sudo lvs"
alias vgs="sudo vgs"
alias pvs="sudo pvs"

# export TERM=xterm-256color
# export COLORTERM=truecolor
#export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

# emacs verm
# vterm_printf() {
#   if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
#     # Tell tmux to pass the escape sequences through
#     printf "\ePtmux;\e\e]%s\007\e\\" "$1"
#   elif [ "${TERM%%-*}" = "screen" ]; then
#     # GNU screen (screen, screen-256color, screen-256color-bce)
#     printf "\eP\e]%s\007\e\\" "$1"
#   else
#     printf "\e]%s\e\\" "$1"
#   fi
# }
# if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
#   alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
# fi

function help(){
  bash -c "help $@"
}

alias re="echo $?"
#vim 编辑二进制: vim -b /bin/ls -> :%!xxd -> :%!xxd -r

# 静态链接: 把库和程序本身打包在一起成一个文件    动态链接: 程序和库分离
# 查看程序需要的库: ldd /bin/ls
# 查看已经加载的库: ldconfig -p

#压缩: zip -r dir dir  解压: unzip dir.zip -d /opt
#打包: tar cvf dir.tar *  预览: tar tvf dir.tar  解压到当前目录: tar xvf ../dir/dir.tar  解压到指定目录: tar xvf dir.tar -C ../桌面
#打包压缩: z: gz  j: bz2  J: xz
#          sudo tar zcf etc.tar.gz /etc
#          sudo tar jcf etc.tar.bz2 /etc
#          sudo tar Jcf etc.tar.xz /etc
#          sudo zip -r etc.zip /etc
#解压: sudo tar xf etc.tar.xz -C /tmp (xf通用)
#不包含目录本身,只打包目录内的文件和子目录: cd /etc -> sudo tar Jcf ~/etc.xz *
#tar实现快速复制: time tar c /boot | tar x -C ./    real	0m0.733s
#                 time cp -a /boot /opt/    real	0m0.093s
# --exclude: 排除文件   -T /root/includefilelist: 包含文件列表  -X /root/excludefilelist: 排除的文件列表 (TX后接的是文件)
# split (分割文件): split -b 1M -d etc.xz t/etc_xz (-d: 后缀为数字)   合并: cat etc_xz* > etc.xz
# cpio: find /etc | cpio -ov > etc.cpio (-o: output) 同: tar cvf etc.tar /etc
#       预览: cpio -tv < etc.cpio 同: tar tvf etc.tar   find的查找的目录带有/etc这样的绝对路径,直接解压会覆盖/etc cp -r /etc .  (复制要打包的文件夹) -> find ./etc | cpio -ov > etc2.cpio (重新打包,发现路径带点) -> cpio -idv < /home/f/etc2.cpio (-d: 自动创建文件夹. 将标准输入解压至当前目录)
#查看linux源代码行数: tar xvf linux.tar.xz -> cat `find -name "*.c"` |wc -l

# 搜索: locate (updated) -i (不区分大小写) -n (只列前几个) -r (使用正则表达式)
# find -maxdepth -mindepth -depth (先处理目录内的文件,再处理目录本身) -name -iname -inum (节点编号相同,不同分区的文件节点可能相同) -ls -samefile (节点编号相同且在同一分区) -links -regex -type -empty -a (与条件,默认) -o -not (同!)
#     eg: find /misc/cd -name "tree*" -> rpm -ivh /misc/cd/Packages/tree-2.0.4-2.oe2203sp3.x86_64.rpm (tree没有信赖包,直接yum安装)
# -size [+,-][k,M,G,c(byte)]: 根据大小来查找 -atime [+,-]: 天 -amin (分钟)
# -perm [/|-] (/: 或 -: 并) eg: 1. -perm /444 (所有者或者所属组或者other有4有权限就可以) 2. -perm -444 (所有者并且所属组并且other有4有权限就可以) 3. perm -044 (不关心所有者) 4. find /bin/ -perm /7000 (只要有一个特殊权限) 5.find /bin/ -perm -7000 (需要3个特殊权限)
alias finds="sudo find /bin/ -perm /7000 | xargs ls --color=tty -lh --time=ctime -t"
# 查找并移动,删除,拷贝(rm,cp,mv)文件: -ok 命令 {} \; (固定格式: {}\;) (将找到的每个文件执行一个命令,交互式的)  -exec 命令 {} \; (没有交互)
# xargs: 将标准输入传给下一个命令,作为其的参数  查找并按大小排序: find -name "*.txt" | xargs ls -Sl
#        -n: 每行的参数个数
# 如果文件名包含空格: find -print0 | xargs -0 ls -Sl (-print0: 在标准输出中打印完整的文件名，后面跟一个空字符（而不是 -print 使用的换行符）。这样，包含换行符或其他类型空白的文件名就能被处理find输出的程序正确理解。该选项对应于 xargs 的 -0 选项)
alias findall="sudo find / \( -path '/sys' -o -path '/proc' -o -path '/run' -o -path '/.snapshots' -o -path '/tmp' \) -a -prune -o -iname" # 1. -a -prune -o 必须成对出现 2. \(\) 前后必须留空
alias findtmp="sudo find /tmp/ -iname"
alias shx="find -maxdepth 1 -mindepth 1 -name '*.sh' -exec chmod +x {} \;"
alias shrx="find -maxdepth 1 -mindepth 1 -name '*.sh' -exec chmod -x {} \;"

#shell脚本
#bash -n (语法检查) bash -x (调试代码)
#声明常量: readonly
#$_: (前一个命令最后一个参数) $SHLVL (shell嵌套层数) $- (关键字) h hash (set +h 禁用hash) H 历史 B 花括号
#set -e (当一个命令出错,及时止损,不继续执行) set -u (禁止使用未定义的变量)
#man 1p test
#read -p (提示) -s (静默输入) -n (指定输入字符长度) -t (超时时间)

#grep -m (最多匹配) -v (反转) -i (忽略大小写) -n -c -o -A -B -C -f (匹配文件每行的内容)
#正则表达式: . (匹配单个字符) [^] [.] (.在中括号里和在外面不一样,在中括号里表示.本身,在外面表示任意的一个字符) \? \+ \{n\} (匹配前面的字符出现n次) \{3,5\} (3到5) \<\> (单词的边界) \(\)  \|
#表示0到100: [1-9]\?[0-9]|100
#排除空行和#开头的行: grep '^[^#]' ([^#]: 不以#开头的一个字符)
#sed -n '/root/!p' /etc/passwd (不打印包括root的行,//中表示正则表达式)

# 阻止文件被修改
# sudo chattr +i f.txt -> lsattr f.txt -> sudo chattr -i f.txt (另-a只能追加内容)
#特殊权限
# suid: s -> owner
# sgid: s -> group
#       继承组: 如果s设置在文件夹的所属组权限,那么里面新建的文件不管谁创建的文件将继承此文件夹的所属组
# sticky: t -> other
alias mods="sudo chmod u+s,u-x"
alias modx="sudo chmod u-s,u+x"
# umask 002
#( umask 666; touch ) 一次性改文件权限

#facl (tar打包不会保留facl权限,需要单独备份)
#给某人指定一个权限: setfacl -m u:user:- -> getfacl
#setfacl -x u:user (删除) setfacl -b (全部删除)
alias facl="sudo setfacl -m u:f:rwx"
#递归添加acl权限: setfacl -Rm u:user:rwx dir/ -> setfacl -Rb /dir (删除,比起chmod -R安全得多)
#                 给数据库加权限: setfacl -Rm u:mysql:rwx /usr/local/mysql/ -> Rb /usr/local/mysql/
#mask只影响除所有者和other的之外的人和组的最大权限
#如果chmod没有执行权限: sudo setfacl -m u:f:rwx /bin/chmod -> sudo chmod a+x /bin/chmod -> sudo setfacl -b /bin/chmod -> sudo chmod a+x /bin/chmod

#权限
#chmod -R a+X (递归的只给文件夹添加执行权限,而不给文件添加执行权限)
#如果拥有一个文件夹写权限,就可以删除文件,而和被删除的文件无关

#用户
#sudo getent passwd f
#创建系统账号: useradd -r -u -g -s -d -c (r:uid低于1000且不创建家目录)
#组: gruops  f (查看用户的组) sudo groupmems -l -g f (查看组包含的用户, g: 指定用户替换当前用户)
#参考某个文件来修改文件的所有者: chown --reference=
#更改文件所属组: chgrp

#自动设置密码
#passwd --stdin <

#tr
#小写转大写: tr 'a-z' 'A-Z'
#            tr '[:lower:]' '[:upper:]'
#生成随机密码: tr -dc '[:alnum:]' < /dev/urandom (d: 删除 c: 补集 urandom: 随机字符,包括可见的和不可见的)
#              openssl rand -base64 12
#去重: df | tr -s ' '

#程序生成
#seq -s+ 1 100 | bc (1到100相加) echo {1..100} | tr ' ' + | bc
#管道符后面必须支持标准输入, 每个命令在管道里面作为独立的进程(子进程) (在shell中子父进程互不共享变量,所以管道里的变量不能在父进程中使用)
#单行重定向: cat > cat.log (每回车一次追加一行)
#多行重定向: cat > cat.log <<EOF
#多行重定向并打印: cat <<EOF | tee cat.log (tee接在管道后打印并输出到文件)

#proc里存的是进程编号
#查看进程的路径: tail -f -> ps aux | grep tail -> ll /proc/20759/cmd
# $$:当前shell进程编号 (ll /proc/$$)
# self:当前命令的进程编号 (ll /proc/self)
# 0 1 2 : 输入,输出,错误重定向

#硬链接
#本质上是同一文件,inode,链接数相同,只要链接数不为0,删除文件不会有影响
#在删除数据库时可以先建个硬链接,减少磁盘IO

#批量改名
#rename conf conf.bak * (将conf变成conf.bak)
#rename .bak '' * (删除.bak)

#删除大文件的正确方式
#1.大文件被使用时删除不会立即释放空间
#solusion: lsof | grep delete (找到已删除但还在用的文件) -> 关掉软件
#          fuser -v   将使用此文件的进程全杀死: fuser -km
#2.如何正确删除大文件
#solusion: cat /dev/null > big (将文件清零)

#通配符
#0个或者多个: *
#一个: ? (ls ??.py)
#前一个工作目录: ~- (cat ~-/排序.py)
#查看上个目录: echo $OLDPWD
#[0-9]: 从0-9的一个数字 (ll file[0-9].txt)

#格式转换
#文本
#文件转换换行:dos2unix unix2dos (unix和win使用的换行不同)
#转换编码:iconv -f GB2312 win.txt -o unix.txt (将gb2312转换为utf8)
#iconv -f UTF8 -t GB2312 unix.txt -o win.txt (反之. from...to...output)

#常用命令
#date +"%F %T"
#touch `date +%F_%H-%M-%S`.log
#date -d "2 day"; date  +%s; (seconds since the Epoch) date -d @`date  +%s`; date -s "-1 year"; (设置时间为1年前) date -d "-2 day" +%w (前天星期几,w: week)
#ll --time=ctime anaconda-ks.cfg (查看属性修改时间) stat anaconda-ks.cfg (查看所有时间)
#cat -A (显示隐藏) -b -n (加行号) -s (压缩重复行)
#用cat实现文件复制: cat > dest < souce
#tac: 从尾到头 rev: 行逆序
# less, more, head -n3 (n可省略) -c3 (前3个字节) , head -2 < file(可以接收标准输入,显示文件前两行), tail -f, tail -F (文件被删重试) tail -fn0 -0f (指定查看后0行的内容) ifconfig | head -2 | tail -1 (显示第2行) seq 10 | tail -n +3 (跳过2行从3行开始打印)
#cut -d: -f1,3-5 /etc/passwd (取出1,3,4,5列) df | cut -c43-45     paste 两个文件横向合并
#sort /etc/passwd (字母排序) sort -nrt: -k3 /etc/passwd (-n: 数字排序)
#文件去重: uniq -u 打印不重复的行 -d 重复的行 -c 重复出现的次数
#diff -u;      cmp (比较二进制): cmp /bin/{dir,ls} -> hexdump -s 24 -Cn 7 /bin/ls; hexdump -s 24 -Cn 7 /bin/dir (-s: 跳过24字节)

#############################################################################

#查看帮助
#whatis = man -f (mandb)
#内部命令:help history,man bash
#配置文件:whatis passwd -> man 5 passwd
#passwd	whatis issue -> man 5 issue -> man 8 agetty (SEE ALSO)

#二进制
#echo a | hexdump -C
#man ascii
#screen
#建立:screen -S help
#查看:screen -list
#连接:screen -x help
#detach:ctrl a d

#w(uptime) who whoami tty
#w,who:查看谁登录了系统

#杳看硬件.操作系统信息 	id	lsblk
alias fr="free -h"
alias release="cat /etc/*-release"
alias cpu="cat /proc/cpuinfo"
alias part="cat /proc/partitions"
alias swap="cat /proc/swaps"
alias me="sudo dmidecode -t memory"
alias version="cat /proc/version"
alias cmdline="cat /proc/cmdline"
alias sysrq="sudo sh -c 'echo 1 > /proc/sys/kernel/sysrq'"
alias timezone="sudo timedatectl set-timezone"
alias ntp="sudo timedatectl set-ntp 1"
alias cal="cal -y"
alias eng="LANG=en_US.UTF-8"
alias loc="locale"
alias rs="echo \$?"
alias nvme="sudo smartctl /dev/nvme0n1p1 -a"
alias mt="mount | column -t"
alias blk="lsblk -f"
alias route="route -n"
alias grubmk="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias grubin="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch"
alias p="ping"
alias io="sudo iotop -o -d 2 -q"
alias iotop="sudo iotop"

# 磁盘管理
# 创建设备文件: mknod nvme1 b 259 1 (b: 块设备 259: 设备类型 1: 设备编号)
# 测试硬盘速度: dd if=/dev/nvme0n1 of=/dev/null bs=1M count=1024
# 扫描磁盘 alias scandisk="eecho - - - > /sys/class/scsi_host/host0/scan;echo - - - > /sys/class/scsi_host/host1/scan;echo - - - > /sys/class/scsi_host/host2/scan;"
# 备份还原分区表: dd if=/dev/sda of=/data/dpt.img bs=1 count=64 skip=446 (备份) -> dd if=/dev/zero of=/dev/sda bs=1 count=64 seek=446 (破坏,seek: 跳过目标) -> dd if=dpt.img of=/dev/sda bs=1 seek=446
# 添加ip: ip a a 10.0.0.8/24 dev ens33
# 打印分区: sudo parted /dev/nvme0n1 print    分区: parted /dev/sdb mkpart primary 1 200    删除分区: parted /dev/sdb rm 1

# 转二进制
# bc -> obase=2 (out)
# 显示路径
# type which where whereis(包括帮助文件目录)

# history
# !! !:n !n !-n !string !?string !?string:p
# !* !^ !$ !-4:*:p

#############################################################################

# 前端
alias cnpm="npm --registry=https://registry.npmmirror.com  --cache=$HOME/.npm/.cache/cnpm  --disturl=https://npmmirror.com/mirrors/node  --userconfig=$HOME/.cnpmrc"

# android
alias an="screen waydroid show-full-ui"
alias anstop="waydroid session stop"

#cd
alias cf="cd ~/.config/"
alias cl="cd ~/.local/share/"
alias cm="cd ~/myconfig/"
function c {
  cd ~/.config/$1;
}
alias desk="cd ~/Desktop/"
alias docu="cd ~/Documents/"

#type
alias ty="type -a" #同where
alias wh="which -a"

# windows
# sudo woeusb --device ./tiny11\ 23H2\ x64.iso  /dev/sda --target-filesystem ntfs
# alias win="sudo ntfsfix /dev/nvme0n1p5;sudo mount /dev/nvme0n1p5 /mnt;sudo mount -o rw /dev/nvme0n1p5 /mnt"
alias umnt="cd; sudo umount -R /mnt"
alias um="cd; sudo umount -R"

#system
#
# systemd
alias rl="sudo systemctl daemon-reload"
alias sus="systemctl suspend -i"
alias en="sudo systemctl enable --now"
alias di="sudo systemctl disable --now"
alias uen="systemctl --user enable --now"
alias udi="systemctl --user disable --now"
alias st="sudo systemctl status"
alias ust="systemctl --user status"
alias sto="sudo systemctl stop"
alias usto="systemctl --user stop"
alias sta="sudo systemctl start"
alias usta="systemctl --user start"
alias res="sudo systemctl restart"
alias ure="systemctl --user restart"
alias br="sudo systemctl restart bluetooth"
alias bre="sudo modprobe -r btusb; sudo modprobe btusb; sudo systemctl restart bluetooth"
alias blbackup="sh ~/myconfig/bluetooth/backup.sh"
alias blrecover="sh ~/myconfig/bluetooth/recover.sh; sudo systemctl restart bluetooth"
alias binfo="sudo bash -c 'cat /var/lib/bluetooth/*/*/info'"

# vim emacs
# function ee(){
#   # if ps aux | grep -i "emacs" | grep -v "grep"
#   if pgrep -x Emacs > /dev/null
#   then
#     TERM=xterm-emacs emacsclient -t $1
#   else
#     emacs --daemon
#     TERM=xterm-emacs emacsclient -t $1
#   fi
# }
# function e(){
#   # if ps aux | grep -i "emacs" | grep -v "grep"
#   if pgrep -x Emacs > /dev/null
#   then
#     TERM=xterm-emacs emacsclient -t $1
#   else
#     emacs &
#   fi
# }

function ee () {
  # 使用 emacsclient 执行 Elisp 代码来获取帧的数量
  frame_count=$(emacsclient -e "(length (frame-list))" 2>/dev/null)

# 检查命令是否成功执行以及帧的数量是否为数字
if [ $? -eq 0 ] && [[ $frame_count =~ ^[0-9]+$ ]]; then
  # 判断帧数量是否大于 1
  if [ "$frame_count" -gt 1 ]; then
    # emacsclient -e "(my/raise-frame-and-open-file \"$1\")" -n -a ""
    emacsclient -n -a "" $@;emacsclient -e "(select-frame-set-input-focus (selected-frame))"
  else
    # emacsclient -e "(my/raise-frame)" -n -c -a "" $@
    emacsclient -n -c -a "" $@;emacsclient -e "(select-frame-set-input-focus (selected-frame))"
  fi
else
  emacs --daemon && emacsclient -n -c -a "" $@
fi
# sleep 0.5
# yabai -m query --windows | jq -r 'map(select(.app == "Emacs")) | first | .id' | xargs -I{} yabai -m window --focus {}
}

alias e='TERM=xterm-emacs emacsclient -nw -c -a ""'
export EDITOR='emacsclient -nw -c'
# export EDITOR='TERM=xterm-emacs emacsclient -nw -c -a ""'

alias zs="nvim ~/myconfig/zshrc"
alias doc="cd ~/myconfig/doc"
alias dot="cd ~/dotfiles/"
alias docc="$EDITOR ~/myconfig/doc/c.sh"
alias docj="$EDITOR ~/myconfig/doc/java.sh"
alias doce="$EDITOR ~/myconfig/doc/emacs.sh"
alias docv="$EDITOR ~/myconfig/doc/vim.sh"
alias docn="$EDITOR ~/myconfig/doc/nvim.sh"
alias docjs="$EDITOR ~/myconfig/doc/js.sh"
alias docnano="$EDITOR ~/myconfig/doc/nano.sh"
alias zp="$EDITOR ~/myconfig/_zprofile"
# alias vr="ee ~/.vim/vimrc"
alias n="nvim"
alias v="nvim"
alias sv="sudo nvim"
alias .="source ~/myconfig/zshrc"
alias fv="nvim \$(fzf) "
alias emacsbef="emacs -nw --init-directory=~/.emacs.d.bef -bg black"
alias doom="emacs -nw --init-directory=~/.config/emacs"
# alias xk="sudo screen ~/.local/bin/xkeysnail -q /home/f/myconfig/config.py"
# alias xkw="sudo ~/.local/bin/xkeysnail --watch ~/myconfig/config.py"
alias pk="sudo pkill"
alias wm="xprop WM_CLASS"

# docker
#
# docker run -it --restart=always --name emacs silex/emacs bash
# docker update --restart=always emacs
# docker update --restart=no
# sudo docker info
#
alias eee="docker attach --detach-keys 'ctrl-z,ctrl-q' emacs"
alias d="docker"
alias dup="docker update"
alias oneemacs="docker run -it --rm silex/emacs"
alias dex="docker exec -it"
alias dat="docker attach"
alias dim="docker images"
alias dsp="docker stop"
alias dst="docker start"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dre="docker restart"
alias ddf="docker system df"
alias drm="docker rm"
alias dri="docker rmi"

# snapper
# snapper -c root status 0..2
# snapper -c root list
# snapper -c root create -t single
# sudo snapper create-config -f btrfs /
# sudo snapper list-configs
# 删除配置: snapper -c root delete-config
alias sn="sudo snapper status"
alias un="sudo snapper undochange"
alias li="sudo snapper list"
alias de="sudo snapper delete"
alias pr="sudo snapper -c root create -t pre -p"
alias po="sudo snapper -c root create -t post -p --pre-number"

# arch
alias s="sudo pacman -S"
alias sy="sudo pacman -Sy"
alias syyu="sudo pacman -Syyu"
alias Syyu="yay -Syyu --noconfirm"
# Remove dependencies not required by other packages
alias rs="sudo pacman -Rs"
# Remove all dependent packages
alias rc="sudo pacman -Rc"
alias yaycacha="yay -Scc Cache directory: /var/cache/pacman/pkg"
alias y="yay -S --noconfirm"
alias qs="pacman -Qs" # pacman -Qs pipewire
alias rr="sudo pacman -Rd --nodeps"

# fedora
alias d="sudo yum install"

# debian
alias ai="sudo apt install"
alias au="sudo apt update"

# ##gentoo
# alias mng="sudo mount -o defaults,noatime,compress=zstd,commit=120,subvol=@ /dev/mapper/vg_linux-lv_gentoo /mnt/gentoo"
# alias chg="sudo arch-chroot /mnt/gentoo"
# alias mnc="mg;cg"
# alias umg="sudo umount -R /mnt/gentoo"
# alias e="sudo emerge"
# alias ne="sudo emerge --newuse"
# alias es="sudo emerge --sync"
# alias ew="sudo emerge --update --jobs --newuse --deep --with-bdeps=y @world"
# alias ed="sudo emerge --depclean"
# alias rebu="sudo emerge --ask @module-rebuild"
# alias dp="sudo dispatch-conf"

# hugo
alias hs="hugo server"
alias hn="hugo new "
alias hc="hugo --cleanDestinationDir"

# python
alias pyenv="~/.pyenv/bin/pyenv"
alias py="python"
alias pydoc="sudo pydoc -p 80"
alias jn="jupyter notebook"
alias i="ipython"

# proxy
# alias v2="env all_proxy='socks://127.0.0.1:20170' https_proxy='http://127.0.0.1:20170' http_proxy='http://127.0.0.1:20170'"
# alias cl="env all_proxy='socks://127.0.0.1:7890' https_proxy='http://127.0.0.1:7890' http_proxy='http://127.0.0.1:7890'"
#export http_proxy="http://127.0.0.1:20122"; export https_proxy="http://127.0.0.1:20122"
alias sb='export http_proxy="http://127.0.0.1:20122"; export https_proxy="http://127.0.0.1:20122"'
alias ge='export http_proxy="http://127.0.0.1:9910"; export https_proxy="http://127.0.0.1:9910"'
alias ge5='export http_proxy="http://127.0.0.1:19999"; export https_proxy="http://127.0.0.1:19999"'
alias hi='export http_proxy="http://127.0.0.1:12334"; export https_proxy="http://127.0.0.1:12334"'
alias ka='export http_proxy="http://127.0.0.1:3067"; export https_proxy="http://127.0.0.1:3067"'
alias va='export http_proxy="http://127.0.0.1:20171"; export https_proxy="http://127.0.0.1:20171"'

#single
alias lg="lazygit"
alias du="sudo du -sh"
alias df="df -hP"
alias mkdir="mkdir -pv"
alias h="history -50"
alias nf="neofetch"

#mysql
alias my='mysql -uroot -pf'
alias sql='mysql -uroot -pf mysql'

#less
alias m=less

#cp
alias cp="cp -aiv"
#同名文件只覆盖旧的
alias cpuv="\cp -auv"
#同名文件先备份再覆盖
alias cpb="\cp -av --backup=numbered"
alias mv="mv -iv"

#rm
alias t="tree -cr /tmp"
alias t2="tree -L 2"
#alias rmall="\rm -rf *;\rm -rf .[^.]*"
#cp /etc/skel/. (复制全部文件)
alias cpall="cp ."

#network
alias pw="cat /etc/passwd | awk -F: '{printf \"%-15s%s\n\",\$1,\$NF}'"
alias ii="iwctl station wlan1 get-networks"

# ls
#alias .file="ls -d .*"
#alias .dir="ls -d .*/"
#alias onlydir="ls -d */"
#alias onlyfile=""

# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# sudo
alias shsh="sudo sh -c"
alias refrat="command -v /usr/bin/reflector && sudo sh -c 'reflector --verbose -c CN --protocol https --sort rate --latest 5 --download-timeout 5 --threads 5 | tee /etc/pacman.d/mirrorlist' 2> /dev/null"
alias refage="command -v /usr/bin/reflector && sudo sh -c 'reflector --verbose --protocol https --sort age --latest 5 --download-timeout 5 --threads 5 | tee /etc/pacman.d/mirrorlist' 2> /dev/null"
alias tees="sudo tee -a"

##nvidia
#alias nviglx="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo | grep 'OpenGL renderer'"
#alias glx="glxinfo | grep 'OpenGL renderer'"
#alias nvi="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"

# rpm (/var/lib/rpm: rpm数据库)
# 解包(恢复删除文件): rpm2cpio /misc/cd/Packages/tree-2.0.4-2.oe2203sp3.x86_64.rpm | cpio -tv -> rpm2cpio /misc/cd/Packages/tree-2.0.4-2.oe2203sp3.x86_64.rpm | cpio -idv ./usr/bin/tree (只解压一个文件)
# 查:rpm -qa "*http*" 同: rpm -qa | grep http (通配符必须加双引号)  rpm -qi tree (包信息)  同: rpm -qpi /misc/cd/Packages/tree-2.0.4-2.oe2203sp3.x86_64.rpm  rpm -qpl /misc/cd/Packages/tree-2.0.4-2.oe2203sp3.x86_64.rpm (列出包含文件) 同: rpm -ql tree
#    查看文件来自那个包: rpm -qf /usr/bin/tree      --replacepkgs|force (强制安装)   rpm -q --whatrequires bash (查询依赖的包)  -qc: 配置文件 -qd: 文档   -q --changelog (查询changelog)  -q --scripts
# 检验包: rpm -K /misc/cd/Packages/httpd-2.4.51-20.oe2203sp3.x86_64.rpm 有时需要导入: rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-openEuler 查询密钥: rpm -qa "gpg-pubkey" -> rpm -qi "gpg-pubkey" (查询密钥内容)
#     rpm软件包安装时,会将包里的每个文件元数据记录,可以用来检查包中的文件是否和当初安装时有所改变: rpm -V openEuler-release 所有包: rpm -Va
# 安装软件到指定目录: rpm -ivh rpm.rpm --root=/mnt/sysimage/
# yum
# 查看历史: yum history 撤销: yum history undo 8 重做: yum history redo 5
# 添加本地源: baseurl=file///misc/cd/
# 禁用源: yum-config-manager --disable 临时禁用: yum --disablerepo=* --enablerep=update list available  列出所有版本: yum info samba --showduplicates
# 查看某个命令,文件来自于哪个包: yum provides 文件的绝对路径
# 清理绶存: yum clean all

#文件系统
# 修复: fsck.ext4 (一定不要在挂载状态下执行命令修复)
# 只读挂载: mount -r LABEL=test /mnt/sdb2
# 重新挂载: mount -o remount.rw /mnt/sdb2
# 挂载文件夹: mount -B /etc/ /mnt/etc/
#/etc/fstab /etc/ /mnt/etc/ none bind 0 0
# 挂载文件(文件模拟分区): dd if=/dev/zero of=/disk.img bs=1M count=100 -> mkfs.ext4 /disk.img(给文件创建文件系统) -> blkid /disk.img -> mkdir /mnt/disk;mount /disk.img /mnt/loop -> losetup -a #查看关联
#/etc/fstab /disk.img /data/disk xfs defaults 0 0
# swap
# swap分区: 分区类型选择swap -> mkswap ->  分区查看: swapon -s ->  挂载: swapon -a
# 清除mbr分区表: dd if=/dev/zero of=/dev/sdc bs=1 count=66 seek=446
# swap文件: dd if=/dev/zero of=/swapfile bs=1M count=1024 -> mkswap /swapfile -> fstab: /swapfile swap swap defaults 0 0 -> swapon -a
# 光盘制作iso: cp /dev/sr0 /data/centos8.iso 文件夹制作iso: mkisofs -r -o /root/etc.iso /etc

# 网络 (改网卡名: net.ifnames=0)
# 判断网络是否连接: 1. mii-tool eth0 2. ethtool eth0
# 本地端口范围: cat /proc/sys/net/ipv4/ip_local_port_range
# 查看被占用的端口号: less /etc/services
alias ss="sudo ss -ntlp"
# netstat -tln 端口号
# 查看端口被那个进程使用: sudo lsof -i :20170
# man tcp
# 抓包: sudo tcpdump -i wlan0 -nn icmp and (每个条件用and分割)    eg: tcpdump -i eth0 -nn icmp and src host 10.0.0.6 and dst host 10.0.0.7
#                    src/dst host
#                    host
#                    post ! 22
#                    tcp
#                    -w ./target.cap (-nn: 以数字显示 -w: 写入文件,可以使用wireshark打开)
# sudo ping -s 1230 www.baidu.com -f
# arp缓存: arp -n   arp绑定: arp -s
# 检查地址冲突: arping
# 查看网卡驱动: ethtool -i wlan0
# 修改ip地址: nmcli connection  modify rtl ipv4.address 192.168.43.200/24 ipv4.gateway 192.168.43.1 ipv4.dns 223.6.6.6 ipv4.method manual   生效: sudo nmcli connection  reload; nmcli connection  up rtl
#             /etc/NetworkManager/system-connections/CMCC-dZk1.nmconnection
#             为wifi指定网卡: nmcli connection modify CMCC-dZk1 connection.interface-name wlan0
#             为wifi起别名: nmcli connection modify CMCC-dZk1 con-name rtl; nmcli connection modify CMCC-dZk1\ 1 con-name rt; nmcli connection
# team,bind: nmcli connection add con-name myteam0 ifname team0 type team config '{"runner":{"name":"roundrobin"}}'; nmcli connection modify wlan0 team0; sudo teamdctl team0 state
# 网桥(同交换机): brctl addbr/addif/show; brctl showmacs virbr0 (查看端口对应的mac,同交换机的mac表)
#     生成树协议(stp: spanning tree): 防止广播风暴    启用: brctl stp br0 on
# 扫描: nmap -sP 192.168.43.0/24
alias rescan="nmcli device wifi rescan"
alias hotspot="nmcli device wifi hotspot"
alias offhotspot="nmcli connection down Hotspot"

# zsh
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# 有意思的写法
# 叛断端口号是否打开< /dev/tcp/127.0.0.1/2017
# ping 十进制数字 (ip地址转化的十进制)
# Use bash-like word definitions for navigation and operations

#################################
## C-w
## Create a new widget.
#zle -N backward-kill-space-word
#backward-kill-space-word() {
## Inform the line editor that this widget will kill text.
#zle -f kill
## Set $WORDCHARS for this command only.
#WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>' zle .backward-kill-word
#}
## See comments above.
#zle -N backward-kill-bash-word
#backward-kill-bash-word() {
#zle -f kill
#WORDCHARS='' zle .backward-kill-word
#}
## Bind the widgets to keys.
#bindkey   '^W' backward-kill-space-word
#bindkey '^[^H' backward-kill-bash-word
#my-backward-delete-word() {
#local WORDCHARS=${WORDCHARS/\//}
#zle backward-delete-word
#}
#zle -N my-backward-delete-word
#bindkey '^W' my-backward-delete-word
#my—backward—delete—word(){}
#################################

# shift+tab
bindkey '^[[Z' reverse-menu-complete

alias ls="ls --color=auto"
# 自动启动文件:  /home/f/.config/autostart

# mac
if [[ "$(uname)" == "Darwin" ]]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  alias lsblk="diskutil list"
  alias a="ls -hA"
  alias l="ls"
  alias ll="ls -lh"
  alias al="ls -lhA"
  alias netstat="netstat -an | grep LISTEN"
  # 切换到finder
  function pfd() {
    osascript 2> /dev/null <<EOF
  tell application "Finder"
    return POSIX path of (target of window 1 as alias)
  end tell
EOF
}
function cdf() {
  cd "$(pfd)"
}
function rm() {
  DIR=$(mktemp -d /tmp/trash-$(date +%F_%H-%M-%S)_XXXXXX);\mv $@ $DIR
}

else
  # linux
  alias a="ls -hA --group-directories-first"
  alias l="ls --group-directories-first"
  alias ll="ls -lh --group-directories-first"
  alias al="ls -lhA --group-directories-first"
  alias sl="sudo ls --color=tty -lhAt"
  alias hx="helix"
  alias rm="DIR=\$(mktemp -d /tmp/trash-\$(date +%F_%H-%M-%S)_XXXXXX);\mv -t \$DIR"
fi;



#################################C-w M-backage#########################################
# Use bash-like word definitions for navigation and operations
autoload -Uz select-word-style
select-word-style bash

# Use C-w to kill back to the previous space
zle -N backward-kill-space-word backward-kill-word-match
zstyle :zle:backward-kill-space-word word-style space
bindkey '^W' backward-kill-space-word
#################################C-w M-backage#########################################






#vim-mode 恢复 alt .
# Normal mode
# function append-last-word { ((++CURSOR)); zle insert-last-word; }
# zle -N append-last-word
# bindkey -M vicmd '\e.' append-last-word
# # Insert mode
# bindkey -M viins '\e.' insert-last-word



















# Local Variables:
# mode: sh
# End:
