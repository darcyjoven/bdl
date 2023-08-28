---
title: "4.查询单笔资料"
lastmod: 2023-08-24T14:49:27+08:00
date: 2023-08-24T14:49:27+08:00
tags: [""]
categories: [""]
weight: 4
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 查询单笔资料

## BDL SQL

同插入一样，查询时BDL SQL也有特殊的语法，但仅可以查询单笔资料，如果查询结果包含多笔，程序报错退出。

```sql
define l_ima01 like ima_file.ima01
define l_ima02 like ima_file.ima02
select ima01,ima02 into l_ima01,l_ima02 from ima_file where rownum = 1
```

在`select`关键之前`from`关键字之后，可以使用`into`关键字，后面可以指定查询保存到哪些变量。


我们在定义变量类型时有使用过一下语法
```sql
define l_ima record like ima_file.*
```

在查询时我们也可以将表中所有内容查询出来。

```sql
define l_ima record like ima_file.*
select * into l_ima.* from ima_file where rownum = 1
```

## EXECUTE

除了BDL自带SQL语法，我们依然可以使用数据库的原生语法，和插入语法类型，我们需要将SQL放到字符串中。

```sql
define l_sql string
define l_ima record like ima_file.*
let l_sql = "select * into l_ima.* from ima_file where rownum = ?"
prepare ima_sel from l_sql
execute ima_sel using 1 into l_ima.*
```

查询和插入的区别在于，`execute`最后可以使用`into`语法接收查询的结果。

## FETCH

以上两种方式都可以查询单笔数据，但限制有些大，每次查询结果只能有一笔。
在实际查询中，我们通常要查询多笔资料。

为了应对多笔查询的场景，`BDL`提供了一个特殊的`FETCH`语法。可以灵活查询多笔SQL查询结果。
`FETCH`查询需要实现定义`游标(cursor)`，游标定义之后，在数据库中就确定了SQL的结果，之后通过`FETCH`查询，就不会重新查询一遍，只要在游标中抓取指定的那一笔即可。

### 游标

游标定义有三种方式，效果都是相同的。

1. 由prepare定义
```sql
let l_sql = "select * into l_ima.* from ima_file where rownum = ?"
prepare ima_sel_p from l_sql
declare ima_sel_cur cursor for ima_sel_p
```
`ima_sel_cur`为游标的名称，为自定义的标识符

2. 由字符串定义

```sql
declare ima_sel_cur cursor from "select * into l_ima.* from ima_file where rownum = ?"
```
利用字符串定义，将`cursor for `改为`cursor from`即可。

3. 由BDL SQL定义
```sql
declare ima_sel_cur cursor for select * into l_ima.* from ima_file where rownum = 1
```

由BDL SQL定义可以直接跟在`cursor for`即可。


`cursor`在事务提交时将关闭，这时再使用会报错。如果`cursor`资料内容被修改，再使用c`ursor`也会报错。

### OPEN CLOSE FREE
游标的状态有3中操作，OPEN、CLOSE、FREE。

+ OPEN 开启游标，如果SQL含有占位符，使用using 将参数传入
+ CLOSE 关闭游标，关闭cursor，如果要使用需要再OPEN
+ FREE 释放游标，再次使用时需要重新DECLARE

### SCROLL / WITH HOLD

cursor的定义还有两个可选选项scroll with hold

```sql
declare ima_sel_cur1 cursor with hold for select ima01 from ima_file where rownum =1
declare ima_sel_cur2 scroll cursor with hold for select ima01 from ima_file
```
+ with hold 关键字在cursor后添加，可以使cursor事务提交之后也不关闭

+ scroll 关键字，在cursor前增加，这个是由使用fetch 可以灵活去不同位置的资料。

+ scroll 和 with hold 可以同时使用

### 示例

+ 灵活取任意笔数

```sql
declare ima_sel_cur2 scroll cursor with hold for select ima01 from ima_file
FETCH NEXT c1 into cust.* --取下一笔
FETCH PREVIOUS c1 into cust.* -- 取上一笔
FETCH FIRST c1 into cust.* -- 取第一笔
FETCH LAST c1 into cust.* -- 取最后一笔
FETCH ABSOLUTE 10 c1 into cust.* -- 取第10笔
```

