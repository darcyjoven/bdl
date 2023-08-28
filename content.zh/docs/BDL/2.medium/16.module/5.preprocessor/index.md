---
title: "5.预编译"
lastmod: 2023-08-28T20:52:53+08:00
date: 2023-08-28T20:52:53+08:00
tags: [""]
categories: ["BDL"]
weight: 5
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 预编译

预处理器指令通常用于简化源程序在不同的执行环境中的更改和编译。 源文件中的指令告知预处理器采取特定操作。 例如，预处理器可以替换文本中的标记，将其他文件的内容插入源文件，或通过移除几个部分的文本来取消一部分文件的编译。 在扩展宏之前，将识别并执行预处理器行。 因此，如果宏扩展到类似于预处理器命令的内容，该预处理器无法识别该内容。

预编译指令在编译之后就不影响程序了，所以不会影响程序运行效能。

预编译执行可以在程序任何位置写入。


## &include 文件引入

在编写函数中，我们有些重复的逻辑，又无法封装为一个函数的场景。为了避免重复代码，我们可以使用`&include`。

`&include`并不是一个语法，而是一个预编译指令--在编译时就生效。

`&include`用法是，后续跟需要导入的源代码文件，当编译时，编译到`&include`指令行数时，将后面文件原样导入到当前文件中。所以此指令不会影响到运行时效率。在编译后此指令依据不存在了。

当然这样也有缺点，我们在debug调试的时候，无法通过`step in`进入到`&include`中查看了，为排查错误带来了负向影响。

## &define 宏定义

宏定义的时将任意一个东西替换为宏定义内容，宏定义并不是定义常量，而是将定义的内容原样替换。


```sql
&define MAX_TEST 12 
&define HW "Hello world" 

MAIN 
  DEFINE i INTEGER 
  FOR i=1 TO MAX_TEST 
    DISPLAY HW 
  END FOR 
END MAIN
```

你甚至可以定义`&define mian main` 这样你代码中所有的`mian`都会替换为`main`。而替换后的`main`可以正常使用。

```sql
&define mian main
mian
    display "123"
end main
```

### 字符串替换符号`#`

在宏定义中可以使用`#`，类似参数传递，会将内容转化为字符串

```sql
&define disp(x) DISPLAY #x
disp(abcdef)
```
如以上代码将输出`abcdef`

### 标记粘贴运算 `##`

在宏定义中使用`##`可以将两个标记合并。

```sql
&define disp(x) DISPLAY ok##x
main
    define ok34 string
    let ok34 ="ok is ok !"
    disp(34)
end main
```
### 已定义的宏定义

+ __LINE__

程序运行的当前行

+ __FILE__

程序运行的文件，相对目录

以上代码输出结果为`ok is ok !`

## 条件编译

利用`&ifdef/&ifndef`可以在编译时，灵活选择是否编译哪些代码。

在不同数据库时经常使用到，其中`identifier`是定义好的宏定义标记。

```sql
&ifdef/&ifndef identifier
...
[&else
...]
&endif
```


```sql
&define IS_DEFINED
&ifdef IS_DEFINED
DISPLAY "The macro is defined"
&endif
```

如上带出输出`The macro is defined`