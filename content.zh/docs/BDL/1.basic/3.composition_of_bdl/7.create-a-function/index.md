---
title: "7.设计一个BDL函数"
weight: 7
date: 2023-07-17T16:20:12+08:00
lastmod: 2023-07-17T16:20:12+08:00
tags: ["function"]
categories: ["function"]
# bookComments: false
# bookSearchExclude: false
---
# 设计一个BDL函数
用BDL语言库函数和第三方提供的函数组装程序是程序设计的--条捷径和重要方法。但是，一个BDL程序不可能只由一个main函数组成，不能在main函数中实现所有的功能。编写程序，更多的时候需要程序员自己动手创建新的函数。

## 在main函数中计算3个整数的平均数

先看以下代码

```sql
databse ds
main
    define a,b,c,y integer  --定义abc为整型
    let a = 1               --赋值
    let b = 2               --赋值
    let c = 3               --赋值
    let y = (a+b+c)/3       --进行数字计算
    display sfmt("\n the average is %1",y)
end main
```

编译后运行，程序输出为
```
the average is 2
```

**代码解析**

1. `main`
不再赘述
2. `define a,b,c,y integer`
定义变量为整形，
3. `let ...= 1,2,3`
变量赋初始值
4. `let y = (a+b+c)/3`

向编译器声明变量y为整型变量。计算a+b+c的值得到6，再整除3，得到2。
然后将2赋值给y。
“()"在这里同数学里的四则运算中的小括号“()”一样，表示需要优先运算。
“/”相当于四则运算中的除法运算。

5. display sfmt("\n the average is %1",y)

在控制台中打印出y的值
这段代码计算1、2、3三个整数的平均值，最后正确打印出结果来。

## 在main函数中分3次计算3个整数的平均值

如果需求变化为先计算1、2、3这3个整数的平均值后，再计算1234、2345、3456这3个整数的平均值，最后计算9876、2345、1这3个整数的平均值呢?

方法一以下所示。

```sql
databse ds
main
    define a,b,c,y,a2,a3,b2,b3,c2,c3,y2,y3 integer  --定义abc为整型
    let a = 1               --赋值
    let b = 2               --赋值
    let c = 3               --赋值
    let a2 = 1234 let a3 = 9876
    let b2 = 2345 let b3 = 2345
    let c2 = 3456 let c3 = 1
    
    let y = (a+b+c)/3       --进行数字计算
    let y2 = (a2+b2+c2)/3       --进行数字计算
    let y2 = (a3+b3+c3)/3       --进行数字计算
    display sfmt("\n the average is %1",y)
    display sfmt("\n the average is %1",y2)
    display sfmt("\n the average is %1",y3)
end main
```

编译运行后输出如下：
```
the average is 2
the average is 2345
the average is 4074
```

### 自编函数实现计算3个整数平均值

关注以下3行代码：

```sql
let y = (a+b+c)/3
let y2 = (a2+b2+c2)/3
let y2 = (a3+b3+c3)/3
```

这3行代码将求平均值的公式使用了3次。重复的代码将使得以后的代码维护困难，因为一个地方修改，其他重复的地方也要修改。这3行代码的功能相同，虽然很简单，但是可以将其抽取出来形成一个函数。

具体以下所示。

```sql
databse ds
main
    define a,b,c,y,a2,a3,b2,b3,c2,c3,y2,y3 integer  --定义abc为整型
    let a = 1               --赋值
    let b = 2               --赋值
    let c = 3               --赋值
    let a2 = 1234 let a3 = 9876
    let b2 = 2345 let b3 = 2345
    let c2 = 3456 let c3 = 1
    
    let y = average(a+b+c)       --进行数字计算
    let y2 = average(a2+b2+c2)       --进行数字计算
    let y2 = average(a3+b3+c3)       --进行数字计算
    display sfmt("\n the average is %1",y)
    display sfmt("\n the average is %1",y2)
    display sfmt("\n the average is %1",y3)
end main
-- 函数定义：具体函数实现
-- 函数名：average
-- 参数：a,b,c三个整形参数
-- 返回值：整形，返回3个整数的平均值
function average(a,b,c)
    define a,b,c integer
    return (a+b+c)/3
end function
```
编译运行代码，结果和之前一样。

## 如何自编写函数

对上面的代码说明如下：

1. 函数调用

```
let y = average(a+b+c)
let y2 = average(a2+b2+c2)
let y2 = average(a3+b3+c3)
```

着3行就是在调用函数`average`。
2. 函数定义部分
```sql
function average(a,b,c)
    define a,b,c integer
    return (a+b+c)/3
end function
```
函数定义的语法规则如下：
```sql
funtion 函数名(参数1,参数2...)
    define 参数1,参数2... --参数类型定义
    函数体部分
end funtion
```

**代码解析**

average是函数名称。
名称由程序员自己决定，符合命名规则即可。 
小括号内的“a,b,c”是3个参数的列表。
`function`下一行中，`define a,b,c integer` 表示3个参数都是整数类型。

3. `return`是BDL语言提供的关键字。
其功能是终止函数的执行，从函数中返回到调用它的地方，并可以向调用者返回其后表达式的值。
return 作用有两个：
+ 返回
+ 返回值

