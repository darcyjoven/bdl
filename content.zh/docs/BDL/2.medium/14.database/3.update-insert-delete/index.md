---
title: "3.插入更新删除"
lastmod: 2023-08-24T09:33:25+08:00
date: 2023-08-24T09:33:25+08:00
tags: ["SQL"]
categories: ["BDL"]
weight: 3
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 插入更新删除--BDL操作数据

## 提前确认

在每次操作数据之前，请确认当前连接的数据库是否正确。

不要更新错了库！

> 本节内容需要你了解SQL基础语法，如果不了解可以参考此教程[一篇文章学会SQL](https://sql.darcyjoven.com/docs/SQL/all-in-one/)。

## 插入INSERT

在BDL中操作数据库有两种方式，一种是直接使用SQL原生语句，另一种是使用BDL的SQL语句。

### 原生语句

1. 将要执行SQL语句放到字符串中

```sql
let l_sql = "INSERT INTO demo_file (demo001,demo002,demo003) values('mar-001','xxx','xxx')"
```

2. prepare SQL语句

```sql
prepare demo_ins from l_sql  -- demo_ins为标识符
```

3. 执行SQL语句

```sql
execute demo_ins
```

4. 检查SQL是否执行成功

在BDL中有一个特殊的全局变量`sqlca`用来记录SQL执行情况。

```sql
    define sqlca record
        sqlcode integer, -- 报错代码 100 表示未找到 <0表示有错误
        sqlerrm string, --错误消息数量
        sqlerrp string, 
        sqlerrd array[6] integer,
        -- 1. 未使用
        -- 2. 最后一个Serial或错误代码
        -- 3. 最后一条语句处理的行数
        -- 4. CPU使用时间
        -- 5. SQL文件错误偏移量
        -- 6. 最后一行的ROWID
        sqlawarn string 
    end record
```
更新时只要检查`sqlca.sqlcode` 为0 且 `sqlca.sqlerrd[3]`大于0，那么就是执行成功。否则有报错，或者没成功。

### 原生语句中使用占位符号

在实际情况，我们可能要插入多条数据，且每条数据都不一样。这个时候如果每次都写一次sql，prepare一次，就不合理了。

我们可以使用占位符，和`sfmt("%1 %2",2,3)`中的占位符号一样，SQL也可以有类似的语法，我们只要修改两个地方。

1. 修改SQL语句

在BDL中，SQL的占位符为`?`，我们将所有要插入的字段值替换为`?`符号。

```sql
let l_sql = "INSERT INTO demo_file (demo001,demo002,demo003) values(?,?,?)"
```

2. 执行SQL

prepare 语句不变，只要在执行时，我们加上我们要插入的数据即可。

```sql
execute demo_ins using 'mar-001','xxx','xxx'
execute demo_ins using 'mar-002','xxx','xxx'
execute demo_ins using 'mar-003','xxx','xxx'
```
我们可以每次插入不同的数据，记得每次检查SQL是否执行成功。


{{< hint warning >}}
**注意**

这里`USING` 关键字虽然和格式化数字的`USING`一样，但是是不同的语法。这里要考虑`USING` 用在什么位置。即考虑上下文。

```sql
execute demo_ins using 'mar-003', 12 using "<<<<.&&" ,'xxx'
```

如上面语句，第一个`using`是 `execute`中将后面的值传入SQL语句代替占位符的意思。

第二个`using`是格式化数字的意思。
{{</ hint >}}



### BDL的SQL语句

除了SQL原生语句，BDL也提供了更简单的插入数据语法。

直接运行一下语句，也可以将资料更新到数据库中。

```sql
INSERT INTO demo_file (demo001,demo002,demo003) values('mar-001','xxx','xxx')
```

检查SQL执行成功否和原生SQL检查方法一样。

### 原生SQL和BDL SQL比较

BDL 语法和原生SQL同时插入三次执行过程如下：


{{< mermaid >}}
graph LR
    a["原生SQL"]-->b["prepare"]
    b-->c["execute"]
    c--3次-->c

    A["BDL SQL"]-->B["翻译为数据库SQL"]
    B-->C["prepare"]
    C-->D["execute"]
    D--3次-->A

{{</ mermaid >}}


{{< hint info >}}
**注意**

BDL自带语法写着简单，但是效率没有原生SQL高。

如果你要批量插入多笔数据，还是使用原生SQL，每次`execute`比较快。

{{</ hint >}}

## 更新UPDATE

和插入一样，更新也可以写为两种方式。

1. 原生SQL
```sql
let l_sql = "update demo_file set demo002 = ?,demo003=? where demo001= ? "
prepare demo_upd from l_sql
excute demo_upd using "yyy",'yyy','mar-001'
```

2. BDL SQL
```sql
update demo_file set demo002 = 'yyy',demo003='yyy' where demo001='mar-001'
```

## 删除DELETE

和插入一样，删除也可以写为两种方式。

1. 原生SQL
```sql
let l_sql = "delete from demo_file where demo001 like ?"
prepare demo_del from l_sql
excute demo_del using '%00%'
```

2. BDL SQL
```sql
delete from demo_file where demo001 like '%00%'
```