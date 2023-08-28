---
title: "5.练习"
weight: 5
date: 2023-07-20T17:49:58+08:00
lastmod: 2023-07-20T17:49:58+08:00
tags: ["practise"]
categories: ["practise"]
# bookComments: false
# bookSearchExclude: false
---

# 练习

## 定义一个字符串数组，并输出每个字符串字符对应ASCII的值

字符串数组的值分别为`"A","b","C","d","e","F","G"`

## 写出下列代码输出结果

```sql
    define i,j integer
    define a array[4] of integer
    let a[1]=1 let a[2]=2 let a[3]=3 let a[4] =4
    for i = 1 to 4
        for k = 1 to i
            let a[i] = a[j] - a[i]
        end for
    end for
    for i = 1 to 4
        display sfmt("%1",a[i])
    end for
```