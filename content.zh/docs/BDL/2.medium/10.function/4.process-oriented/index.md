---
title: "4.面向过程编程"
weight: 4
date: 2023-07-20T13:17:51+08:00
lastmod: 2023-07-20T13:17:51+08:00
tags: ["process-oriented"]
categories: ["process-oriented"]
# bookComments: false
# bookSearchExclude: false
---

# 面向过程的程序结构

在20世纪60年代计算机发展的初期，程序设计是少数聪明人的工具，程序员可以根据自己的喜好，像捏泥巴一样进行程序设计，注释几乎是一行没有，想到哪写到哪，大多数程序代码组织混乱，可以说只有设计者本人可以看懂，有的甚至设计者读起来也不知所以，常被称为“意大利面条式编程”。

这种个人英雄主义的单打独斗在解决小规模问题时勉强可以，但程序规模的不断扩大，一大堆的问题凸显出来:程序质量低下，进度延误，预算严重超支，就是“软件危机”，给程序开发的前景蒙上了一层暗淡的色彩。

结构化程序设计方法就是在这个背景下提出的，除了前面章节中讲过的3种控制结构:顺序、分支和循环外，结构化程序设计的另-一个关键概念是模块化设计。

## 模块化

生活中常常接触到模块化的概念，模块化程序设计大致有点像小时候玩的积木游戏，用木块组合的方式很容易地就构筑起了“大厦”。模块化至少有两点好处: 一是封装，“积木块”是“基本砖块”的组合，对外是个整体，使用方便，二是可复用，“柱子”封装好后，既可以用在这个建筑上，又可以用在那个建筑上。程序设计也可以借鉴这一思想，用模块化的方法进行程序设计，函数正是模块化方法的体现。

虽说语句是BDL语言的基本单位，但从程序设计总体把握上来看，将函数视为一个整体，大大降低了问题的复杂程度。在解决复杂问题时，首先考虑的是问题的概貌，而不是微小细节，这是人的思维和行动习惯，程序设计也是如此，先将问题分割成-一个个函数，每个函数实现特定的功能，确定函数之间的联系和依赖关系，这是从整体解决某个问题。其次才是考虑每个函数怎么写，算法流程怎么走这些问题，这就是“分而治之、逐步求精”的设计方法学。


## 函数的调用过程

BDL语言是由函数组成的，本章前面以及介绍了函数的定义、声明和调用等基础只是，下面来看一下函数的调用过程，即不同函数是和配合的。如图：

{{< mermaid >}}
flowchart TD
    subgraph a["main"]
        e["函数1"]-->f["函数2"]
    end
    subgraph b["函数1"]
        i["语句1"]-->g["函数3"]
        g-->h["语句2"]
    end
    subgraph c["函数2"]
        j["..."]
    end
    subgraph d["函数3"]
        k["..."]
    end
    e--"call"-->b
    b--"return"-->e
    f--"call"-->c
    c--"return"-->f
    g--"call"-->d
    d--"return"-->g
{{< /mermaid >}}

## 一个入库一个出口

结构化程序设计主张使用顺序、选择、循环3种基本结构来嵌套连接成具有复杂层次的“结构化程序”，严格控制goto语句的使用。

需要强调的一点是，对单个模块而言，只有一个人口，一个出口。这是一种从上到下的流程式方法，减少了模块间的相互联系，使模块可作为插件或积木使用，降低程序的复杂性，提高可靠性。

## 封装和可重用


可作为插件或积木使用的模块具有很强的可重用性，完全可用在其他同类型的问题中，省却了将算法重写一遍的麻烦。对一些规模较大的商业软件公司来说，模块的积累是笔巨大的财富，到达一定的规模后，解决问题时要重新写的代码和模块很少，从库中挑选出需要的模块，拼装组合就形成了满足要求的程序。而且，如果在模块编制中注重算法的效率等因素，采用这种插件组合的方式可以很容易产生出高质量的软件产品。

下面来看一下封装性。在模块化程序设计中，模块内部的结构，对其他模块来说是不重要的，以函数为例来说明，BDL语言中，函数可看成是一个封装体，将一系列相关的、实现某一功能的代码封装起来，并提供了一个使用方法(程序开发中常称接口)，通过该接口可以在程序的任何地方使用这些代码完成特定的功能，至于函数是如何编写的，可能并不是用户关心的重点，用户真正关心的是这个函数如何使用。这就意味着，函数内定义的变量等，外部是不能访问的，为此，引入“内聚”和“耦合”的概念。


## 高内聚，低耦合

既然模块化设计有那么多的好处，那是不是可以不管三七二十-地把整个程序简单地分解成一个个程序段呢?答案是否定的，模块的划分有条准则，即“相对独立，功能单一”。也就是说，一个好的模块必须具有高度的独立性和相对较强的功能，这通常用“耦合度"、“内聚度”两个指标从不同侧面而加以度量。

耦合度，是指模块之间相互依赖性大小的度量，耦合度越小，模块的相对独立性越大。内聚度，是指模块内各成分之间相互依赖性大小的度量，内聚度越大，模块各成分之间联系越紧密，其功能越强。

在模块划分时应当做到“耦合度尽量小，内聚度尽量大”。

