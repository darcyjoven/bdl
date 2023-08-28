---
title: "6.运算符优先级"
weight: 6
date: 2023-07-19T16:34:55+08:00
lastmod: 2023-07-19T16:34:55+08:00
tags: ["operation priority"]
categories: ["operation priority"]
# bookComments: false
# bookSearchExclude: false
---
# 运算符优先级

BDL中运算符具有不同优先级和结合性。

在表达式中，各运算量参与运算的先后顺序不仅要遵守运算符优先级别的规定，还要受运算符集合的制约，以便确定自左向右进行运算还是自右向左预算。

## 优先级、结合性汇总

优先级|运算符|结合性|说明|用法
-----|-----|-----|----|-----
13|units|左|间隔转换|(12) units day
12|**|左|幂|`x**5`
12|mod|左|求余数| x mod 2
11|`*`|左|乘法|x*y
11|`/`|左|除法|x/y
10|+|左|加法|x+y
10|-|左|减法|x-y
9|\|\||左|连接符|"ab"||"cd"
8|like|右|字符串比较|mystring like "A%"
8|matches|右|字符串比较|mystring matches "A*"
7|in()|左|清单比较|var IN('CA','NY')
6|<|左|小于|a<10
6|<=|左|小于等于|a<=10
6|>|左|大于|a>10
6|>=|左|大于等于|a>=10
6|==|左|等于|a==10
6|<> or !=|左|不等于|a<>10
5|is null|左|控制判断|a is null
5|is not null|左|控制判断|a is not null
4|not|左|非|not(a=b)
3|and|左|与|a=b and a=c
2|or|左|或|a=b or a=c
1|ascii()|右|ascii值|ascii(32)
1|clipped|右|尾部去空格|"as " clipped
1|column|右|空白字符|display column 32,"a"
1|spaces|右|空格|a = "a"(5)space
1|sqlstate|右|sql状态|if sqlstate="ix000"
1|sqlerrmessage|右|sql错误信息|display sqlerrmessage
1|using|右|格式化字符串|today using "yy/mm/dd"

这些不需要死记硬背，你可以随时来查看，在你不确定的时候，直接用`()`讲需要优先运行的包裹起来，就避免要考虑太复杂情况。

