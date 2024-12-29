# 语法高亮
sfj
global-font-lock-mode 1

# consult 提供预览，分组，缩小范围
# 将buffer，书签等分组并列出，可以选择类型，m：书签 b：buffer
consult-buffer
# 搜索
consult-line
# 列出大纲
consult-outline
# 模糊查找内容
consult-grep 
  #a#avy 过滤结果
  C-S-] 更改文件
 
# emacs自带搜索
isearch-forward
  M-e 编辑搜索字符串
isearch-forward-regex
occur
  M-n 修改默认的搜索字符串
# isearch 空格匹配.*
(setq search-whitespace-regexp ".*?") 只适用于isearch
# query-replace 替换
