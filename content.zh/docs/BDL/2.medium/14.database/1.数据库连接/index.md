---
title: "1.数据库连接"
lastmod: 2023-08-24T08:06:11+08:00
date: 2023-08-24T08:06:11+08:00
tags: ["database"]
categories: ["BDL"]
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 数据库连接

`TIPTOP GP/T100` 在按照时会配置号数据库，一般为`ORACLE DB`，也可能是`postgresql`。


本章所有内容都是基于`ORACLE DB`，但大部门内容应该是通用的。

数据库已经配置的连接可以在文件`$FGLPROFILE`中看见，这里配置好的数据库都是可以在BDL中使用的。


## 连接数据库

在已有的BDL代码中我们经常见到在`main`函数外，有一个`databse ds`语句。

`database`就是连接数据库的语句，`ds`就是要连接的数据库。`ds`为TIPTOP中一个特殊的数据库，此数据保存了所有表的表结构，和同义词表的数据。

> 同义词值得是不同库之间都可以使用的一个表，但此表实际只保存在ds库，每个库查看的数据内容都是相同的。

`database ds1`即可切换到ds1数据库中。

### `main` `funtion main()`的区别

`main end main` 还可以写出`function`的格式`function main() end function`。

这两者在连接数据库时是有区别`main end main` 会自动连接到 `main`之外的`databse ds`数据库。
而`function main() end function`只会用到`databse ds`的表结构，而不会自动连接到数据库。

> 使用表结构的方法在下一节将会讲到

除此之外他们还有另一个区别`main end main`需定义在一个模块所有函数之前，而`function main() end function`的位置没有限制。

