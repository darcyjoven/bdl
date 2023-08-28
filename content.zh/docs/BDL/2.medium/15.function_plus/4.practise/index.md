---
title: "4.练习"
lastmod: 2023-08-28T14:21:21+08:00
date: 2023-08-28T14:21:21+08:00
tags: ["practise"]
categories: ["BDL"]
weight: 4
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---


# 练习

## 生成一个长度为100的整数数组，并输出数组中可以被5整除的个数

1. 长度100的整数数组，每个元素都为随机数，大于0且小于1000的整数

{{< hint info >}}
**提示**

`util.Math.rand(100)`可以获取小于等于100的随机整数。

```sql
import util
main
    display util.Math.rand(100)
end main
```
{{</ hint>}}

2. 生成随机数功能写为一个函数，且接受两个参数，生成数组的长度和随机数最大整数


## 生成一个长度为50的整数数组，并从小到大排序，排序后输出到屏幕

1. 随机数生成请参考上一题