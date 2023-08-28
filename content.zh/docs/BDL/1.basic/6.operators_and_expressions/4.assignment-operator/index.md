---
title: "4.赋值运算符"
weight: 4
date: 2023-07-19T15:52:27+08:00
lastmod: 2023-07-19T15:52:27+08:00
tags: ["assignment operator"]
categories: ["assignment operator"]
# bookComments: false
# bookSearchExclude: false
---
# 赋值运算符和赋值表达式

赋值运算时BDL中常见运算，一般用来改变变量的值。
BDL中提供了赋值运算符号`let =`，和函数返回值赋值`returning`两种估值方式。


## 赋值表达式

1. `let =`  赋值

之前我们已经多次使用`let a = 1`对变量进行赋值，我们可以看到使用这种方式赋值的方式，`=`左边是我们要赋值的变量，且只有一个。
`=`右边是我们要赋予的值。

`let a = a + 1`之前我们还是用过这样的方式进行求和，`=`右边作为一个整体计算结果之后，再赋值给`=`左边。

2. `returning` 函数返回值赋值

函数之后会详细讲解，我们现使用我们已经用过的`sfmt()`函数作为说明。

运行以下代码：

```sql
database ds
define a,b,c integer
MAIN
    define s string
    call to_day() returning s
    display s
    sleep 1  --这里是暂停一秒的意思，防止时间太接近而无法区分
    let s = to_day()
    display s
END MAIN

function to_day()
    return current
end function

```

我们可以看到以下内容，s的值被赋值了两次。
```sh
2023-07-19 16:03:11.275
2023-07-19 16:03:12.276
```

这说明使用`let s = 函数()`和`call 函数() returning s`两种方式都可以赋值给s，那么为什么还要使用第二种方式呢。

这是因为在BDL中允许返回多个值，当多个值返回时，就只能用`returning`进行赋值了。

## 左值与程序实体

程序实体是内存中的一块可标识的区域，左值是左值表达式的简称，是指明一个程序实体的表达式。
判断一个表达式是否左值的方法是看其能否放在赋值号的左边。
能放在赋值号左边的表达式都是左值，它指明了一块内存区域，而赋值运算实质上是改变这一区域内容的操作。

但应注意，能放在赋值号左边的表达式都是左值，但左值并非一定可以放在赋值号左边，const常量是左值，但不能将其放在赋值号左边，这是个例外。

如“define a float;"声明了一个浮点型变量a，则a是左值，因为它指明了一个程序实体，可放在赋值号的左边，但表达式“a+3”和“a=1" 就不能放在赋值号的左边，不是左值。
