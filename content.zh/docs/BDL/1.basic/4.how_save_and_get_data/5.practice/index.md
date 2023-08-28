---
title: "5.练习"
weight: 5
date: 2023-07-18T10:22:43+08:00
lastmod: 2023-07-18T10:22:43+08:00
tags: ["practice"]
categories: ["practice"]
# bookComments: false
# bookSearchExclude: false
---

# 练习-几个与变量相关的经典算法

几乎每一个程序 都必须使用到变量，因为程序就是处理数据的，而数据必须存储在变量中。
本节仅举几个简单的变量使用的例子。
这些例子都是一些经 典的做法，请读者深刻理解并记住。

## 累加和累乘

所谓累加，就是将一系列的数字分别相加，最后得到一个结果。
如计算1+2+3+4+5：

```sql
    define x integer
    let x = x + 1
    let x = x + 2
    let x = x + 3
    let x = x + 4
    let x = x + 5
    display sfmt("\n1+2+3+4+5=%1",x)
```

编译运行，结果为：

```shell
1+2+3+4+5=15
```
**代码解析**

不要认为这道算术题如此简单，让计算机来计算是大材小用。
读者要知道，通过一些简单的算术计算，可以理解编程中的一些基本技巧，为今后的真正开发软件打基础。

这些简单的数学题，是在锻炼读者的编程能力。

```sql
define x integer
```
定义了x为整型，整型的默认初始值为0。
 
重点来关注:
```sql
let x = x + 1
```
这行代码就使用到了一个非常经典的累加算法。
这行代码是一个赋值语句。就是将赋值号“=”右边计算后所得的值，赋给左边的变量。再重申一次，这里的等号“=”是BDL语言中的赋值号，不是数学里表示相等的等号。

该语句的运算过程是:
1. 先计算x+1的值，计算得到数值1。
2. 将x+1的值(也就是1)赋给变量x。变量x现在的值是1。

来仔细分析这个过程。

在运行该语句之前，变量x的值是0。这个是赋的初值。

计算x+1的步骤如下:

1. 从内存中取得变量x的值，得到0。
2. CPU计算0+1,得到1。

然后将1赋值给变量x。此时变量x的值变为1。
```sql
let x = x + 2
```

同样的，这也是一个累加，取得变量x的值1，相加后赋给x，x的值是3。

这样一直累加下去，最后得到`1+2+3+4+5`的值为`15`。
通过类似`let x = x + e`，就将一系列数字统统累加起来。
就像一个篮子，接受了所有丢进去的东西。

累乘和累加类似，如计算1x2x3x4x5。如下：

```sql
    define x integer
    let x = 1
    let x = x * 1
    let x = x * 2
    let x = x * 3
    let x = x * 4
    let x = x * 5
    display sfmt("\n1x2x3x4x5=%1",x)
```

编译运行结果如下：

```
1x2x3x4x5=120
```
**代码解析**

如果对累加理解的话，这里就不需要赘述了。
需要注意的是，累乘初始值就不能从0开始了。

## 交换两个变量的值

假设有两个变量，x=10， y=3， 现在要求使得x=3, y=10， 该如何交换两个变量的值呢?这也是非常经典的交换算法。这些算法都是今后进行更深的算法学习的基础。
显然这里需要使用第三个变量来临时保存数值。

如图所示， 引入第三个变量z。

{{< mermaid >}}
graph TD;
    subgraph x
    X[10]
    end
    subgraph y
    Y[3]
    end
    subgraph z
    Z[0]
    end
{{</ mermaid >}}
___
{{< mermaid >}}
graph TD;
    subgraph x
    X[10]
    end
    subgraph y
    Y[3]
    end
    subgraph z
    Z[10]
    end
    X-->Z
{{</ mermaid >}}

___
{{< mermaid >}}
graph TD;
    subgraph x
    X[3]
    end
    subgraph y
    Y[3]
    end
    subgraph z
    Z[10]
    end
    y-->x
{{</ mermaid >}}

___
{{< mermaid >}}
graph TD;
    subgraph x
    X[3]
    end
    subgraph y
    Y[10]
    end
    subgraph z
    Z[10]
    end
    z-->y
{{</ mermaid >}}


1. 为初始转台，x=10，y=3 ，z不重要假设为0.
2. 将x的值复制到z中，这样一来，x的值就可以放心修改。已经已经有一个备份了。
3. 将y赋值给x，此时x已经得到y的值了。
而y可以从z中得到x的值。
4个步骤之后，x和y的值交换。
用完之后z也不需要了。

```sql
define x,y,z integer
    let x = 10
    let y = 3
    display sfmt("\nx=%1,y=%1",x,y)
    let z = x
    let x = y
    let y = z
    display sfmt("\nx=%1,y=%1",x,y)
```

编译后运行结果如下：

```
x=10,y=3
x=3,y=10
```

**代码解析**

最重要的交换值得几行代码，可以仔细对照代码因为在日常计算中交换数据经常出现，请务必掌握。

## 练习题

## 计算100+102+104+106+108+110得累加值

## 已知一个原得半径是3.0，请输出圆的面积

> 圆周率，请取7位小数