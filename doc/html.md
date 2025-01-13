# flex （给父元素设置，控制子元素）
# flex-direction （控制主轴排列方向）
row 横枞 row-reverse column column-reverse
# justify-content (主轴上子元素的对齐方式) 一定要先确定好主轴
flex-start flex-end center space-around 平分剩余空间 space-between 先两边贴边，再平分剩余空间
# flex-wrap 控制子元素是否换行
nowarp warp
# align-items (侧轴上子元素的对齐方式 单行)
flex-start flex-end center stretch 侧轴拉伸
# align-content (侧轴上子元素的对齐方式 多行)
只能用在子元素出现换行的情况下，设置了 flex-warp: nowarp
flex-start flex-end center space-around 平分剩余空间 space-between 先两边贴边，再平分剩余空间 stretch
# flex-flow 是flex-direction和flex-wrap的复合属性
# 子项属性
flex 数字： 定义子项目分配剩余空间
align-self 值继承align-items，控制子项自已在侧轴上的排列方式
order 定义项目的排列顺序，数字越小，排列越靠前，默认为0，和z-index不同，order是左右排列
