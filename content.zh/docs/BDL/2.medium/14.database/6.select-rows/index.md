---
title: "6.多笔查询"
lastmod: 2023-08-24T16:53:04+08:00
date: 2023-08-24T16:53:04+08:00
tags: ["SQL"]
categories: ["BDL"]
weight: 6
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 多笔查询

在上一节中我们学会了多种方式查询数据中数据，且即使多条结果，也能够灵活查询。

这节我们将重点介绍多笔查询的注意点，和进阶查询语法`FOREACH`。


## FETCH--进行多笔查询

在上一节中我们用`FETCH`可以查询一条数据，也可以查询多比数据。

现在我们假设有一个需求，查询数据中`ima_file`中字段ima01以`E`开头的所以资料。并将查询的结果保存到一个数组中。

让我们利用上一节的FETCH来完成上述需求。

```sql
define l_ima dynamic array of record like ima_file.*
define l_cnt,l_i integer
define l_sql string

-- 获取查询结果的资料总笔数
let l_sql = "select count(*) from ima_file where ima01 like ? "
prepare ima_cnt from l_sql
execute ima_cnt into l_cnt using "E%"

-- 
let l_sql = "select * from ima_file where ima01 like ? "
declare ima_sel cursor from l_sql

open ima_sel using "E%"
for l_i = 1 to l_cnt
    fetch absolute l_i ima_sel into l_ima[l_i].*
    -- 有任何错误退出，并提示
    if sqlca.sqlcode then
        message sqlca.sqlcode
        exit for
    end if
end for
```
我们使用`fetch`能够完成上述需求，但查询多笔资料时，我们需要提前知道查询结果的总笔数，否则在查询超过笔数的资料时，会报错并退出程序。

上面代码我们使用了大量的代码，来避免查询时因为笔数而导致报错。实际上我们还有另一个语法专门用来只查询多笔资料。--`FOREACH`

## FOREACH--多笔资料查询语法

`FOREACH`语法专门用来查询多笔资料，它的语法如下：

```sql
foreach cusor1 (using para1,...) into ...
    ...
end foreach
```

它是一个块语法，类似`FOR`循环。它的开始类似于`fetch`语句，不过它还可以接受一个可选的`using`参数。

在`foreach`和`end foreach`之间，你可运行任何你想要运行的语句，你也可以任何语句都不写。

我们将之前需求，用`foreach`语法改写：

```sql
define l_ima dynamic array of record like ima_file.*
define l_sql string
define l_cnt integer

let l_sql = "select * from ima_file where ima01 like ?"
declare ima_sel cursor from l_sql

let l_cnt = 1
foreach ima_sel using "E%" into l_ima[l_cnt].*
    if sqlca.sqlcode then
        message sqlca.sqlcode
        exit foreach
    end if
    let l_cnt = l_cnt + 1
end foreach
```
上面代码比起`FETCH`语法减少了不少长度和变量的使用，SQL语句也减少了一个。

在进行查询结果的每笔资料都需要的场景，我们建议是直接使用`FOREACH`语句。

如果你的查询可能并不是每笔资料都需要，例如：你只想要看第一笔，然后调到最后一笔，或者从最后一笔向前看几笔。这种场景一般使用`FETCH`语法。