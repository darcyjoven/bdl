---
title: "3.函数调用与返回"
weight: 3
date: 2023-07-20T11:27:41+08:00
lastmod: 2023-07-20T11:27:41+08:00
tags: ["call"]
categories: ["return"]
# bookComments: false
# bookSearchExclude: false
---

# 函数调用与返回

## 形参和实参

请观察一下代码：
```sql
main
    define x,y,sum integer
    let x = 5 let y = 7
    call add(x,y) returning sum
    display sum
end main
function add(a,b)
    define a,b integer
    return a + b
end function
```
在上面代码中参数列表是a和b，而在函数调用时传递进来的参数是x和y，这两种参数是申明关系呢？
打个形象的比方，这是角色和演员的关系。

函数定义时列表中参数为形数，是“剧本角色”，而函数调用时传递进来的参数称为实参，是“演员”，函数执行的过程就是演戏的过程。


程序刚开始执行的时候，系统并不为形参分配存储空间，因为它只是个角色，不是实体，一直要到函数调用时，系统为形参分配存储空间，并将实参的值复制给形参。

结合代码上面代码可知，在`call add(x,y) returning sum`语句调用前，a和b都不是真正的程序变量，一直到add函数被调用，a和b才被创建，并分别用x和y为其赋值，在这种情况下，在函数内对a和b的处理并不影响x和y，这类似于“ 某个演员扮演的角色在戏中受伤，并不是说演员真的受伤了”，而且，在函数执行结束返回时，创建的形参被撤销，这类似于“戏演完
了，剧中角色自然也就停止了”。

举例来看，下列示例代码先交换两个变量的值，但并没有成功，为什么?请试着用演员和角色的关系来解释一下。

```sql
--视图交换两个变量的值
main
    define num1,num2 integer
    display ""
    display sfmt("num1 is %1,num2 is %2 ",num1,num2)
    call swap2Variable(num1,num2)
    display sfmt("num1 is %1,num2 is %2 ",num1,num2)
end mian
function swap2Variable(a,b)
    define a,b,c integer
    
    display sfmt("a is %1,b is %2 ",a,b)
    let c = a
    let a = b
    let b = c
    display sfmt("a is %1,b is %2 ",a,b)
end function
```
输出结果为：
```
num1 is 10,num2 is 5
a is 10,b is 5
a is 5,b is 10
num1 is 10,num2 is 5
```

**代码解析**

在函数调用时，形参a和b才被创建，并分别用num1和num2为其赋值，而后，在函数内对a和b的交换成功，但这与外部的numl和num2完全无关，函数执行完毕退出时，形参a和b被撤销，再次输出num1和num2,两者的值并没有交换。

形参和实参有如下特点：
1. 即使同名，实参和形参也不共用一块内存，形参变量只有在函数被调用时才分配内存空间，由实参将数据传给形参，在函数调用结束后，立即释放形参占用的内存空间。
2. 实参可以是变量、常量、表达式甚至是函数等，无论实参是何种类型的量，在进行函数调用时，其必须有确定的值，以便把这些值传给形参，因此，应预先用赋值、输入等方法使实参获得确定值。
3. 对于自定义函数和库函数，形参的类型已经说明，调用函数时，形参和实参在数量、类型和顺序上应保持-致。特别强调类型一致，如果是可自动转换的类型差异，编译器将自动完成相互间的转换。如果对应的形参和实参类型不一致，且编译器无法完成其间的自动转换,编译器将报错。

## 函数返回

看一下以下代码：

```sql
    function add(a,b)
        define a,b integer
        return a + b
    end function
```
既然说a和b都是形参，在程序调用时才创建，程序退出时便被撤销，那类似"return a+b"之类的返回语句岂不是没有意义，返回一个被撤销的量？

函数的返回机制应如何理解呢？

理解的关键词时“复制”，执行到return语句时，return的值被复制到某个内存单元或寄存器中，其地址是由系统来维护的，我们不用操心，也就是说，在a和b被撤销前，返回值被保存在某个地方，系统访问该内存单元即可知道函数的返回值。

下属语句:
```
call add(x,y) returning z
```

实际上面代码完成下述一系列操作
1. 将实参x和y以传值方式传人函数add中，函数触发
2. 返回值的值复制保存到某个内存单元处，假设是M处
3. 用M处保存的函数返回值复制给变量z

