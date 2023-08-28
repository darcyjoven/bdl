---
title: "2.if else--两条岔路的选择"
weight: 2
date: 2023-07-19T19:16:40+08:00
lastmod: 2023-07-19T19:16:40+08:00
tags: ["if else"]
categories: ["if else"]
# bookComments: false
# bookSearchExclude: false
---
# if else--两条岔路的选择

还是拿买东西做比方，口袋里只有50块钱，想买一件衣服，衣服的价格标签不见了。这时，你也许会在心里盘算，问一下衣服的价格，如果价格低于50，就说“好，买了”，否则，就说“太贵了，算了”。这种“两条岔路中选一个”的流程，在BDL语言中对应着if else结构。

## 关键在else

改写上一章的代码，使用if else 结构，如下：

```sql
define price integer
    prompt "请输入商品价格（正整数）：" for price
    if price < 50 then
        display "\n好，买好了"
    else
        displau "\n太贵了，算了"
    end if
```

无论输入多少价格，输出的结果要么是`好，买好了`，要么是`太贵了，算了`。

**代码解析**

第一个代码中采用的是if结构，在price超过50的时候不做出任何反应，一声不吭地走开，如此看来，第二个代码中的顾客似乎更礼貌一点， 在price小于50这个 条件不成立时，会输出拒绝信息“太贵了，算了”。


如果转为流程图如下：

{{< mermaid >}}
flowchart TD
    a(["开始"])-->b[/"申明变量price，并输出提示信息，请求用户输入"/]
    b-->c[/"接受用户输入"/]
    c-->d{"price<50?"}
    d--"yes"-->e["输出：'好，买好了'"]
    d--"no"-->f["输出：'太贵了，算了'"]
    e-->g(["结束"])
    f-->g
{{< /mermaid >}}


当程序流程来到if else结构时，首先计算关键字if后“表达式”的值，如果表达式的值为“真”(不为0)，代码段1被执行，否则，else关 键字后的代码段2被执行。


