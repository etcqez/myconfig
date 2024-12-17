# idea maven配置文件路径
/System/Volumes/Data/Applications/IntelliJ\ IDEA.app/Contents/plugins/maven/lib/maven3/conf/settings.xml
/Applications/IntelliJ IDEA.app/Contents/plugins/maven/lib/maven3/conf/settings.xml

# 类加载
# 三个阶段：加载 = 连接(验证，准备，解析) = 初始化
# 加载阶段：jvm将字节码从不同数据源（可能是class文件，也可能是jar包，甚至网络）转化为二进制字节流加载到内在中，并生成一个代表该类的java.lang.Class对象
# 连接：
#   验证：确保Class文件的字节流是否要求，文件格式是否以cafebabe开头，-Xverify:none关闭验证
#   准备：静态变量 初始化，赋默认初始值
# 解析：虚拟机将常量池内的符号引用替换为直接引用的过程