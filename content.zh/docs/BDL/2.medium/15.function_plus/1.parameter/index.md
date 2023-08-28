---
title: "1.函数的参数"
lastmod: 2023-08-27T16:11:25+08:00
date: 2023-08-27T16:11:25+08:00
tags: ["parament"]
categories: ["function"]
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 函数的参数

在BDL中除了变量定义，其它所有操作都需要在函数中进行。

所以能够灵活使用函数是编程能力重要体现，使用函数时，除了程序逻辑需要考虑，如何定义函数的结构也是值得考虑的。

函数的结构包括两部分，参数与返回值。

## 参数个数

函数的参数个数是无上限的，且不是必须含有参数。

<<<<<<< HEAD
=======
### 0个参数

>>>>>>> 1d67cdd5786f4fafd74c3017d23ade5bb17724be
如果你的函数不受程序的上下文影响，或者说不需要考虑调用之前做了哪些操作，那么你的函数就不要参数。

BDL自带函数中有不少类似函数如下：
```sql
fgl_lastkey() --获取最后一次按下的按键
```
<<<<<<< HEAD
=======

### 任意个数参数

任意个数的参数需要在在定义`function`时就确认，参数时变量的一种，需要定义在函数体的括号中，由`,`作为分隔符。

在函数中还必须定义所有参数的数据类型。
调用时传入的参数需要和定义的参数个数一样，且数据类型一致(可以转换的数据类型会自动转换)。


```sql
main
    display add(1,'2',3,'4',...,n)
end main
function add(x1,x2,x3,x4,...,xn)
    return x1+x2+x3+x4+...+xn
function 
```

## 参数类型

### 字符串、数值参数

在BDL中，基本类型只有两种字符串和数值，如果参数是这两种基础类型之一，那么参数是将实际的值传递到函数中。

例如：

```sql
main
    define x,y string
    define i,j integer
    let x = 'demo'
    let i = 2
    let j = 3
    display sfmt('add(i,j) is %1,i is %2 ,j is %3',add(i,j),i,j)

    let y = ext(x)
    display sfmt("x is %1 y is %2",x,y)
end main
function add(a,b)
    define a,b integer
    let a = a + 1
    let b = b + 1
    return a+b
end function
function ext(x)
    define x string
    let x = x+".ext" 
    return x
end function
```

如上述例子，参数`x,i,j`是将值传递到函数中，函数中会将传递过来的值赋值到自己的变量中。

所有无论函数如何对自己的变量进行操作，都不影响`main`函数中变量的值。

### 结构体参数

虽然`BDL`中参数的个数不受限制，但是当参数个数过于多时，一个函数维护的难度就非常的复杂。例如：哪些参数对应什么功能，哪些参数可以为空，哪些参数不可以为空，参数的顺序。

为了减少参数数量，我们可以使用结构体作为参数，这样参数的个数就变得可控了。

并且结构体中只要将需要的成员赋值，其它成员即使没有初始化也可以传递参数给函数。

结构体作为参数如下：

```sql
main
    define l_ima record like ima_file.*
    let l_ima.ima01 = 'MRA-001'
    call dis(l_ima.*)
end main
function dis(p_ima)
    define p_ima record like ima_file.*
    if p_ima.ima02 is null then
        let p_ima.ima02 = 'null'
    end if
    display sfmt('料号：%1 品名：%2 规格：%3 ',p_ima.ima01,p_ima.ima02,p_ima.ima021)
end function
```

结构体变量作为参数时传递的也是变量的值，在函数中修改参数的值，不会影响`main`函数中变量的值。

{{< hint info >}}
**注意**

结构体作为参数传参时，需要以`变量名.*`的形式传参。
{{</ hint >}}

### 数组参数

在传递结构体时，我们传递了一行数据用`dis`函数显示出来，但是在实际的应用中，我们需要显示的不是一笔，而是多笔，10笔，20笔，甚至时上万笔。

如果使用循环调用上万次`dis`函数，确实可以实现，但是这样会非常消耗内存，并且效率非常低下。
为了提高效率，我们可以使用数组作为参数，数组中存放结构体，这样就可以一次性将数据传递给函数。

```sql
main
    define l_ima dynamic array of record like ima_file.*
    define l_i integer
    for l_i = 1 to 10000
        let l_ima[l_i].ima01 = sfmt('MRA-%1',l_i using '&&&&')
    end for
    call dis(l_ima)
    display l_ima[1].ima02 --!!!!!
end main
function dis(p_ima)
    define p_ima dynamic array of record like ima_file.*
    define l_i integer
    for l_i = 1 to p_ima.getLenght()
        if p_ima[l_i].ima02 is null then
            let p_ima.ima02 = 'null'
        end if
        display sfmt('料号：%1 品名：%2 规格：%3 ',p_ima[l_i].ima01,p_ima[l_i].ima02,p_ima[l_i].ima021)
    end for
    
end function
```

发现了吗，上述例子中，运行后，`main`函数中的数组变量的值也被修改了！！

数组变量作为参数时，传递的不是**值**，而是数组变量在内存中的**内存地址**，所以你在`dis`函数中修改的数组中任何内容，在`main`中也是同步修改。

实际上这不是数组作为参数的特殊性，而是数组的特殊性。

数组在内存中是一块连续的内存空间，数组保存的是每块内存空间的地址，而不是每块内存空间的值。

所以在`dis`函数中数组和`main`函数中数组随便变量名不同，但是他们地址指向的内存块都是同一块，所以修改也是同步生效，在任意函数中修改，在任意函数中都只能看到修改后的内容。

{{< mermaid >}}
graph LR 
    a["1"]-->b["0x001"]
    b-->b1["物理内存"]
    c["2"]-->d["0x002"]
    d-->d1["物理内存"]
    h["..."]-->g["..."]
    g-->g1["..."]
    e["n"]-->f["0x00n"]
    f-->f1["物理内存"]
{{</ mermaid >}}

{{< hint warning >}}
**注意**

数组作为参数时，传递的指针，对数组进行修改，会永久影响整个数组变量的值。
{{</ hint >}}
>>>>>>> 1d67cdd5786f4fafd74c3017d23ade5bb17724be
