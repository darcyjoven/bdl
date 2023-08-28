---
title: "2.函数的返回值"
lastmod: 2023-08-28T13:18:50+08:00
date: 2023-08-28T13:18:50+08:00
tags: [""]
categories: ["BDL"]
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 函数的返回值

上一节中我们讲到，函数结构由参数和返回值决定。

这节我们介绍函数的返回值。


## 返回值个数

和参数一样，函数的返回值个数可以是0，也可以是任意个。

### 0个返回值

`main` 函数就是一个无返回值的参数，没有函数能够接受`main`函数的返回值。
同时`main`也是一个没有参数的函数。


```sql
main
end main
function main()
end function
```

在无返回值的函数中，依然可以使用关键字`return`，这时`return`关键字的作用是结束当前函数运行，返回调用函数处。

### 任意数量的返回值

和参数不一样，函数的返回值个数是不需要提前定义好的。在程序执行到`return`处，才能确定返回值的个数和数据类型。

所以一个函数在不同情况下调用，返回值的个数有可能不同。

{{< hint info >}}
**注意**

返回不同数量的值，影响程序后续维护，除非能够快速解决当前问题，否则建议函数总是返回相同数量的返回值。

虽然返回个数不会保存，单调用函数时，必须接受每一个返回值，所以调用时，你必须知道这个函数将要返回的返回值的个数。
{{</ hint >}}


返回值的返回，即`return`后面的常量或者变量，已`,`作为分隔符。

例如，以下代码返回2020年的月份，如果当前不是2020年，则返回当前年份和月份。

```sql
main
    define yy,mm integer
    if year(current) == 2020 then
        display currentYM()
    else
        call currentYM() returning yy,mm
        display yy,mm
    end if
end main
function currentYM()
    if year(current) != 2020 then
        return year(current),month(current)
    else
        return month(current)
    end if
end function
```

## 返回值类型

### 字符串、数值


作为基础类型，字符串和数值返回时使用对应的变量调用即可。

如果变量和返回值数据类型不同，将发生隐式数据转换，如果转换错误，程序将报错停止运行。


### 结构体

与参数对应，返回值数量也不建议太多，当需要返回大量资料时，建议使用结构体。

如下，返回结构体时，和传参对应，已`结构退变量.*`的形式返回和接受结构体变量。

```sql
main
    define l_ima   RECORD LIKE ima_file.*
    call a1() returning l_ima.*
end main
function a1()
    define p_ima   RECORD LIKE ima_file.* 

    let p_ima.ima01 = '123'
    return p_ima.*
end function
```

### 数组

在处理多笔资料时，当然也可以使用数组类型作为返回值，在返回和接受时和基础类型并没有什么区别。

```sql
main 
    define l_img   dynamic array of RECORD LIKE img_file.*
    call a1() returning l_img
end main

function a1()
    define l_img   dynamic array of RECORD LIKE img_file.*

    let l_img[1].img01 = '123'
    return l_img
end function
```

上述代码没有问题，但上一节我们了解到数组操作如果作为参数，传到函数中是内存地址，如果修改`main`中的数字的值也会变化。
所以上面代码除了用返回数组的形式，我们还可以将数组作为参数传到函数中，这样在函数中修改数组即可，不要再返回数组。

如下：

```sql
main 
    define l_img   dynamic array of RECORD LIKE img_file.*
    call a1(l_img)
end main

function a1(p_img)
    define p_img   dynamic array of RECORD LIKE img_file.*

    let p_img[1].img01 = '123'
end function
```

{{< hint info >}}
**注意**

对数组进行操作时，建议传参数即可，这样可以省略数组返回值，减少代码量。
{{</ hint >}}