---
title: "7.练习"
weight: 7
date: 2023-07-19T16:56:50+08:00
lastmod: 2023-07-19T16:56:50+08:00
tags: ["practice"]
categories: ["practice"]
# bookComments: false
# bookSearchExclude: false
---

# 练习

## 测试以下代码输出

```sql
    define m,n integer
    define x,y decimal(20,6)
    let m = 1 let n = 2
    let x=1.41 let t=2.5

    display sfmt("\nm<n and y-1>x=%1",m<n and y-1>x)
    display sfmt("m<n or y-1>x=%1",m<n or y-1>x)
    display sfmt("not (y-1>x)=%1",not (y-1>x))
```

## 用笔计算处以下代码运行结果，然后键入系统。

> 看看笔算的结果和系统计算结果一样

```sql
    define a,b integer
    let a=5 let b=4

    display sfmt("\n最后输出的结果是%1，但是a的值是%2",a=2*8,a/4)
    let a=2*8
    let a=a/4
    display sfmt("a的值是%1",a)
    display sfmt("a和b的比较结果是=%1",a==b)
```