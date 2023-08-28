---
title: "4.case--开关语句"
weight: 4
date: 2023-07-19T19:44:34+08:00
lastmod: 2023-07-19T19:44:34+08:00
tags: ["case"]
categories: ["case"]
# bookComments: false
# bookSearchExclude: false
---

# case--开关语句

用多分支if结构和if结构嵌套都可实现“多选1”,但带来的负面影响是程序的可读性差，面对一大堆的if和if else搅和在一起，很多读代码的人都会觉得头皮发麻，要耐心地去“脱壳"。
实际上，BDL语言还提供了另--种更简洁的多分支结构，即case结构。

## 一般形式

case机构一般形式为:

```sql
case 表达式1
    when 常量表达式1
        语句1
    when 常量表达式2
        语句2
    when 常量表达式3
        语句3
    ...
    default
        语句4
end case
```

语句执行时，首先对case后的表达式进行计算，将计算的结果逐个与when后的常量表达式进行比较，当表达式的值与某个常量表达式的值相等时，即执行该when后的对应的代码段，如果表达式的值与所有when后的常量均不相同时，则执行default后的语句。

case 的算法流程如下：

{{< mermaid >}}
flowchart TD
    a["表达式计算"]-->b{"常量表达式1"}
    b--"no"-->c{"常量表达式2"}
    c--"no"-->d{"常量表达式3"}
    d--"no"-->e{"常量表达式n"}
    e--"no"-->f["defalut:语句m+1"]
    b--"yes"-->g["语句1"]
    c--"yes"-->h["语句2"]
    d--"yes"-->i["语句3"]
    e--"yes"-->j["语句m"]
{{< /mermaid >}}

来看一个具体的应用实例，由用户输入一个1到7之间的数字，程序自动输出对应星期几的英文形式，如输入1，程序输出Monday。如果用户输入的数字不在1到7之间，提示出错，如下:

```sql
    define index integer
    prompt "请输入一个1到7之间的整数：" for index
    display ""
    case index
        when 1
            display "Monday"
        when 2
            display "Tuesday"
        when 3
            display "Wednesday"
        when 4
            display "Thursday"
        when 5
            display "Friday"
        when 6
            display "Saturday"
        when 7
            display "Sunday"
        default
            display "请检查输入是否正确"
    end case
```

**代码解析**

上述代码中，读者可以改变when子句的先后顺序，程序的执行结构不会受到影响。

## 进阶

case 语句除了when后面可以根常量，还有一种跟逻辑表达式的写法，见下面代码：

```sql
    define index integer
    prompt "请输入一个1到7之间的整数：" for index
    display ""
    case
        when index==1
            display "Monday"
        when index==2
            display "Tuesday"
        when index==3
            display "Wednesday"
        when index==4
            display "Thursday"
        when index==5
            display "Friday"
        when index==6
            display "Saturday"
        when index==7
            display "Sunday"
        default
            display "请检查输入是否正确"
    end case
```
请编译运行看运行结果是否一样。

