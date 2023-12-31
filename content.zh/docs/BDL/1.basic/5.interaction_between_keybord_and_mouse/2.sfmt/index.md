---
title: "2.display与sfmt函数"
weight: 2
date: 2023-07-18T11:25:43+08:00
lastmod: 2023-07-18T11:25:43+08:00
tags: ["sfmt"]
categories: ["sfmt"]
# bookComments: false
# bookSearchExclude: false
---
# display与sfmt函数

display函数已经接触过，是将后面的变量或者值显示到控制台的命令行中。

请尝试下以下代码，看看运行的值有何区别

```sql
    define a integer
    define b decimal(20,6)
    define c varchar(20)
    define d decimal(10,6)

    let a = 1
    let b = 1
    let c = 1
    let d = 1
    display ""
    display a
    display b
    display d
    display c
    let c = "1"
    display c
    let c = b
    display c
```
运行后，会发现显示如下

```
          1
              1.000000
    1.000000
1
1
1.000000
```

是否很你想像中的不一样，我们没有输入空格，却打印了很多空格。

+ 隐式转换字符串

display会将任何变量转换为字符串，如果后面不是字符串会自动转化为字符串格式。

这个转换时隐式的，隐式转化字符串会将数字剩余长度用空格补上。所以

```
display a
display b
display c
```
这两句将补上对于数量的空格:
 integer
最大表示2147483647，10位，1只有一位所以补上9个空格，因为integer正负数都有可能，还要补上一个符号位值，一共10个空格。

decimal(20,6),decimal(10,6)整数部分分别有14，和4位，再加上1位符号位，分别是15，5。整数部分只有1位，所以补上14，4个空格。小数部分没有值部分补上0（小数补0在显示转换也会补上）。

+ 隐式转换字符串

在BDL语言中，显示转换字符串，例如let c = 1，这种形式。
是不会补上前面少的位数和符号位

```
let c = b
display c
```
例如上面代码只显示`1.000000`。

但是每次数字转字符串我们都显示的转化字符串`let c = b`，会导致代码多很多没有必要的行。
所以BDL语言为我们封装了一个函数`sfmt()`,之前我们已经见过这个函数。

其中`s`是string字符串的意思,`fmt`是`foramt`的缩写，全称位`StringFormat`字符串格式化。

`sfmt(参数1,参数2,参数3...)`sfmt接受至少2个参数，且所有参数传入时，都会显示的转为字符串处理。

在之前的用例中，我们写过这样的代码:
```sql
display sfmt("1+2+3+4+5=%1",x)
```
这里一个参数"1+2+3+4+5=%1",第二个参数x是正整数值为15。

函数首先将所有参数显示转为字符串，15转为字符串"15"。

注意第一个参数是中的`%1`，我们尝试以下代码

```sql
display sfmt("1+2+3+4+5=%2",15,0)
```
这是我们发现输出的结果如下：
```sql
1+2+3+4+5=0
```

发现其中规律了吗？`%n`代表着从第n+1个参数的值。

我们再将`%2`改为`%3`
```sql
display sfmt("1+2+3+4+5=%3",15,0)
```
```shell
SFMT: Invalid index used.
```
报错了，因为没有第4个参数。`你无法使用没有传入的参数，但是可以传入参数而不使用。
`

好了，现在我们知道smft的用法了，后面我们将经常使用这个函数，因为它可以为我们减少很多不必要的代码。

