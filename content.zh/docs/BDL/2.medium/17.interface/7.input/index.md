---
title: "7.INPUT"
lastmod: 2023-08-29T15:45:38+08:00
date: 2023-08-29T15:45:38+08:00
tags: ["INPUT"]
categories: ["BDL"]
weight: 7
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# INPUT

INPUT 和DISPLAY 一样可以将资料显示在已打开的画面上。

和DISPLAY不同的地方在于，DISPLAY中用户只能点击按钮操作，而INPUT中每个栏位(entry设置为'Y')都变为可输入的状态，用户输入后将输入的内容赋值给INPUT中的变量。

和DISPLAY和语法一样，INPUT也有两种语法。

## INPUT 表单

`INPUT p_employee.no FROM no`

`INPUT BY NAME p_employee.no`

以上两种语法和`DISPLAY`一致，`INPUT BY NAME`语法中，结构体的成员名称必须和画面中控件名称相同。

除了以上语法`INPUT`也支持块语法`END INPUT`。

```sql
INPUT variable-list FROM field-list
    BEFORE INPUT

    AFTER INPUT

    BEFORE FIELD field-list

    AFTER FIELD field-list

    ON CHANGE field-list

    ON ACTION action-name

    ON IDLE idle-seconds

END INPUT
```
因为在表单录入时，我们需要校验字段值、或者指定字段输入顺序、带出默认值等限制性操作，所以在表单时就提供了块级别语法，在块语法中，我们可以加上我们想限制的语法。

{{< hint info >}}
**注意**

块语法中所有内容都是可选的，如果任何语句都没有，那么和不写`END INPUT`是一样的。

{{</ hint>}}

### INPUT额外支持语法

`DISPLAY` 中所有语法`INPUT`都支持，除了之前讲过的语法，还支持以下语法：

+ BEFORE FIELD field_name

`BEFORE FIELD ima01`在焦点到ima01字段之前会运行到此处
+ AFTER FIELD field_name

`AFTER FIELD ima01`在焦点要离开ima01字段之前会运行
+ ON CHANGE field_name

`ON CHANGE ima01`在焦点要离开ima01字段前，如果字段被修改过会运行
+ NEXT FIELD field_name

`NEXT FIELD ima01` 焦点调到指定字段处，这个语法是独立运行的，需要在控制语法后运行

## INPUT 表格

INPUT 同样有`INPUT ARRAY`语法，可以显示并输入表格格式控件。

```sql
INPUT ARRAY array [ WITHOUT DEFAULTS ] FROM screen-array.*
                    [ HELP help-number ]
                    [ ATTRIBUTE ( {display-attribute | control-attribute }
                    [,...] ) ]
    BEFORE INPUT
    AFTER INPUT
    AFTER DELETE
    BEFORE ROW
    AFTER ROW
    BEFORE FIELD field-list
    AFTER FIELD field-list
    ON ROW CHANGE
    ON CHANGE field-list
    ON IDLE idle-seconds
    ON ACTION action-name
    BEFORE INSERT
    CANCEL INSERT
    AFTER INSERT
    CANCEL INSERT
    BEFORE DELETE
    CANCEL DELETE
END INPUT
```

### ATTRIBUTE

ATTRIBUTE 除了`DISPLAY`中的语法，额外还支持以下语法：

+ APPEND ROW [ =bool] 

是否需要中间插入资料
+ DELETE ROW [ =bool]

是否允许删除行
+ INSERT ROW [ =bool]

是否运行新增一笔资料
+ MAXCOUNT = row-count

可以录入的最大行


### 额外支持的控制语法

`INPUT ARRAY`支持`INPUT`的所有控制语法，`INPUT ARRAY`还支持以下控制语法：

+ AFTER DELETE

删除之后运行
+ BEFORE ROW

焦点在任意行之前运行
+ AFTER ROW

焦点离开任意行之后运行
+ BEFORE INSERT

插入资料之前运行
+ AFTER INSERT

资料插入之后运行
+ BEFORE DELETE

删除资料之前运行

### 额外其它语句

以下语句不是控制语句，可以用在控制语句后。

+ CANCEL DELETE

取消删除
+ CANCEL INSERT

取消插入