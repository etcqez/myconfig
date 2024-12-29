# idea maven配置文件路径
# mac
/System/Volumes/Data/Applications/IntelliJ\ IDEA.app/Contents/plugins/maven/lib/maven3/conf/settings.xml
/Applications/IntelliJ IDEA.app/Contents/plugins/maven/lib/maven3/conf/settings.xml
# linux
settings.xml
# 配置本地仓库位置  
localRepository
# 配置镜像地址
mirrors > mirror
# 配置jdk编译版本
profiles > profile
# javaee文件结构
maven-project/maven-javase-project
├── pom.xml
└── src
    ├── main
    │   ├── java
    │   │   └── org
    │   │       └── example
    │   │           └── Main.java
    │   ├── resources
    │   └── webapp
    │       └── WEB-INF
    │           └── web.xml
    └── test
        └── java
# 新建maven javase工程
创建空工程(maven-project 当作父工程) -> 创建模块(maven-javase-project 构建系统选择maven)
# 新建maven javaee工程
1. 在se工程的基础上 -> 安装JavaToWeb插件 -> 右键点击模块 -> JBLJaveToWeb
2. 模块右键 -> open module settings -> Add -> Web -> 选择web resource directories为/src/main/webapp -> 点击deployment descriptors -> 选择web.xml版本 -> pom.xml 添加 <packaging>war</packaging> 
# maven 依赖
1. mvnrepository网站
2. 安装maven-search -> Tools -> maven search -> copy of maven
# 提取版本号，统一管理
properties: <jackson.version>2.15.2</jackson.version> (标签名随便叫，但推荐：技术名.version spring.version)
引用：${jackson.version}
# scope
# 



# 类加载
# 三个阶段：加载 = 连接(验证，准备，解析) = 初始化
# 加载阶段：jvm将字节码从不同数据源（可能是class文件，也可能是jar包，甚至网络）转化为二进制字节流加载到内在中，并生成一个代表该类的java.lang.Class对象
# 连接：
#   验证：确保Class文件的字节流是否要求，文件格式是否以cafebabe开头，-Xverify:none关闭验证
#   准备：静态变量 初始化，赋默认初始值
# 解析：虚拟机将常量池内的符号引用替换为直接引用的过程
