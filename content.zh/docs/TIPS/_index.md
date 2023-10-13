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

### 普通关键字

- AND 且 关系运算

```SQL
-- 关系运算符
-- 关系表达式 AND 关系表达式
    1 = 1 AND "" is NULL
```

- ~~BREAKPOINT~~ 断点
```sql
    -- 设置断点,当debug模式运行此处会停止
    BREAKPOINT
```
- CALL 调用函数
```sql
    define a integer
    -- 调用函数
    call lenght("aaa") returning a
    call add(x,y)
```
- CLIPPED 去除字符串右边空格
```sql
    define a string
    display "hello   darcy   " clipped
    let a = "hello   darcy   "
    let a = a clipped
```
- CLOSE DATABASE 关闭当前数据库连接
```sql
    CLOSE DATABASE ds
```
- ~~CONNECT TO~~ 在当前连接连接到另一个数据库
```sql
    DEFINE uname, upswd VARCHAR(50) 
    CONNECT TO "stores1" -- Session name is "stores1"
    CONNECT TO "stores1" AS "SA" -- Session name is "SA"
    CALL login_dialog() RETURNING uname, upswd
    CONNECT TO "stores2" AS "SB" USER uname USING upswd
```
- ~~COLUMN~~ 让下一个字符在多少个位置出现,前面位置填充空格
```sql
    display "hello",column(10),"world"
    display "hi",column(10),"world"
    -- 结果如下:
    -- hello    world
    -- hi       world
```

- ~~CONSTANT~~ 定义常量
```sql
CONSTANT
    c1 ="Drink",       # Declares a STRING constant
    c2 = 4711,         # Declares an INTEGER constant
    n = 10,            # Declares an INTEGER constant
    x SMALLINT=1       # Declares a SMALLINT constant

DEFINE a ARRAY[n] OF INTEGER

MAIN
  CONSTANT c1 = "Hello"
  DEFINE i INTEGER
  FOR i=1 TO n 
      ...
  END FOR
  DISPLAY c1 || c2  # Displays "Hello4711"
END MAIN
```
- CONTINUE 进行下一次循环
```sql
    CONTINUE
    { FOR
    | FOREACH
    | WHILE
    | MENU
    | CONSTRUCT
    | INPUT
    | DIALOG
    }
```

- DATABASE 连接或切换数据库
```sql
DATABASE ds
MAIN
  DATABASE stores
  ...
END MAIN
```
- DEFINE 定义变量
```sql
    DEFINE a, b, c INTEGER
```
- DISPLAY 显示数据到控制台
```sql
    DISPLAY "ok"
```
- EXIT 退出循环
```sql
    EXIT
    { CASE
    | FOR
    | FOREACH
    | WHILE
    | MENU
    | CONSTRUCT
    | REPORT
    | DISPLAY
    | INPUT
    | DIALOG }
```
- ~~GOTO~~ 代码跳转到指定行
```sql
MAIN
  DEFINE exit_code INTEGER
  DEFINE l_status INTEGER

  WHENEVER ANY ERROR GOTO _error 
  DISPLAY 1/0
  GOTO _noerror

LABEL _error:
  LET l_status = STATUS
  DISPLAY "The error number ", l_status, " has occurred."
  DISPLAY "Description: ", err_get(l_status)
  LET exit_code = -1
  GOTO _exit

LABEL _noerror:
  LET exit_code = 0
  GOTO _exit

LABEL _exit:
  EXIT PROGRAM exit_code

END MAIN
```
- IIF 三元表达式
```sql
    display IIF(a==2,"a=2","a=1")
    -- 当a=2时，输出“a=2”
    -- 否则输出"a=1"
```
- IMPORT 引入C或者JAVA包时使用
```sql
IMPORT libbase64
IMPORT JAVA java.util.regex.Matcher 
MAIN
    ...
END MAIN
```
- IS NULL 判断变量是否为空值
```sql
    IF n IS NULL THEN
        DISPLAY "The variable is NULL."
    END IF
```
- IS NOT NULL 判断变量是否不为空值
```sql
    IF n IS NOT NULL THEN
        DISPLAY "The variable is not NULL."
    END IF
```
- LET 赋值语句,必须搭配 `=` 使用
```sql
    let a = 123
    let b = "abc"
    let c = 233 * 9
```
- LIKE 字符串模糊匹配,规则和SQL中一致
```sql
    let a = "hello" LIKE "h_llo" -- true
    let a = "hello" like "he__o" --true
    let a = "hello" like "%e%" --true
```
- LOCATE 从文件中读取内容到TEXT/BYTE变量中
```sql
MAIN
  DEFINE ctext1, ctext2 TEXT
  DATABASE stock 
  LOCATE ctext1 IN MEMORY
  LOCATE ctext2 IN FILE "/tmp/data1.txt"
  CREATE TABLE lobtab ( key INTEGER, col1 TEXT, col2 TEXT )
  INSERT INTO lobtab VALUES ( 123, ctext1, ctext2 )
END MAIN
```
- MATCHES 字符串模糊匹配,和LIKE匹配有区别
```sql
    -- * 为任意数量任意字符,相当于like中的%
    let a = "abc" matches "a*" -- true
    -- ? 为一个任意字符,相当于like中的_
    let a = "abc" matches "a??"--true
    -- [] 可以匹配任意一个其中得字符,使用-可以使用范围
    -- [^] 是匹配不是其中任意一个字符
    let a = "abc" matches "ab[cd]"
    let a = "abc" matches "ab[^a-z]" --false
```
- MOD 求余数
```sql
    let a = 5 mod 2  -- 结果为1
```
- OR 或 关系运算符
```sql
    let a = 1 OR 0 -- true
    let a = 0 OR 0 -- false
    let a = true or true -- true
```
- RETURN 函数块中用来结束函数,或者结束函数并返回需要的值
```sql
FUNCITON add()
    ...
    RETURN
END FUNCTION
FUNCITON minus()
    ... 
    RETURN "hello"
END FUNCTION
FUNCITON puls()
    ... 
    RETURN "hello",123
END FUNCTION
```
- RETURNING 接受函数返回的值,无返回值时,调用函数不需要RETURNING
```sql
    call add() returning a
    call add() returning b,c
```
- RUN 在ERP服务器上运行命令
```sql
    RUN "ls -a "
    RUN "mkdir demo"
```
- ~~SCHEMA~~ 使用数据库的数据结构而不连接(DATABSE 是使用并连接)
```sql
SCHEMA dev_db -- Compilation database schema
DEFINE rec RECORD LIKE customer.*
MAIN
   DATABASE prod_db -- Runtime database specification
   SELECT * INTO rec.* FROM customer WHERE custno=1
END MAIN
```
- ~~SET CONNECTION~~ 在对当前会话中再连接一个会话
```sql
MAIN
    CONNECT TO "stores1"
    CONNECT TO "stores1" AS "SA"
    CONNECT TO "stores2" AS "SB"
    SET CONNECTION "stores1"    -- Select first session
    SET CONNECTION "SA"         -- Select second session
    SET CONNECTION "stores1"    -- Select first session again
END MAIN
```
- SLEEP 程序暂停运行n秒
```sql
    sleep 10 --运行到此行,程序暂停10秒
```
- SPACES n个空格
```sql
    display "hello",10 spaces,"world"
    display "hi",10 spaces"world"
    -- 显示如下:
    -- hello          world
    -- hi          world
```
- ~~THRU~~ 结构体可以通过THRU批量访问部分成员变量
```sql
SCHEMA stores 
MAIN
  DEFINE cust LIKE customer.*
  INITIALIZE cust.cust_name THRU customer.cust_address TO NULL
END MAIN
```
- TYPE 可以定义一个用户变量类型,语法与DEFINE一样
```sql
    TYPE MYINT INTEGER
    TYPE student record
        name string,
        age int,
        score int
    end record
    define age MYINT
    define darcy student
```
- ~~UNITS~~ 将数字转为时间间隔
```sql
MAIN
  DEFINE d DATE
  LET d = TODAY + 200
  DISPLAY (d - TODAY) UNITS DAY
END MAIN
```
- USING 数字转为字符串时,可以指定其格式
```sql
    display 0 using #####&.&&
    -- 输出 " 0,00"
```
- ~~VALIDATE~~ 验证变量的值是否复合数据库定义
```sql
SCHEMA stores 
MAIN
  DEFINE cname LIKE customer.cust_name 
  LET cname = "aaa"
  VALIDATE cname LIKE customer.cust_name 
END MAIN
```
- ~~WHENEVER~~ 错误处理,知道怎么回事就可以
```sql
    WHENEVER ERROR CALL cl_err_msg_log
```

### 块级关键字（含有 end 结尾）

- CASE 开关判断语句
```sql
    -- 1. 判单变量的值
    case a
        when 1
            ...
        when 2
            ...
        default
    end case
    -- 2. 判断条件语句是否成立
    case 
        when 1=1
            ...
        when 2=3
            ....
        default
            ...
    end case
```

- FOR 根据索引变量进行循环
```sql
    FOR a = 1 to 10 step 2
        ...
        EXIT FOR
        CONTINUE FOR
    END FOR
```
- FUNCTION 函数
```sql
function main()
end function
function add()
end function
```
- GLOBALS 全局变量定义
```sql
GLOBALS
    define g_success boolean
END GLOBALS
function main()
end function
```
- IF 条件判断语句
```sql
    IF a = 2 and b !=3 THEN
        ...
    ELSE
        ...
    END IF
```
- MAIN MIAN函数，程序运行入口函数
```sql
MAIN
    ...
END MAIN
```
- TRY 错误处理，如果有任何运行错误，会进行处理，而不是终止程序
```sql
    TRY
        let a = b / 0
        let a = a + 1
    CATCH
        DISPLAY "ERROR!"
    END TRY

    -- 正常情况，除以0将会终止程序，使用TRY将运行到报错行，然后继续向下运行。
```
- WHILE 使用条件表达式进行循环
```sql
    WHEN TRUE
        if a > 10 then
            exit while
        end if
        continue while
    END WHILE
```

### 内置变量（已经定义的变量）

- CURRENT 当前时间
```sql
    DISPLAY CURRENT YEAR TO DAY
    DISPLAY CURRENT
    --  YEAR TO DAY 只要年到天之间的时间
    -- 输出结果如下：
    -- 2023-10-10
    -- 2023-10-10 14:04:10.003
```
- FALSE 0值
```sql
    let a = false
    let a = 1 = 2
    -- 以上值都为FALSE
```
- INT_FLAG 取消输入时INT_FLAG设置为TRUE，否则为FALSE
```sql
MAIN
  DEFER INTERRUPT
  LET INT_FLAG = FALSE
  INPUT BY NAME ...
     AFTER INPUT
        IF INT_FLAG THEN
           MESSAGE "The input is canceled."
        END IF
     ...
  END INPUT
  ...
END MAIN
```

- ~~LINENO~~ 代码运行的当前行数
```sql
    if status then
        display lineno," error",status
    end if
```
- ~~QUIT_FLAG~~ 程序退出标记，触发退出时为TRUE
```sql
MAIN
    DEFINE n INTEGER
    DEFER QUIT
    LET QUIT_FLAG = FALSE
    FOR n = 1 TO 1000
        IF QUIT_FLAG THEN EXIT FOR END IF
        ...
    END FOR
END MAIN
```
- SQLCA SQL运行后保存运行结果和错误内容
```sql
DEFINE SQLCA RECORD
    SQLCODE INTEGER,
    SQLERRM CHAR(71),
    SQLERRP CHAR(8),
    SQLERRD ARRAY[6] OF INTEGER,
    SQLAWARN CHAR(7)
END RECORD
```
- STATUS 程序过程中出现任何报错，保存该报错代码
```sql
MAIN
  DEFINE n INTEGER
  WHENEVER ANY ERROR CONTINUE
  LET n = 10/0
  DISPLAY STATUS
END MAIN
```
- TODAY 今天的日期
```sql
MAIN
  DISPLAY TODAY
END MAIN
```
- TRUE 1 
```sql
    let a = 1=1
    let a = 1
    -- 值都为TRUE
```

### 数据类型

- ARRAY 数组
```sql
    -- 定义数组
    define a array[10] of integer
    define b dynamic array of record
        name string,
        age integer
    end record
```

- BIGINT 整型
```sql
    -- -9,223,372,036,854,775,807 to +9,223,372,036,854,775,807
MAIN
  DEFINE i BIGINT
  LET i = 9223372036854775600
  DISPLAY i
END MAIN
```

- BOOLEAN 布尔(BOOL)类型，值要么是1要么是0
```sql
FUNCTION checkOrderStatus( cid )
  DEFINE oid INT, b BOOLEAN
  LET b = ( isValid(oid) AND isStored(oid) )
  IF NOT b THEN
    ERROR "The order is not ready."
  END IF
END FUNCTION
```
- BYTE 大文件二进制类型
```sql
--  2^31 bytes (~2.14 Gigabytes)
MAIN
    DEFINE b BYTE
    DATABASE stock 
    LOCATE b IN MEMORY
    SELECT png_image INTO b FROM images WHERE image_id = 123
    CALL b.writeFile("/tmp/image.png")
END MAIN
```
- CHAR 定长字符串类型
```sql
MAIN
    DEFINE c CHAR(10)
    LET c = "abcdef"
    DISPLAY "[", c ,"]"      -- displays [abcdef    ]
    IF c == "abcdef" THEN    -- this is TRUE
        DISPLAY "equals"
    END IF
END MAIN
```
- DATE 日期类型
```sql
MAIN
    DEFINE d DATE
    LET d = TODAY
    DISPLAY d, "  ", d+100
END MAIN
```
- DATETIME 时间类型
```sql
MAIN
    DEFINE d1, d2 DATETIME YEAR TO MINUTE
    LET d1 = CURRENT YEAR TO MINUTE 
    LET d2 = "1998-01-23 12:34"
    DISPLAY d1, d2
END MAIN
```
- DECIMAL 十进制小数类型，固定小数位数
```sql
MAIN
    DEFINE d1 DECIMAL(10,4)
    DEFINE d2 DECIMAL(10,3)
    LET d1 = 1234.4567
    LET d2 = d1 / 3 -- Rounds decimals to 3 digits 
    DISPLAY d1, d2
END MAIN
```
- ~~FLOAT~~ 浮点数，固定总长度
```sql
    define  e float
    let e = 1.022
```
- INTEGER 整数
```sql
    -- -2,147,483,647 to +2,147,483,647.
MAIN
  DEFINE i INTEGER
  LET i = 1234567
  DISPLAY i 
END MAIN
```
- MONEY 含有币种符号的特殊decimal
```sql
MAIN
    DEFINE d1 MONEY(10,4)
    DEFINE d2 MONEY(10,3)
    LET d1 = 1234.4567
    LET d2 = d1 / 3 -- Rounds decimals to 3 digits 
    DISPLAY d1, d2
END MAIN
```
- RECORD 结构退，不同类型变量作为子成员组成一个变量
```sql 
    -- 定义结构体变量
    DEFINE rec RECORD
                id INTEGER,
                name VARCHAR(100),
                birth DATE
                END RECORD
    LET rec.id = 50
    LET rec.name = 'Scott'
    LET rec.birth = TODAY
    DISPLAY rec.*
    -- 使用type 可以定义一个结构体类型，后续可以重复使用
    TYPE rec RECORD
            id INTEGER,
            name VARCHAR(100),
            birth DATE
            END RECORD
    DEFINE rec1 rec
    DEFINE rec2 rec
    LET rec1.name = "darcy"

    -- 数组也可以是结构体类型
    DEFINE recs array[10] of RECORD
            id INTEGER,
            name VARCHAR(100),
            birth DATE
            END RECORD
    LET recs[1].name = "darcy"
    
    -- 结构体数组配合type使用
    TYPE rec RECORD
            id INTEGER,
            name VARCHAR(100),
            birth DATE
            END RECORD
    DEFINE recs dynamic array of rec
    LET recs[1].name = "darcy"
```
- ~~SMALLFLOAT~~ 小位数浮点数
```sql
    define a SMALLFLOAT
```
- ~~SMALLINT~~ 小位数整数
```sql
    define a smallint
```
- STRING 变长字符串
```sql
    define a string
    let a = "darcy"
    display a.subString(2,4)
```
- TEXT 大数据文本类型
```sql
-- 2^31 bytes (~2.14 Gigabytes),
MAIN
    DEFINE t TEXT
    DATABASE stock 
    LOCATE t IN FILE "/tmp/mytext.txt" 
    SELECT doc_text INTO t FROM documents WHERE doc_id = 123
    CALL t.writeFile("/tmp/document.txt")
END MAI
```
- ~~TINYINT~~ 非常小的整型
```sql
-- -128 to +127.
define a tinyint
```
- VARCHAR 限长数组
```sql
MAIN
    DEFINE vc VARCHAR(10)
    LET vc = "abc  "         -- two trailing blanks
    DISPLAY "[", vc ,"]"     -- displays [abc  ]
    IF vc == "abc" THEN    -- this is TRUE
        DISPLAY "equals"
    END IF
END MAIN 
```

### 画面流程控制

- ACCEPT
- ACTION
- BEFORE
- CANCEL
- CLEAR
- CLOSE FORM
- CLOSE WINDOW
- COLUMN
- COMMAND
- CONSTRUCT
- CURRENT WINDOW 切换当前窗口
```sql
    MAIN
  OPEN WINDOW w1 WITH FORM "customer"
  ...
  OPEN WINDOW w2 WITH FORM "custlist"
  ...
  CURRENT WINDOW IS w1
  ...
  CURRENT WINDOW IS w2
  ...
  CLOSE WINDOW w1
  CLOSE WINDOW w2
END MAIN
```
- DIALOG
- DISPLAY ARRAY
- DISPLAY BY NAME
- DISPLAY TO
- ERROR
- INPUT
- MENU
- MESSAGE
- NEXT FIELD
- ON
- OPEN
```sql
    
```
- PRINT
- PROGRAM
- PROMPT
- REPORT
- SCROLL
- SKIP

### SQL 关键字

- BEGIN WORK
- FOREACH
```sql
    
```

## 开发流程

### 普通开发流程

### CR 报表

### 接口

## 常用代码

### 字符串操作

#### 获取字符串长度

```sql
    define a string
    define b varchar(100)
    define c integer
    let a = "hello world!"
    let b = a

    -- 使用内置函数,接受一个string类型,如果是varchar/char会转化为string,返回字符串长度
    call length(b) returning c

    -- string 类型还可以直接使用下面方法,没有参数,返回字符串长度.
    call a.getLength() returning c
```

#### 拼接字符串

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

    call c.append("hello") returning c
    call c.append("world!") returning c
    -- c的结果为"hello world!"
```

#### 获取子字符串

```sql
    define a string
    define b varchar(100)
    let a = "hello world!"
    let b = a

    -- string 与varchar/char 类型在取字串时不同。

    -- 获取子字符串，subString方法接受两个参数，第一个为字串开始位置，第二位子串的长度
    call a.substring(2,5) returning a
    -- a的结果为"ello "

    -- varchar/char类型获取字串，用中括号截取，第一个数字位开始位置，第二个数字位字串长度
    let b = b[2,4]
    -- b的结果为"ello"
```

#### 获取单个字符

```sql
    define a varchar(100)
    define b string
    define c varchar(10)
    let a = "hello world!"
    let b = a

    -- 获取单个字符，一种方式是使用取子串方式，每次取长度为1的字串即可。
    display a[3,3]
    call b.subString(4,4) returning c
    -- 以上结果都是"l"

    -- 除了取字串，string 还有取字符的方法
    -- 方法接受一个参数，即要取得字符串位置
    call b.getCharAt(5) returning c
    -- 以上结果为"o"

```

#### 替换字符

```sql
    define a string
    let a = "hello world! darcy"
    -- 替换字符串并没有一个方法，但`tiptop gp`有lib函数可以调用。
    -- 函数接受三个参数，第一个参数为要替换得基础字符串，第二个参数为要替换的旧字符串，第三个参数为要替换得新字符串
    call cl_replace_str(a,"darcy","joven") returning a
    -- a的结果为"hello world! joven"
```

#### 判断是否含有字串

```sql
    define a string
    define b integer
    let a = "hello world! darcy"

    -- 判断字串,只有string可以使用
    -- 该方法接受两个参数,第一个为要判断得子串,第二个为从第几位开始判断
    -- 返回得结果是这个子串在原字符串中的位置，如果没有返回-1
    call a.getIndexOf("darcy",1) returning b
    -- 结果为14
```

#### string 其它方法

```sql
    define a string
    let a = "hello world! darcy "

    -- 字母转为大写
    call a.toUpperCase() returning a
    -- 字母转为小写
    call a.toLowerCase() returning a
    -- 去掉最左空格
    call a.trimLeft() returning a
    -- 去掉最右空格
    call a.trimRight() returning a
    -- 去掉左右两边空格
    call a.trim() returning a
```

### 数组操作

#### 数组定义

```sql
    -- define 变量名 dynamic array of 数据类型
    -- define 变量名 array[数组长度] of 数据类型
    define a dynamic array of integer
    define b array[10] of integer
```

#### 取指定位置数组

```sql
    define a dynamic array of integer
    define b integer

    let a[1] = 10
    let a[2] = 20
    let a[3] = 30
    for b = 4 to 10
        let a[b] = b * 10
    end for
```

#### 数组方法

```sql
    define a dynamic array of integer
    define b integer

    for b= 1 to 10
        let a[b] = b * 10
    end for

    -- 在末尾增加一个元素
    call a.appendElement()

    -- 清空数组
    -- 定长数组,只清空值,变长数组长度变为0
    call a.clear()

    -- 删除指定位置元素
    call a.deleteElement(2)

    -- 获得数组长度
    call a.getLength() returning b

    -- 数组中间插入一个元素
    call a.insertElement(8)
```

#### 循环和数组

```sql
    define a dynamic array of integer
    define i integer

    -- 循环输入10个整数到数组中
    for i = 1 to 10
        prompt i,".请输入一个整数:" for a[i]
    end for

    -- 显示数组中所有得值
    for i = 1 to a.getLength()
        display a[i]
    end for
```
