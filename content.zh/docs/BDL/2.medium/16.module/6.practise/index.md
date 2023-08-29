---
title: "6.练习"
lastmod: 2023-08-29T08:13:19+08:00
date: 2023-08-29T08:13:19+08:00
tags: ["practise"]
categories: ["BDL"]
weight: 6
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 练习

## 使用`cl_null()`、`cl_replace_str()`、`cl_digcut()`、`cl_get_env()`

1. `p_findfunc`作业可以查询`tiptop gp`中常用`sub`、`lib`函数
2. 请注意以上函数需要的参数和返回值数量



## 新增一个lib函数`cl_get_runtime_line()`

1. 无参数
2. 以下方式返回一个字符串，czz_czzi001.4gl为当前运行的文件名称，7为代码运行的当前行

```bash
file:czz_czzi001.4gl line:7
```

3. 可以使用`__FILE__` `__LINE__` 两个宏定义标记