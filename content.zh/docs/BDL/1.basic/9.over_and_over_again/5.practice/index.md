---
title: "5.练习"
weight: 5
date: 2023-07-20T09:59:33+08:00
lastmod: 2023-07-20T09:59:33+08:00
tags: ["practice"]
categories: ["practice"]
# bookComments: false
# bookSearchExclude: false
---

# 练习

## 以下代码输出结果是什么

```sql
    define i,j integer
    let i = 1 let j = 3
    while j<5 or i>3
        let i = i + 1
        let j = j + 1
        display "*"
    end while
```
## 根据以下代码，写出变量a和b的值

```sql
    define a,b integer
    while a > 0 
        let b = b + 1
        let a = a - 2
    end while
    display sfmt("\na=%1,b=%2",a,b)
```

## 已以下这种格式控制台打印99乘法表

```
1*1=1
1*2=2 2*2=4
1*3=3 2*3=6 3*3 =9
...
1*8=8 2*8=16 3*8=24 ... 8*8=64
1*9=9 2*9=18 3*9=27 4*9=36 ... 9*9=81
```