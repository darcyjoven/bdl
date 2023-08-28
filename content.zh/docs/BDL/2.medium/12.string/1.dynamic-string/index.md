---
title: "1.动态长度字符串"
weight: 1
date: 2023-07-20T18:03:04+08:00
lastmod: 2023-07-20T18:03:04+08:00
tags: ["dynamic string"]
categories: ["dynamic string"]
# bookComments: false
# bookSearchExclude: false
---

# 动态长度字符串

我们知道BDL中可以存放数据类型的类型有好几种，`string`、`char`、`varchar`。`text`和`byte`有特殊不再本章讨论范围。

对于定长类型`varchar`、`char`也不再本章讨论范围内。之后所说字符串特指`string`类型的字符串。

所以要处理除了`string`类型的字符串，需要先转换为`string`类型。

如果最大长度允许，`string` 与`char`、`varchar`在大部分地方都可以自动转换。但在SQL语句中无法自动转换。

{{< hint warning >}}
**注意**

BDL4.01版本之后`string`类型也可以用于SQL中。
{{< /hint >}}

## 字符串的方法

字符串的处理，就是通过BDL预定义的方式实现的，因为方法是绑定数据类型，所以`char`和`varchar`都是不能调用字符串`string`的方法的。

### 拼接字符串

语法
```
append(a string) returning s string
```
使用案例

```
    define s string
    let s = "darcy"
    let s = s.append(".joven")
```
除了调用方法，拼接字符串还有很多其它方式。

1. 逗号拼接

```sql
    define s string
    let s = "darcy",".joven"
```
这是最常用的字符串拼接方法
2. ||拼接

```sql
    define s string
    let s = "darcyjoven"||"'s blog"
```
这种方式与逗号拼接区别在于，不能存在空值，有任意一个字符串为空值，最后的结果都为空值
3. sfmt()拼接

```sql
    define s string
    let s = sfmt("darcy%1","joven")
```
sfmt()拼接的好处在于：非字符串类型为显示转换。

### 字符串比较

```
equals(s string) return b boolean
```

使用示例：
```sql
    define x,y string
    let x = "darcyjoven"
    let y = "darcy"
    if x.equals(y) then
        display "OK"
    end if
```
相比equals，我们更经常用的比较字符串的方式是用`==`或者`=`直接判断。
例如：
```sql
    define x,y string
    let x = "darcyjoven"
    let y = "darcy"
    if x == y then
        display "OK"
    end if
```

两只的区别是当两侧的值都为空值时，`equals`比较的结果是真，`==`比较的结果是假。


>`string`类型还有一个忽略大小写比较的方法，`equalsIgnoreCase`用法和`equals`一致


### 取子字符串/字符

用例：
```sql
    define s,a,b string
    let s = "darcyjoven@gmail.com"
    let a = s.getCharAt(11)
    let b = s.subString(1,10)
```
需要注意的是，字符串第一个字符的位置是1。

## 获取字符串长度

```sql
    define s string
    define a,b integer
    let s = "darcyjoven  "
    let a = s.getLength()
    let b = length(s)
    display sfmt("s.getLength() = %1 length(s) = %2",a,b)
```
除了`string`的方法`getLength()`，BDL还有一个内置的函数`lenght(s string) returning l integer`可以获取字符串的长度。

请编译以上代码，比较两只的区别。

### 大小写转换

```sql
    define s string
    let s = "DarcyJoven"
    let s = s.toLowerCase()
    display sfmt("\nmy name is %1",s)
    let s = s.toUpperCase()
    display sfmt("my name is %1",s)
```

### 去除空格

```sql
    define a,b string
    let a = " darcy joven's email is darcyjoven@gmail.com "
    let b = a.trim()
    display b
    let b = a.trimLeft()
    display b
    let b = a.trimRight()
    display b
```

## 其它常见字符串操作

一些常用的字符串操作，一些字符串操作要借助其它数据类型，或者其它函数。

这里介绍几种非常常用的用法。

### 替代字符串

替代字符串是将原字符串中含有的部分字符串替换为新字符串，如果没有的话，仍输出原有字符串。

此方法在`string`类型中没有，需要借助`base.StringBuffer`字符串流类型处理。

使用办法：

```sql
    define buf base.StringBuffer
    let buf = base.StringBuffer.create()
    call buf.append("darcyjoven@gamil.cn")
    call buf.replace("cn","com",0)  -- 0 代表，要全部替换 ，其它正整数n，代表替换前n个
    display buf.toString()
```

因为这个使用场景实在太多，`tiptop`产品依据替我们封装在了lib函数中。

{{< tabs "uniqueid" >}}
{{< tab "tiptop gp" >}}
```sql
    call cl_replace_init() -- 调用此函数表示全部替换，默认调用
    call cl_replace_once() -- 调用此函数表示只替换一个
    call cl_replace("darcyjoven@gmail.cn","cn","com")
```
{{< /tab >}}
{{< tab "T100" >}}

{{< /tab >}} 
{{< /tabs >}}

### 字符串分割

字符串分割是将一个字符串依据一个字符/字符串（分割符号）分割为多个子字符串。

此操作需要借助`base.StringTokenizer`类型。

>子字符串中不包含分隔符

示例：

```sql
    define s string
    define tok base.StringTokenizer
    
    let s = "darcyjoven@gmail.com;darcy_joven@live.com;darcy_joven@163.com;"
    let tok = base.StringTokenizer.create(s,";")
    while tok.hasMoreToken()
        display tok.nextToken()
    end while
```

`tok.hasMoreToken()`判断是否还有值，如果有值，可以利用`tok.nextToken()`将下一个值取出来。

需要注意的是`tok.nextToken()`取值的时候，会自动切换到下一个值，所以`base.StringTokenizer`只能顺序操作，不能返回上一个值操作。

