---
title: "1.什么是函数"
weight: 1
date: 2023-07-20T10:09:06+08:00
lastmod: 2023-07-20T10:09:06+08:00
tags: ["what is function"]
categories: ["function"]
# bookComments: false
# bookSearchExclude: false
---

# 什么是函数--根据输入进行处理返回输出

代码编多了会发现一个问题:一些通用的操作，比如交换两个变量的值、对一组变量进行排序等，可能在多个程序中都会用到，不仅如此，在单独一个程序中也可能会对某个代码段执行多次。

{{< hint danger >}}
**问题**

有必要在每次执行时都把该代码段书写一次吗?这不仅会让程序变得很长，而且难以理解，使可读性下降。
{{< /hint >}}


## 分割

为了解决以上问题，C语言将程序按功能分割成-.系列的小模块，所谓“小模块”，可理解为完成-定功能的可执行代码块，称之为“函数”。

函数是BDL语言源程序的基本功能单位，打个比方，可以将函数视为一个黑盒子，或“加工设备”，从一头输人数据(原材料),从另一头就可以得到结果(产品)。至于函数内部是如何工作的，外部并不关心。
C语言源程序均是由函数组成的，在前面章节中给出的示例代码，只有一个main函数，这仅适用于比较简单的问题，实际的程序往往由多个函数组成。函数的调用是由另--个函数发起的，举例来说，在A函数中调用B函数，从B函数的角度上说，A函数可视为外部函数,外部函数A对“函数B是如何定义的，功能是如何实现的”毫不关心，A对B所知道的仅限于输入给B什么，以及B输出什么。

## 标准函数、lib/sub函数和自定义函数

为了方便解决一些基本问题，BDL语言提供了一些标准函数。
除此之外，`tiptop gp`和`T100`都集成了一些经常使用的函数。

>注意这是产品提供的，不是BDL语言提供的，可以被修改，增加。

除了上述函数外，BDL也允许用户自定义函数以便灵活解决各种问题，用户可以将自己的算法编写为一个个相对独立的函数模块，用调用的方法来使用函数。

从某种程度上说，BDL全部功能都是由这样或那样的函数实现的。


