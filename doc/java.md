# idea maven配置文件路径
# mac
/System/Volumes/Data/Applications/IntelliJ\ IDEA.app/Contents/plugins/maven/lib/maven3/conf/settings.xml
/Applications/IntelliJ IDEA.app/Contents/plugins/maven/lib/maven3/conf/settings.xml
# linux
settings.xml
# 配置本地仓库位置  
localRepository
# 配置镜像地址
mirrors>mirror
# 配置jdk编译版本
profiles>profile
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
# scope 引入依赖的作用域 
compile(黓认): main test 打包和运行
test: test (junit)
runtime: 打包和运行 (mysql)
provided: main test (servlet)
# 依赖冲突解决原则
1. 谁短谁优先，引用路径长度
2. 谁上谁优先，dependencies声明的优先顺序
练习：
前题：
A 1.1 -> B 1.1 -> C 1.1
F 2.2 -> B 2.2
pom声明：
F 2.2 A 1.1 B 2.2
最终：
F 2.2 A 1.1 B 2.2
不会引入C 1.1，只要发生冲突了，后续的依赖全部终止
# maven下载依赖错误
1. 网编故障或仓库服务器宕机
2. 依赖项版本号错误
3. 访问本地仓库没有，不访问阿里镜像的问题，本地仓库被污染，由于依赖的错误下载
# 部署 
mvn install 打包上传到maven本地仓库
mvn deploy 打包上传到maven私服仓库
要求：
1. 这个命令执行的时候需要进入到项目的根路径，跟pom.xml平级
2. 部署必须是jar包的形式
# mvn clean compile 编译项目，生成target文件
# mvn package 打包，在target中生成jar包
# 最佳使用方案：mvn clean package|compile|install
# maven配置插件版本
加入 build>plugins>plugin>gavp (pom.xml)
# maven的继承 (用来指定子工程依赖的版本，而不是在每个子工程都引入依赖)
父工程删除src，打包方式声明为：<packaging>pom</packaging>
子工程包含parent标签，来指定父工程gav属性, 子工程仅有a，gv继承自父工程
在父工程声明版本信息：dependencyManager>dependencies>dependency (不是dependencies 为所有子工程引入依赖)
# maven工程聚合关系
概念：maven聚合是指将多个项目组织到一个父级项目中，通过触发父工程的构建，统一按顺序触发子工程构建的过程
父工程配置要管理的哪些子工程: modules>module




# 类加载
# 三个阶段：加载 = 连接(验证，准备，解析) = 初始化
# 加载阶段：jvm将字节码从不同数据源（可能是class文件，也可能是jar包，甚至网络）转化为二进制字节流加载到内在中，并生成一个代表该类的java.lang.Class对象
# 连接：
#   验证：确保Class文件的字节流是否要求，文件格式是否以cafebabe开头，-Xverify:none关闭验证
#   准备：静态变量 初始化，赋默认初始值
# 解析：虚拟机将常量池内的符号引用替换为直接引用的过程
