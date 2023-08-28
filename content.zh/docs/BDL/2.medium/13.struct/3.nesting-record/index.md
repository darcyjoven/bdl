---
title: "3.结构体嵌套"
weight: 3
date: 2023-07-20T19:26:32+08:00
lastmod: 2023-07-20T19:26:32+08:00
tags: ["nesting"]
categories: ["nesting"]
# bookComments: false
# bookSearchExclude: false
---

# 结构体嵌套

上一节中讨论的`person`结构相对简单，只包含了3个数据成员: name、age和email, 如果面对的是更为复杂的结构，将所有数据成员并排似乎不是个高效的方法。那能否使用结构体嵌套，一层层管理数据呢?


## 结构体嵌套定义

顾名思义，结构体嵌套就是“结构体套结构体”，某个结构体的成员也是一个结构体变量，这样就可以按层次结构合理组织数据，举例如下：

```sql
type student record
    score record
        math integer,
        english integer
    end record,
    info record
        height,weight decimal(10,2)
    end record
end record
```
student是个外层结构，内部包含着学生的数据，结构体student内又定义了两个结构体变量score (成绩)和info (基本情况),结构体中的成员应当是占据内存空间的变量实体，因此，score和info是student结构的数据成员，结构体scorestruct和infostruct只是两个类型名，不占据实在的内存地址空间。将上述代码如下改写似乎更好理解一点:

```sql
type score record
    math integer,
    english integer
end record
type info record
    height,weight decimal(10,2)
end record
type student record
    score score,
    info info
end record
```

在结构体内部申明的结构体类型是不可见的，只能通过外部结构体调用。

```sql
type student record
    score record
        math integer,
        english integer
    end record,
    info record
        height,weight decimal(10,2)
    end record
end record
define zhangsan student
```

例如以上代码，你只能使用`zhangsan.score.math`来访问成员`math`，`score`无法省略，因为`info`结构体类型中也可以声明一个成员`math`，为了避免歧义，每层结构体的名称都必须显示的写出来，而不能省略。

你也无法使用`define lisi info`这种形式定义一个只有`info`的结构体变量，因为`info`在`student`内部声明，你只能通过`student`来访问。