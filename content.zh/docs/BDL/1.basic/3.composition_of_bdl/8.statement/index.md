---
title: "8.语句"
weight: 8
date: 2023-07-17T16:49:56+08:00
lastmod: 2023-07-17T16:49:56+08:00
tags: ["statement"]
categories: ["statement"]
# bookComments: false
# bookSearchExclude: false
---

# 语句构成程序

BDL语言有以下5中类型语句。

1. 表达式语句。
BDL语言中，操作者或动作可成为表达式。
例如以下示例都是表达式语句：

```
define a integer
display "hello world"
```
2. BDL还有很多中流程控制语句。
如if-else，for循环语句，while循环语句，continue，结束本次循环语句，break跳出循环语句，switch多路分支语句，goto专项语句，return返回语句。
学习到画面规格后，还将设计到input输入语句，display显示语句（这里display与现在的display不同），dialog交互等画面控制语句。
3. 函数调用构成的函数调用语句
4. 符和语句，将以上语句写在同一行的语句

BDL语言中最小的程序单元是语句。
另外在源代码中有一些是指示编译器如何编译的预处理器指示命令，如`&ifdef &endif` `&include`等。
BDL语言源代码，就是由语句和这些指示命令构成的。
