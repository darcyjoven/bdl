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

![Grid](images/image-8.png)

可将此容器视为一块空白的画布，布置在上方的元件都可以显示在画面相对位置上。

Grid 只能处理`非阵列资料`。Grid 不可以被安排在其他Grid容器之内。


{{< columns >}}
**studio**

![studio](images/image-7.png)

<--->

**画面预览**

![czzi001](images/image-6.png)


{{< /columns >}}

### Floder

![Floder](images/image-15.png)

当摆放元件空间不足时（或是需要滚动画面，操作上较麻烦时），即可使用切页的功能，以资料夹的形式将资料性质相近的栏位，切分在同样的page当中。

制作时可在页签位置以鼠标右键新增、删除页面。

编译时若该页签内没有任何元件，则编译会失败，且系统会显示有空白页签存在。
页签上显示字符串仍需在属性视窗指定。

{{< columns >}}
**studio**

![studio](images/image-16.png)

<--->

**画面预览**

![czzi001](images/image-17.png)

{{< /columns >}}

### Group

![Group](images/image-23.png)

相关栏位可用Group 包覆，以让相近性质的栏位可以明确的群聚于同处。

编写时须注意：
+ 若不需要Group 名称，则可以不要设定`textGroup`、`Text`属性。
+ 若要分组但不要框线，请改用Grid。

{{< columns >}}
**studio**

![studio](images/image-22.png)

<--->

**画面预览**

![czzi001](images/image-21.png)

{{< /columns >}}


### HRec

![HRec](images/image-20.png)

HRec 用spacer 来保留画面一定的空格符数。当元件在容器中时，若不使用HRec，则在预览时会发现想要保留的空格符，实际上并没有被保留。点选HRec 里面的元件或是spacer 时，可以在元件的左右加入spacer（Spacer left and Spacer right）。

{{< columns >}}
**studio**

![studio](images/image-19.png)

<--->

**画面预览**

![czzi001](images/image-18.png)

{{< /columns >}}


### ScrollGrid

![ScrollGrid](images/image-9.png)

在Genero Studio 中，此容器与Grid 相同，均作为处理`非阵列资料`用。与Grid 容器的差异仅在可使用滚动轴，可以滚动画面。不能用于显示阵列资料。
{{< columns >}}
**studio**

![studio](images/image-11.png)

<--->

**画面预览**

![czzi001](images/image-10.png)

{{< /columns >}}
### Table

![Table](images/image-12.png)

使用TABLE即是以表格方式显示阵列资料，此方式有许多的优点，这些优点都是系统提供的，不需要额外再撰写程序码即可使用；

包含：动态排序、栏位隐藏、显示或移动等。
在设计时期改变Table 高度时，会自动增减资料的行数。
在Table 物件上按鼠标右键，在弹出式选单可以新增或移除栏位。

另外可以直接以鼠标拖曳改变栏位的顺序。

编写时须注意：
+ 使用TABLE 物件时，资料（Record）一定是横列，没有直垂直排列。
+ 编写时须到各栏位的属性中进行形态、对应数据库等资料的设定或变更。

{{< columns >}}
**studio**

![studio](images/image-13.png)

<--->

**画面预览**

![czzi001](images/image-14.png)

{{< /columns >}}

### Tree

![Tree](images/image-24.png)

Tree 树状图预览时和Table是一样的，当有资料的资料，树状图是有层级结构的。

当节点展开时，可以展开上下级结构。

{{< columns >}}
**studio**

![studio](images/image-26.png)

<--->

**画面预览**

![czzi001](images/image-25.png)

{{< /columns >}}

## 布局

![Layout](images/image-4.png)

当有多个容器（Container）同时并存在同一层画面上，设计画面时就必须再对这多个容器进行位置排列的指定。

{{< columns >}}
**VBox**

![VBox](images/image-28.png)

<--->

**Hbox**

![Hbox](images/image-24.png)

{{< /columns >}}



在设计视窗中，以多选物件的方式，选取两个以上的物件后，工具列上的`Layout 排列工具项`（Create Layout）即会被enable，直接选取工具列中的`垂直排列`功能`Vertical`或`水平排列`功能（Horizontal），出现红色外框时，即完成排列方式指定。


![RBreak Layout](images/image-29.png)

若设定完成后发现设定错误，必须取消原先设定后才能在设定新的排列方式。此时点选该红色外框，上方`取消排列`(Break Layout)即可进行取消作业。

功能说明：

<img src="images/image-30.png" /> `垂直排列`功能Vertical Layout

<img src="images/image-31.png" /> `水平排列`功能Horizontal Layout

<img src="images/image-32.png" /> `取消排列`功能Break Layout

## 控件



4FD 档在编辑时，就需要视需求将指定的元件布置在画面上。

Widget 项目如下图所示，每个项目均可以鼠标拖拉至画面上的指定位置做处理。

![Wiget](images/image-5.png)

但若仅需要进行元件项目代换时，也可以透过属性页处提供的功能，直接进行转换。

以下分项目说明各种元件的差异。

### StaticLabel
![Alt text](images/image-59.png)
![Alt text](images/image-60.png)
### Edit

![Edit](images/image-33.png)
![Edit](images/image-34.png)

定义一个编辑栏位。属于FormField 物件，可设定与资料栏位的关联。

常用属性：
+ commentGroup -> comment：设定说明内容，当鼠标移过时会以符动视窗方式显示内容。
+ constraints -> noEntry：设定此属性后即无法进入此栏位编辑资料。
+ constraints -> notNull：不可在此栏位输入NULL 值或空字符串。
+ constraints -> required：不可在此栏位输入NULL 值、空字符串或纯空格符。
+ appearance -> case：令输入字符串自动转换大/小写。
+ appearance -> scroll：卷动，若数据库栏宽大于画面预留栏宽时有效，当设定此属性时可藉卷动方式输入。



### Button
![Alt text](images/image-57.png)
![Alt text](images/image-58.png)
### ButtonEdit

![ButtonEdit](images/image-37.png)
![Alt text](images/image-38.png)

定义一个编辑栏位的元件，可透过右侧按钮以触发某一事件。通常用在串连与此栏位输入时有关的动作，例如查询合法可用资料等。此元件为FormField 物件，可设定与数据库中资料表的栏位相关联，将data 属性设为TABLE_COLUMN 时可额外设定tableName 及columnName 这两个属性。

常用属性：
+ action：设定当按下按纽时要触发4GL 中何组ON ACTION 段、此处定义其action-id。
+ commentGroup -> comment：设定说明内容，当鼠标移过时会以符动视窗方式显示内容。
+ Image Group -> image：设定出现在BUTTON 上的图片，其来源可参照ACTION DEFAULT 段说明。
+ constraints -> noEntry：设定此属性后即无法进入此栏位编辑资料。
+ constraints -> notNull：不可在此栏位输入NULL 值或空字符串。
+ constraints -> required：不可在此栏位输入NULL 值、空字符串或纯空格符。
+ appearance -> case：令输入字符串自动转换大/小写。
+ appearance -> scroll：卷动，若数据库栏宽大于画面预留栏宽时有效，当设定此属性时可藉卷动方式输入。

### ComboBox

![Alt text](images/image-41.png)
![Alt text](images/image-42.png)

定义一个可利用下拉功能选值的编辑栏位，若输入资料只有几种值可供选择时，建议采用RadioGroup 方式来限缩使用者可输入的内容（参阅RadioGroup）。属于FormField物件，可设定与资料栏位的关联。

选项对话视窗:

可管理ComboBox 的选项，也可以按字母顺序排列选项的Text。

![Alt text](images/image-43.png)

常用属性：
+ commentGroup -> comment：设定说明内容，当鼠标移过时会以符动视窗方式显示内容。
+ items：定义可选择的选项，用对话视窗设定。
+ constraints -> noEntry：设定此属性后即无法进入此栏位编辑资料。
+ constraints -> notNull：不可在此栏位输入NULL 值或空字符串，可抑制NULL 选项出现。
+ constraints -> required：不可在此栏位输入NULL 值、空字符串或纯空格符。
+ queryEditable：当设定此属性后，若为CONSTRUCT 模式下即可开放USER 自行输入。
+ case 令输入字符串自动转换大/小写。



### DateEdit

![Alt text](images/image-39.png)
![Alt text](images/image-40.png)

定义一个日期编辑，按右侧钮可带出Client 端万年历选择视窗。日期显示格式由主机端DBDATE 环境变量控制。属于FormField 物件，可设定与资料栏位的关联。

常用属性：
+ commentGroup -> comment：设定说明内容，当鼠标移过时会以符动视窗方式显示内容。
+ constraints -> noEntry：设定此属性后即无法进入此栏位编辑资料。
+ constraints -> required：不可在此栏位输入NULL 值、空字符串或纯空格符。


### RadioGroup
![Alt text](images/image-44.png)
![Alt text](images/image-45.png)

定义一个可用选择方式输入资料的输入栏位，此种选择方式会将选项清单展示在画面上（ComboBox 不会展开显示，可参照ComboBox 说明），故若需要采用此输入形态，要注意画面空间是否足够。

![Alt text](images/image-46.png)

常用属性：
+ commentGroup -> comment：设定说明内容，当鼠标移过时会以符动视窗方式显示内容。
+ items：定义可选择的选项，依范例方式设定。【必要属性】
+ constraints -> noEntry：设定此属性后即无法进入此栏位编辑资料。
+ constraints -> notNull：不可在此栏位输入NULL 值或空字符串。
+ constraints -> required：不可在此栏位输入NULL 值、空字符串或纯空格符。
+ orientation：可定义选项排列方式为垂直排列（vertical）或水平排列（horizontal）。

{{< hint info >}}
**注意**

使用ComboBox 可动态定义items，而RadioGroup 不可动态定义items。

{{</ hint >}}

### CheckBox
![Alt text](images/image-47.png)
![Alt text](images/image-48.png)
### FormFieldLabel
![Alt text](images/image-49.png)
![Alt text](images/image-50.png)
### HLine
![Alt text](images/image-52.png)
![Alt text](images/image-51.png)
### Canvas
![Alt text](images/image-53.png)
![Alt text](images/image-54.png)
### ProgressBar
![Alt text](images/image-55.png)
![Alt text](images/image-56.png)
### TextEdit

![TextEdit](images/image-35.png)
![TextEdit](images/image-36.png)

定义可编辑多行的栏位，输入长度当超过画面预留长度时，会自动出现卷轴。属于FormField 物件，可设定与资料栏位的关联。

常用属性：
+ commentGroup -> comment：设定说明内容，当鼠标移过时会以符动视窗方式显示内容。
+ constraints -> noEntry：设定此属性后即无法进入此栏位编辑资料。
+ constraints -> notNull：不可在此栏位输入NULL 值或空字符串。
+ constraints -> required：不可在此栏位输入NULL 值、空字符串或纯空格符。
+ appearance -> case：令输入字符串自动转换大/小写。
+ scrollBars：可设定卷轴出现的位置，有NONE、VERTICAL、HORIZONTAL、BOTH 等。
+ wantTabs：当设定此属性时，允许在输入框中输入TAB 键。
+ WantNoReturns：当设定此属性时，不允许在输入框中输入ENTER 键。

### TimeEdit
![Alt text](images/image-61.png)
![Alt text](images/image-62.png)
### StaticImage
![Alt text](images/image-63.png)
![Alt text](images/image-64.png)
### FormFieldImage
![Alt text](images/image-65.png)
![Alt text](images/image-66.png)
### Slider
![Alt text](images/image-67.png)
![Alt text](images/image-68.png)
### SpinEdit
![Alt text](images/image-69.png)
![Alt text](images/image-70.png)
### WebComponent
![Alt text](images/image-72.png)
![Alt text](images/image-71.png)

## 其它项目

### TopMenus
### Toolbars
### Action Defaults
### Screen Record
### Style
## Tab Index
## Alignment
