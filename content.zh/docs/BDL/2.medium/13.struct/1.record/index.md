---
title: "1.结构体"
weight: 1
date: 2023-07-20T19:25:42+08:00
lastmod: 2023-07-20T19:25:42+08:00
tags: ["record"]
categories: ["record"]
# bookComments: false
# bookSearchExclude: false
---

# 结构体

仍以人为例来介绍，要管理姓名、单位、E-mail地址、 联系电话等信息，现实生活中，很多人采用名片的形式，将这些信息印在一张卡片上。

收集的一张张名片大大方便了数据的管理，将这种理念借鉴到BDL语言程序设计中，是否有类似于名片的那么一种变量呢?

有，答案就是“结构体变量”，这是一种复合变量，在进一步说明结构体变量前，先来看“结构体”的概念，结构体和结构体变量的关系类似与类型与普通变量的关系，结构体中说明了结构体变量的信息格式，而结构体变量是结构体的实例。

## 结构体的定义

只有先完成结构体的定义，才能声明并使用结构体变量，正如，只有确定了名片，上要印什么内容，才能开始印刷名片。结构体的定义即是为了说明结构体变量要存储什么信息的过程。

```sql
define 变量 record
        存储数据列表
    end record
```

举例说明：
```sql
define person record
        name,age varchar(20),
        email varchar(50)
    end record
```

上面我们定义了一个变量`person`，这个变量没有实际的累计，既不是字符串也不是数字。而其内有有另外类似变量的定义`name`、`age`和`email`。

结构体定义规则：
1. 每个成员名称符合标识符规则
2. 在同一个结构体中名称不得重复
3. 每个成员定义后要加`,`号，最后一个成员不能加`,`
4. 与下一个成员类型一致，可以省略类型

## 访问结构体成员

习惯上我们将诸如字符串`name`、`age`和`email`在结构体变量内部这些变量称作`数据成员`（简称`成员`），有的时候也称作`元素`、`属性`。

在定义了一个结构体变量后，我们使用成员操作符号`.`来访问每个成员，例如`person.name`、`person.age`，分别表示`person`这个变量中储存的姓名年纪等信息。

{{< hint info >}}
**提示**

结构体成员，和我们之前使用的变量的方法都是使用`.`操作符号来访问/调用。他们的区别在于方法需要有`()`，而成员没有`()`。
{{< /hint >}}

我们看一段示例代码：

```sql
    define zhangsan record
        name varchar(20),
        age  integer,
        email varchar(50)
    end record

    let zhangsan.name = "zhang san"
    let zhangsan.age = 24
    let zhangsan.email = "zhangsan@outlook.com"
    display sfmt("\nname:%1",zhangsan.name)
    display sfmt("age:%1",zhangsan.age)
    display sfmt("email:%1",zhangsan.email)
```

输出结果:

```
name:zhang san
age:24
email:zhangsan@outlook.com
```

## 初始化结构体变量

当你的结构体变量需要重复使用时，你不知道之前的结构体哪些成员有值，哪些成员没有值了。

难道要访问每个成员复制为空值吗？

我们有一个快速将结构体所有成员赋空值的关键字：
```
initialize 结构体变量.* to null
```

## 批量访问成员变量

初始化所有成员时，我们使用了一个`结构体变量.*`方式。
这里的`.*`表示访问所有成员。

除了访问所有成员，我们还可以指定一个成员范围。

```
initialize 结构体变量.成员1 thru 结构体变量.成员2 to null
```
需要注意的时`thru`连接的两个成员必须是同一个结构体变量，且只能在`initialize`、`validate`和`locate`中使用。

请运行以下代码，观察其输出值：
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

    let zhangsan.name = "zhang san"
    let zhangsan.age = 24
    let zhangsan.email = "zhangsan@outlook.com"
    let lisi.* = zhangsan.*
    let lisi.name = "lisi"
    display sfmt("\nname:%1",zhangsan.name)
    display sfmt("age:%1",zhangsan.age)
    display sfmt("email:%1",zhangsan.email)
    display sfmt("\nname:%1",lisi.name)
    display sfmt("age:%1",lisi.age)
    display sfmt("email:%1",lisi.email)
```

输出结果：
```
name:zhang san
age:24
email:zhangsan@outlook.com

name:lisi
age:24
email:zhangsan@outlook.com
```
利用`let lisi.* = zhangsan.*`可以赋值两个成员和对应数据类型一样的结构体变量的值。