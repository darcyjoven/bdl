---
title: "4.流程转向控制语句"
weight: 4
date: 2023-07-20T09:08:04+08:00
lastmod: 2023-07-20T09:08:04+08:00
tags: ["flow control"]
categories: ["flow control"]
# bookComments: false
# bookSearchExclude: false
---

# 流程转向控制语句

之前我们了解到BDL中除了判断语句，循环语句，还有大量的流程转向控制语句。

他们是continue、exit、goto语句，本章节会一一讲述。

## exit--跳出循环

如果把重复结构视为一层壳，那么exit的作用可说是“破壳而出”，当流程执行到循环结构中的break语句时，循环结构提前结束，程序转而执行循环结构之后的那条语句，用流程图来表示，如图所示。

{{< mermaid >}}
flowchart TD
    a{"?"}-->b{"exit?"}
    b--"no"-->d["语句"]
    b--"yes"-->c["..."]
    d-->a
{{< /mermaid >}}

图中，如果在循环体内部执行了exit语句，程序流程会直接从循环结构中跳出，转而执行循环结构后面的语句，这类似于电路中的“短路”。

前面讲过，“如非故意为之，不要让循环成为死循环”，那这“故意为之”是怎么回事?如何“从死循环中跳出”，可用break语句实现，见示例代码：

```sql
    define i integer
    display "\n"
    while 1
        display "Hello"
        let i = i + 1
        if i > 5 then
            exit while
        end if
    end while
```
尝试编译运行，你会发现，`while 1`看起来是个死循环，但是我们再循环结构中，增加了一个可以exit的机会。

i每次循环都会`+1`，当i大于5时，就会运行到`exit`，退出循环。

{{< hint warning >}}
**注意**
当循环有多层时，`exit`只能剥一层“壳”，向外跳出一层。
{{< /hint >}}

## continue--重来一次

exit语句时结果整个循环结构，而continue语句结束的只是当前一次循环，形象的说时“再来一次”，流程图如下：

{{< mermaid >}}
flowchart TD
    a{"?"}-->b{"continue?"}
    b--"yes"-->a
    b--"no"-->c["语句"]
    c-->a
{{< /mermaid >}}

比较和之前exit，很容易发现两者的不同，continue短路只是本次循环后的内容，不会跳出循环结构，所以，continue语句被称为循环继续语句。

以下代码演示了continue语句的用法：

```sql
    define i integer
    display ""
    for i = 0 to 20
        if i mod 3 != 0 then
            continue for
        end if
        display sfmt("%1能被3整除",i)
    end for
```

输出结果为：

```
0能被3整除
3能被3整除
6能被3整除
9能被3整除
12能被3整除
15能被3整除
18能被3整除
```

**代码解析**

代码使用的是for循环结构，如果控制变量i不能被3整除，调用continue语句结束本次循环，重新开始循环，否则，输出提示信息。

## goto--随心所欲

goto是“go to”的缩写，称为自由转向语句，使用goto语句可将流程转到程序的任何地方。

和goto相关的一个概念是“标号”，这相当于现实的地址，更形象点说是“门牌号”， 标号的基本定义形式为:
```
label 标号名:
    语句
```
在程序其他地方使用“goto+标号名”的形式将流程转到标号定义处。

很多程序员甚至权威人士都不赞成使用goto语句，认为它破坏了程序的良好结构，转来转去会让代码读起来像一团乱麻，加上已经证明：使用顺序、分支和循环结构这3种基本流程控制足以写出任意复杂度的算法一不管其有多复杂。

在是否使用goto语句上，可谓见仁见智，相信读者也有自己的看法，不过，goto语句有 个特殊用法值得注意，前面说过，使用exit语句跳出循环结构时，只能剥一层壳，在循环嵌套时，如果想一次性从中跳出，可使用goto语句，见示例代码：

```sql
    define i integer
    while 1
        while 1
            diplay "*"
            let i = i +1
            if i > 3 then
                goto outside
            end if
        end while
    end while
    label outside:
```
**代码解析**

上述代码用于在屏幕上输出4个星号，为了说明goto语句的用法，采用了两重循环结构嵌套，在内层中判断计数整型变量i的大小，当i>3条件成立时，程序从循环中跳出，到outside标号处。

