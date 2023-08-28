---
title: "4.结构体数组嵌套"
weight: 4
date: 2023-07-20T19:27:18+08:00
lastmod: 2023-07-20T19:27:18+08:00
tags: ["record array"]
categories: ["record array"]
# bookComments: false
# bookSearchExclude: false
---

# 结构体数组嵌套

在上一章节例子中，我们使用`student`类型定义了两个变量`zhangsan`,`lisi`。
但是我们需要的变量不止两个，例如，我需要一个班上50个学生，是不是场景很熟悉？没错，变量。

我们使用变量嵌套结构体，示例：

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
define students array[50] of student
```

## 数组中的结构体

入上面代码，结构体声明是一种自定义的数据类型，在数组

## 结构体中的数组