---
title: "2.数据表结构在BDL中的使用"
lastmod: 2023-08-24T08:36:16+08:00
date: 2023-08-24T08:36:16+08:00
tags: ["schema"]
categories: ["BDL"]
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 数据表结构在 BDL 中的使用

在数据库中，每个表的建立都会产生表结构文件，叫做`schema`文件。

在我们使用数据库时，如果你需要大量的数据中的资料，不需要频繁的查询数据中的表结构，通过表结构中字段的数据类型去对应`BDL`中的数据类型。在`BDL`中已经为我们做好了这一步，`ORACLE`中大部分数据类型在`BDL`中都映射到指定的类型。

我们只要使用数据库的`schema`文件，就能通过数据的字段去定义`BDL`中的数据类型。

上一章我们学到了`function main() end function`这种`main`函数写法，只会使用表结构，而不连接到数据库，指得就是使用`schema`文件，而不连接到数据库。

## 在 BDL 中使用 schema 定义变量

只要将之前定义变量中的数据类型修改为`like ds:table.cloumn` 即可定义这个变量类型为 ds 库中 table 这个表的 column 这个字段在数据库中的类型。

其中`ds:`库名可以省略，如果省略，表示使用当前已经连接到的库。

例如:

```sql
database ds
main
    define l_ima01 like ima_file.ima01
    define l_ima02 like ima_file.ima02
end main
```

除了在使用`ima_file`字段时，可以依据`ima_file`字段的名称定义，在 TIPTOP 中，常用的字段类型都定义在了`type_file`中，可以根据 type_file 类型定义我们经常使用的变量，如金额、库存数量、单价这些常用变量。

> `type_file`字段清单如下

| 字段名称 | 数据类型       | 字段名称 | 数据类型      |
| :------- | -------------- | :------- | ------------- |
| chr1000  | varchar2(1000) | chr6     | varchar2(6)   |
| chr1     | varchar2(1)    | chr50    | varchar2(50)  |
| num5     | number(5)      | chr37    | varchar2(37)  |
| num20_6  | number(20,6)   | chr9     | varchar2(9)   |
| dat      | date           | chr12    | varchar2(12)  |
| chr18    | varchar2(18)   | chr30    | varchar2(30)  |
| num10    | number(10)     | chr14    | varchar2(14)  |
| chr8     | varchar2(8)    | chr7     | varchar2(7)   |
| chr20    | varchar2(20)   | chr10    | varchar2(10)  |
| chr21    | varchar2(21)   | chr100   | varchar2(100) |
| num20    | number(20)     | chr200   | varchar2(200) |
| chr3     | varchar2(3)    | chr300   | varchar2(300) |
| num26_10 | number(26,10)  | chr500   | varchar2(500) |
| chr2     | varchar2(2)    | blob     | blob          |
| chr4     | varchar2(4)    | num15_3  | number(15,3)  |
| chr5     | varchar2(5)    | row_id   | varchar2(18)  |


## 进阶使用--record

在实际业务中，我们经常使用的场景是，查询一个表每个字段的数据，更新/新增一个表所有字段。

有时候一个表的字段可能是几十个，这个时候我们再每个字段去单独定义，容易出错。并且之后表有所异动时，容易遗漏修改。

BDL为我们设计了一个可以简化整张表定义的语法。

```sql
define l_ima record like ima_file.*
```
> 注意这种方式定义时，没有`end record`

`ima_file.*` 就表示这个表所有字段。必须和record配置使用。
l_ima的结构体自动就包含了ima_file中的所有字段，使用`l_ima.ima01` `l_ima.ima02` `l_ima.ima021`即可调用这些字段。

## 注意事项

BDL 使用`schema`文件，在编译时，会自动的将`schema`文件中的数据类型映射到`BDL`中的数据类型。所以如果数据库数据类型变化，或者字段变动，那么 BDL 对应的文件也需要重新编译。

> 如果重新产生 schema 文件
> {{< tabs "重新产生schema文件" >}}
> {{< tab "TIPTOP GP" >}}

```bash
r.s2 ds #ERP服务器中运行
```

{{< /tab >}}
{{< tab "T100" >}}
{{< /tab >}}
{{< /tabs >}}