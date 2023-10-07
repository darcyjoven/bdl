---
title: "8.CONSTRUCT"
lastmod: 2023-08-29T15:45:47+08:00
date: 2023-08-29T15:45:47+08:00
tags: ["construct"]
categories: ["BDL"]
weight: 8
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# CONSTRUCT

为了避免SQL注入安全问题，BDL提供了`CONSTRUCT`语法，用来输入SQL查询条件的场景。

`CONSTRUCT`运行时，会先清空输入字段的所有资料内容，然后根据录入的内容组成SQL查询条件。

`CONSTRUCT`并不区分表单还是表格，因为表格也只能录入第一行资料。

`CONSTRUCT` 有两种写法，两者只在开头处有区别，块语法中无区别，所以放在一起讲

+ BY NAME ON

```sql
CONSTRUCT BY NAME variable ON column-list
    [ ATTRIBUTES ( { display-attribute
                     | control-attribute }
                     [,...] ) ]
    [ HELP help-number ]
[ dialog-control-block
  [...] 
END CONSTRUCT ]
```

+  ON FROM

```sql
CONSTRUCT variable ON column-list FROM field-list
    [ ATTRIBUTES ( { display-attribute
                     | control-attribute
                     } [,...] ) ]
    [ HELP help-number ]
[ dialog-control-block
   [...] 
END CONSTRUCT ]
```

