# 检查语法，不执行
set -n
# 显示执行过程。会执行
set -x
删除一个变量，不加$号，$号代表解引用
unset 变量名 #不要加$
引号可以保留变量和命令的执行结果中的换行
echo `seq 10`;echo "`seq 10`"
NUM=`seq 1`;echo $NUM
