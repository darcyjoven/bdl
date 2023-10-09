---
weight: 3
bookFlatSection: true
bookCollapseSection: false
title: "BDL宝典"
---

# BDL 宝典

## 程序组成

4gl-->42m-->42r
4fd-->per-->42f

## 代码组成

| 组成部分         | 说明                                                                     |
| :--------------- | :----------------------------------------------------------------------- |
| 关键字           | 由代码规定的单词，每个都有特殊作用                                       |
| 符号             | 由代码规定，在不同地方可能有不同含义                                     |
| 标识符           | 由用户定义，用于标识变量名、常量名、函数名和由`type`定义的自定义数据类型 |
| 字面值(字面常量) | 1.2、100 是数字的字面值，"hello"、"world"是字符串的字面值                |
| 注释             | 注释为说明性的文字，不参与编译                                           |
| 分隔符号         | 空格、换行、分号、tab 都为分割符号                                       |

## 关键字

```
ACCEPT
ACTION
AND
ARRAY
BEFORE
BEGIN WORK
BIGINT
BLOB
BOOLEAN
BREAKPOINT
BYTE
CALL
CANCEL
CASE
CHAR
CLEAR
CLIPPED
CLOB
CLOSE
COLUMN
COMMAND
COMMIT WORK
CONNECT
CONSTANT
CONSTRUCT
CONTINUE
CURRENT
CURRENT WINDOW
DATABASE
DATE
DATETIME
DECIMAL
DEFINE
DIALOG
DISPLAY
DISPLAY ARRAY
DISPLAY BY NAME
DYNAMIC
END
ERROR
EXIT
FALSE
FLOAT
FOREACH
FOR
FUNCTION
GLOBAL
GOTO
IF
IMPORT
INPUT
INT_FLAG
INTEGER
IS NULL
LET
LIKE
LINENO
LOCATE
MATCHES
MENU
MESSAGE
MOD
MONEY
NEXT FIELD
NULL
ON
OPEN
OPTIONS
OR
PRINT
PROGRAM
PROMPT
QUIT_FLAG
RECORD
RELEASE SAVEPOINT
REPORT
RETURN
ROLLBACK WORK
RUN
SAVEPOINT
SCHEMA
SCROLL
SET CONNECTION
SKIP
SLEEP
SMALLFLOAT
SMALLINT
SPACES
SQLCA
STATUS
STEP
STRING
STYLE
TEXT
THRU
TIME
TINYINT
TODAY
TRUE
TRY
TYPE
UNBUFFERED
UNITS
USING
VALIDATE
VARCHAR
WHENEVER
WHILE
```

### 普通关键字

### 块级关键字（含有 end 结尾）

### 预定义变量（已经定义的变量）

### 数据类型

### 复杂类型

## 开发流程

### 普通开发流程

### CR 报表

### 接口

## 常用代码

### 字符串操作

+ 拼接字符串


```sql
    define a varchar(100)
    define b integer
    define c string
    -- a 初始值为""
    -- 将多个字符串拼接到一起
    let a = "hello","world","!"
    -- a 现在为 "hello world!"
    -- 自拼接
    let a = a," darcy"
    -- a现在为 "hello world! darcy"
    -- 循环自拼接
    while b < 10
      let a = a,"."
      let b = b + 1
    end while
    -- a 现在为 "hello world! darcy.........."

    -- 以上为varchar/char/string三种字符类型变量都可以使用的拼接字符串方式。
    -- string类型除了上述，还有自己独有的方法

    let c = c.append("hello")
    let c = c.append("world!")
    -- c的结果为"hello world!"
```

+ 获取子字符串
```sql
    define a string
    define b varchar(100)
    let a = "hello world!"
    let b = a

    -- string 与varchar/char 类型在取字串时不同。

    -- 获取子字符串，subString方法接受两个参数，第一个为字串开始位置，第二位子串的长度
    let a = a.substring(2,5)
    -- a的结果为"ello "

    -- varchar/char类型获取字串，用中括号截取，第一个数字位开始位置，第二个数字位字串长度
    let b = b[2,4]
    -- b的结果为"ello"
```
+ 获取单个字符

```sql
    define a varchar(100)
    define b string
    let a = "hello world!"
    let b = a

    -- 获取单个字符，一种方式是使用取子串方式，每次取长度为1的字串即可。
    display a[3,1]
    display b.subString(4,1)
    -- 以上结果都是"l"

    -- 除了取字串，string 还有取字符的方法
    -- 方法接受一个参数，即要取得字符串位置
    display b.getCharAt(5)
    -- 以上结果为"o"

```

+ 替换字符

```sql
    
```

+ 判断是否含有字串

```sql
```
+ string其它方法



### 数组操作