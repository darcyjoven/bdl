---
title: "5.计算1+1"
weight: 5
date: 2023-07-17T15:49:10+08:00
lastmod: 2023-07-17T15:49:10+08:00
tags: ["5.count","1+1"]
categories: ["5.count","1+1"]
# bookComments: false
# bookSearchExclude: false
---

# 计算1+1--小有作为

以下代码实现了计算1+1的值。

```sql
databse ds
main
    define a,b integer  --定义a,b 为整型
    define y integer    --定义y为整型

    let a = 1           --将变量a赋值为1，此时a的值为1
    let b = 1           --将变量b赋值为1，此时b的值为1
    let y = a + b           --将a，b的值分别取出来，计算结果后，赋值给变量y
    display sfmt("\na+b=%1",y) --将y的值打印出来
end main
```
编译运行后，程序结果如下a+b=2

**代码解析**
1. 和之前代码一样，包含了database ds，同样也只有一个main函数。这是BDL语言规定，必须编写main函数。
2. `define a,b integer`定义a，b两个整形变量
3. `define y integer`定义y整形变量
4. 空行用于分隔变量声明部分和接下来的函数实现部分。主要是逻辑分隔，利于程序员阅读代码，对编译器来说并无意义。
5. `let a=1` 给变量a赋值1，此时a的值为1,`lei`是BDL的规定，赋值时必须使用。
6. `let b=1` 给变量b赋值1，此时b的值为1
7. `let y = a + b` 将a，b的值分别取出来，计算结果后，赋值给变量y
8. `display sfmt("\na+b=%1",y)`,将y的值打印出来。这个sfmt和以前代码中的用法不同，简单说明下，更详细的解释参见后续章节。
双引号中的“\n”，时回车换行。
“a+b=”原样输出。
“%1”中的`%`是格式化的起始字符，只在sfmt函数中这样用，意思是将y在这个位置显示出来。所以最后的输出是：
```
a+b=2
```


