---
title: "2.声明结构体类型"
weight: 2
date: 2023-07-20T19:25:56+08:00
lastmod: 2023-07-20T19:25:56+08:00
tags: ["type"]
categories: ["type"]
# bookComments: false
# bookSearchExclude: false
---

# 声明结构体类型

在上一章节，我们定义了两个相同的结构体变量。

```sql
    define zhangsan record
        name varchar(20),
        age  integer,
        email varchar(50)
    end record
    define lisi record
        name varchar(20),
        age  integer,
        email varchar(50)
    end record
```

这两个变量成员以及每个成员的数据类型完全一样，除了成员的值其它内容都一样。

现在成员数量少赋值一遍，还不算难，如果成员数量达到几十个的时候呢？

如果后面我要增加一个成员，难道要先找到所有的结构体变量，一次增加吗？

所以我们引用了一个新的功能---结构体声明，关键字`type`，本章主要介绍它的使用方法。


## 结构体如何声明

结构体声明的示例：
```sql
    type person record
        name varchar(20),
        age  integer,
        email varchar(50)
        end record
```

看起来和结构体变量定义完全一样，只是将`define`换成了`type`。

我们来看看如何使用：

```sql
    type person record
        name varchar(20),
        age  integer,
        email varchar(50)
        end record
    define zhangsan,lisi person
    let zhangsan.name = "zhang san"
    let lisi.name = "li si"
    display zhangsan.name
    display lisi.name
```

我们在定义`zhangsan`、`lisi`两个结构体变量是时，直接将`person`当作变量类型使用，类似于`integer`。

这个时候我们要增加一条成员，只要在`person`中增加一条即可。使用`person`创建的变量，自动可以访问新增加的成员。


## type 进阶使用

```sql
type person record
        name varchar(20),
        age  integer,
        email varchar(50)
    end record
```
之前我们的结构体声明了`person`类型，也许你会好奇，为什么还要加上`record`和`end record`呢？

因为`type`还可以在其它类型中使用,`array`、`dynamic array`。甚至是基础数据类型`integer`、`string`。

`type`相当于给一个数据类型，起了一个别名。

如果一个类型我们需要重复使用，或希望之后修改方便，我们都可以先用`type`取别名，然后使用别民去定义变量。

编译运行以下代码，查看运行结果。

```sql
    type ssss string
    define s ssss
    type names dynamic array of string
    define class1 names
    define i integer
    
    let s = "abc d "
    let s = s.trimRight()
    display "\n"||s

    let class1[1] = "zhangsan"
    let class1[2] = "lisi"
    let class1[3] = "wangwu"

    for i = 1 to 3
        display sfmt("name is %1",class1[i])
    end for
```