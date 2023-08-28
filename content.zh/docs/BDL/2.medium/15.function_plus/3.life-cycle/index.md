---
title: "3.生命周期"
lastmod: 2023-08-28T13:54:57+08:00
date: 2023-08-28T13:54:57+08:00
tags: ["cycle"]
categories: ["BDL"]
weight: 3
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

## 函数生命周期

_编程就是写函数_，`main`的开始结束就是程序的开始结束。

函数的开始就是函数调用，结束就是函数最后一行运行结束，或者运行到`return`处。

{{< hint info >}}
**调用**

- call add() returning ...
- display add()
- let a = add()
- call minus(10,add())
- ...
  {{</ hint >}}

{{< mermaid >}}
graph LR
a0(["开始"])-->a["调用"]
a-->b["执行语句"]
b-->c["end funtion/return"]
c-->d(["结束"])
{{</ mermaid >}}

## 变量的生命周期

_编程就是写函数_，函数本质是什么呢？
_函数的本质是输入、处理、输出_

输入的是**变量**，输出的是**变量**。处理的也是**变量**。

如果程序中一直增加功能，那么变量的数量会一直增加，如果不停增加下去，内存迟早有用完的一天。

但实际上一个规划良好的程序并不会将内存全部占用。

这是因为，在BDL中变量不是一直加载到内存中，有些变量用到的时候才会分配内存，不用的时候，内存会释放掉。
 
那么变量在定义时就会分配内存，那么什么时候释放其内存呢？

**变量所在的作用域，所有语句执行完成时释放内存**，在BDL中最小的作用域是函数。

+ 所以在函数中定义的变量，在函数执行完后，变量就释放内存了。所以我们需要返回值，并用变量接受这个返回值。

+ 定义在`main`函数之前的函数，在`main`执行结束后才能释放内存。

函数中定义的变量
{{< mermaid >}}
graph LR
    a["函数调用"]-->b[["分配内存"]]
    b-->c(("..."))
    c-->d["end funtion/return"]
    d-->z[["释放内存"]]
{{</ mermaid >}}