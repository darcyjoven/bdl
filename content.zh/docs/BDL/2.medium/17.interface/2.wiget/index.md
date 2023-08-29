---
title: "2.控件&容器"
lastmod: 2023-08-29T14:20:48+08:00
date: 2023-08-29T14:20:48+08:00
tags: ["wiget", "container"]
categories: ["BDL"]
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 控件&容器

打开`genero studio`，我的版本为`2.40.11`，请打开和 ERP 版本相对应的`genero studio`。

> 使用`fglform -V`可以查看版本，只要大版本一直即可，即`2.40.xx`

![genero studio](images/image.png)

新建一个 4fd 文件，我这里命名为`czzi002.4fd`，你可以按照喜好自己行命名。

![null](images/image-1.png)
一个空的 4fd 文件看起来就是一张空白纸，我们只要将你需要的东西用鼠标拖拽到这张之上即可。

当然拖拽也是有规律的，否则无法生成你想要的画面，甚至还会报错。

![wiget](images/image-2.png)

在顶部菜单中不同名称的按钮，都是一个个`控件`和`容器`。

- 控件：

GUI 中数据操作方法的合集叫做控件，它能够对数据进行操作。

- 容器：

容器是用来包裹控件，让控件已希望的方式展现出来的元素。

## 容器

容器均具有本身的属性及特殊用途，容器间可相互包覆（基本物件除外），以呈现不同的效果。

![Container](images/image-3.png)

不同容器清单说明如下：

| 名称                    | 功能说明                   | 可使用的下层容器物件                                       |
| :---------------------- | :------------------------- | :--------------------------------------------------------- |
| Grid                    | 简易空白画布               | ScrollGrid、Table、GroupBox                                |
| ScrollGrid              | 有卷轴的空白画布           | ScrollGrid、Table、GroupBox                                |
| Table                   | 以表格方式显示阵列资料     | 无                                                         |
| MFArray                 | 以画布方式显示阵列资料     | 无                                                         |
| GroupBox                | 将外层加上框线             | VBOX、HBOX、GroupBox、PageControl、Grid、ScrollGrid、Table |
| PageControl             | 以分页方式显示资料         | VBOX、HBOX、GroupBox、PageControl、Grid、ScrollGrid、Table |
| VBOX(Vertical layout)   | 将内含的物件以垂直方式排列 | VBOX、HBOX、GroupBox、PageControl、Grid、ScrollGrid、Table |
| HBOX(Horizontal layout) | 将内含的物件以水平方式排列 | VBOX、HBOX、GroupBox、PageControl、Grid、ScrollGrid、Table |

### Grid

### Floder

### Group

### HRec

### ScrollGrid

### Table

### Tree


## 布局

![layout](images/image-4.png)

## 控件

![Wiget](images/image-5.png)

### StaticLabel
### Edit
### Button
### ButtonEdit
### DateEdit
### RadioGroup
### CheckBox

### FormFieldLabel
### HLine
### Canvas
### ProgressBar
### TextEdit
### TimeEdit
### StaticImage
### FormFieldImage

### Slider
### SpinEdit
### WebComponent

## 其它项目

### TopMenus
### Toolbars
### Action Defaults
### Screen Record
### Style
## Tab Index
## Alignment
