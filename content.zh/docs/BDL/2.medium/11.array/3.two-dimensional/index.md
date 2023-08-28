---
title: "3.二维数组"
weight: 3
date: 2023-07-20T16:20:31+08:00
lastmod: 2023-07-20T16:20:31+08:00
tags: ["two-dimensional"]
categories: ["two-dimensional"]
# bookComments: false
# bookSearchExclude: false
---

# 二维数组

一维数组常称为向量，本节介绍二维数组。所谓二维数组，最简单的理解是“有两个下标’如果把一维数组理解为一行数据，那么，二维数组可形象地表示为行列结构，如图所示,左侧表示的是一个大小为M的一维数组：

A[1]|A[2]|...|A[M]
------|------|---|-----


右侧表示的是-一个大小为M*N的二维数组：

A[0,1]|A[0,2]|...|A[0,N]
------|------|---|-----
A[1,1]|A[1,2]|...|A[1,N]
...|...|...|...
A[M,1]|A[M,2]|...|A[M,N]

## 二维数组的定义

和一维数组一样，定义二维数组时，要告诉编译器以下信息：数组名、元素类型、元素的个数。对二维数组来说，元素个数时两位大小的成绩。

动态数组时只要定义数组的维度即可。

示例如下：

```sql
    define a array [2,3] integer -- 定义一个2x3的定长数组，一共有2*3=6个元素。
    define b dynamic with dimension 2 of string  --定义一个二维的动态字符串数组
```

定长和动态二维数组都可以访问的语法都是一样的。

```
array[m,n]
```

## 二维数组应用举例

查看以下代码，演示二维数组的使用方式。

```sql
    define score array[6,3] of integer --表示6个学生的3门成绩
    define s array[3] of integer --每门课的总成绩
    define i , j integer

    -- 输入总共18门成绩
    for i = 1 to 6
        prompt sfmt("请输入第%1位学生的成绩%2：",i,1) for score[i,1]
        prompt sfmt("请输入第%1位学生的成绩%2：",i,2) for score[i,2]
        prompt sfmt("请输入第%1位学生的成绩%2：",i,3) for score[i,3]
    end for

    -- 计算每门课总成绩
    for i = 1 to 3
        let s[i] = 0
        for j = 1 to 6
            let s[i] = s[i] + score[j,i]
        end for
    end for

    display "\n平均成绩："
    for i = 1 to 3
        display sfmt("第%1门课的平均成绩为%2",i,(s[i]/6 using  "<<<<<<##.&&"))
    end for
```

输出结果为：
```
平均成绩：
第1门课的平均成绩为268.00
第2门课的平均成绩为120.33
第3门课的平均成绩为169.17
```

请注意每次访问数组的时候，`[]`的索引是用的哪一个。

