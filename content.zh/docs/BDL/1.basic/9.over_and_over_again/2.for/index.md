---
title: "2.for结构"
weight: 2
date: 2023-07-20T08:30:40+08:00
lastmod: 2023-07-20T08:30:40+08:00
tags: ["for"]
categories: ["for"]
# bookComments: false
# bookSearchExclude: false
---

# for结构--更常用的循环结构

阅读代码时可以发现，for结 构是应用最多的一种 循环控制结构，这大抵是因为for结构提供的控制功能更为完善，而且，相比while结构，for结构写出的代码也更为简洁，可读性也稍好。


## 基本形式

```sql
for 变量 = 初始值 to 目的值 step 每次增加的量
    循环结构
end for
```

{{< hint warning >}}
**注意**
这里的`step`关键不写的时候，默认每次`+1`，`step`还可以跟负数，如果是负数，每次判断的就是小于目的值时跳出循环。
{{< /hint >}}

用while表示同样的表达式:

```sql
let 变量 = 初始值
while 变量<=目的值
    循环结构
    let 变量 = 变量 + 每次增加的量
end while
```

由此可见，要写出同样功能代码，for结构比while结构简洁易读。

for结构执行流程图：

{{< mermaid >}}
flowchart TD
    a["变量 = 初始值"]-->d{"变量是否超过目的值"}
    c["循环结构"]
    c-->b["变量增加"]
    b-->d
    d--"yes"-->e["跳出循环"]
    d--"no"-->c
{{< /mermaid >}}

其执行过程如下：
1. 变量赋初始值
2. 判断变量是否超过目的值，超过退出循环，进行第5步；不超过执行循环结构，执行第3步
3. 自动变量增加指定的值
4. 再判断第2步
5. 循环结果，跳出for结构，继续向下执行

利用for结构改写我们之前计算1到100和的代码：

```sql
define i,sum integer
for i =1 to 100
    let sum = sum + 1
end for
display sfmt("\n结果是：%1",sum)
```