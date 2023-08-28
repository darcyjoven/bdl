---
title: "2.一维数组"
weight: 2
date: 2023-07-20T13:51:56+08:00
lastmod: 2023-07-20T13:51:56+08:00
tags: ["one-dimensional","array"]
categories: ["one-dimensional","array"]
# bookComments: false
# bookSearchExclude: false
---

# 一维数组

一维数组也称向量，用以组织具有一维顺序关系的一组同类型数据，在使用数组前，必须先声明数组，编译器根据声明语句为其分配内存，这样数组才有意义。

## 一维数组如何定义

与简单数据类型一样，数组也由关键字`define`定义

```sql
define 数组名 array [size] of 类型  --定长数组
define 数组名 dynamic array of 类型 --动态长度数组
```

数组由两种形式：
1. 指定长度的定长数组
2. 不指定长度动态长度数组

## 一位数组的访问

之前我们提过，数组越界的错误，对于定长的数组，超过原来长度的访问，或程序奔溃。对于动态长度的数组，访问未经过初始化的长度的时候，会对之前没有初始化的索引赋空值。

我们通过一个例子看一下一位数组的访问方式：
```sql
    define score array [6] of integer
    define sum,i integer
    define average decimal(10,2)
    prompt "请输入第1名学生的成绩" for score[1]
    prompt "请输入第2名学生的成绩" for score[2]
    prompt "请输入第3名学生的成绩" for score[3]
    prompt "请输入第4名学生的成绩" for score[4]
    prompt "请输入第5名学生的成绩" for score[5]
    prompt "请输入第6名学生的成绩" for score[6]
    for i = 1 to 6
        let sum = sum + score[i]
    end for
    let average = sum/6
    display sfmt("\n平均成绩：%1",average)
```

## 数值的初始化

上面我们说过动态数组访问超界时会将之前数组都赋值为null，如果每次都是这样，那么不小心写了一次array[1000]，那么这个数组长度之后都从1000后开始用吗？

这个时候我们就可以用到初始化数组，将数组重新初始化为0长度（动态数组初始化为0长度，定长数组初始化为全部null值数组）。

具体语法如下：
```sql
call 数组名.clear()
```
你一定发现了，有一个`()`，难道clear是一个函数吗？

没错，`clear()`这类可以通过`变量`后面跟`.`调用得函数，是一种特殊函数，它只能通过指定数据类型的变量调用。

这种特殊的函数我们称为`方法`，`clear()`是数组类型的一个方法，方法除了调用时必须跟在变量后面，其它特性与函数是一样的，可以传参，也可以返回值。

方法这类函数都是BDL语言是定义好的，你也可以通过引入java包等方式使用，但这属于进阶内容。
当前你可认为方法都为BDL定义好，只能调用不能修改即可。

## 不合法的数组操作

1. 用一个数组对另一个数组赋值，即使两者类型一样

```sql
    define a,b array[2] of integer
    let a[1] = 1
    let a[2] = 2
    let b = a
```

编译报错
```sh
../42m/czz_czzi001.4gl:6:13:6:13:error:(-4340) The variable 'a' is too complex a type to be used in an expression.
../42m/czz_czzi001.4gl:6:9:6:9:error:(-4323) The variable 'b' is too complex a type to be used in an assignment stateme.
```

2. 对输出进行整体输出

```sql
    define a array[2] of integer
    let a[1] = 1
    let a[2] = 2
    display a
```

编译报错

```sh
../42m/czz_czzi001.4gl:6:13:6:13:error:(-4340) The variable 'a' is too complex a type to be used in an expression.
```
3. 数组整体运算

```sql
    define a,b array[2] of integer
    define sum integer
    let a[1] = 1
    let a[2] = 2
    let b[1] = 2
    let b[2] = 3
    let sum = a + b
    if a>b then
        display "\na>b"
    end if
```
编译报错
```sh
../42m/czz_czzi001.4gl:9:15:9:15:error:(-4340) The variable 'a' is too complex a type to be used in an expression.
../42m/czz_czzi001.4gl:9:19:9:19:error:(-4340) The variable 'b' is too complex a type to be used in an expression.
../42m/czz_czzi001.4gl:10:8:10:8:error:(-4340) The variable 'a' is too complex a type to be used in an expression.
../42m/czz_czzi001.4gl:10:10:10:10:error:(-4340) The variable 'b' is too complex a type to be used in an expression.
```

