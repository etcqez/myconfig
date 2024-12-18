# npm yarn安装的命令在~/.yarn/bin
# npm config set registry https://registry.npmmirror.com
# nrm use taobao  修改镜像
# npm config list
# npm root -g 查看全局安装的位置  yarn global bin
# npm i -g nodemon  全局安装
# nodemon：自动重启node应用程序
# 生产信赖(默认选项，在开发阶段和最终上线运行都用到)：npm i -S[--save] package
# 开发信赖(只在开发阶段使用)：npm i -D[--save-dev] package
# npm i 无参数表示依据package.json和package-lock.json安装依赖，有参数表示安装包   yarn 安装信赖
# 安装指定版本的包: npm i <包名@版本号>
# npm r -g modemon 删除包


# vue
# ref属性获取dom：ref标签属性，相当于id，获取真实dom元素，如果是在组件上，获取组件实例对象，通过 this.$refs.ref属性名 获取
# props配置项：组件标签的形参 props:['name', 'age', 'sex']  <Student name="李四" sex="女" age="19"/>
#   props写法: props:{name:String}
#              props:{name:{type:String,required:true}}
# mixins配置项：提取公有方法到js文件中  通过 import {字典名} from '../名件名' {}是js文件导出的一个字典名
#   js模块化：名.js中：export const mixin = {methods: {showName(){alert(this.name)}}  mixin 表示字典名
# scoped：加在vue文件的style标签上，限制样式只能在本文件使用，因为在加载时，所有vue文件的style被一同加载，会重名

# less-loader安装报错，便用npm安装less-loader，发生错误，因为vue本身使用webpack4，而npm安装的是最新less-loader版本，最新的与与webpack4不兼容
# 指定安装版本：npm view webpack versions -> npm i less-loader@7

# vue2里面选项式语法可以和vue3新语法setup共存，旧语法是可以读出setup里面的东西的，因为setup是在创建vue对象之前就存在的，而setup里面没有this

# ref,reactive
# set里面本身定义的数据是没有响应式的
# ref：可以定义基本数据类型、对象类型的响应式数据
#   必需在后面加.value
#     对象：car.value.price += 10
#     数组：games.value[0].name = ''
#
# reactive：只能定义对象 类型的响应式数据
