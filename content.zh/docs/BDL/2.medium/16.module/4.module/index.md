---
title: "4.BDL中的模块"
lastmod: 2023-08-28T20:06:19+08:00
date: 2023-08-28T20:06:19+08:00
tags: ["module"]
categories: ["BDL"]
weight: 4
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# BDL中的模块

BDL源代码从编译主程序、子程序，链接主程序，过程中会产生多个文件。

所以按照模块可以将BDL程序划分为不同的块，一个程序的执行往往依赖大量的模块。

<div>
<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile&gt;&lt;diagram id=\&quot;5xKWW0kusY9AFzx1AKQd\&quot; name=\&quot;Page-1\&quot;&gt;&lt;mxGraphModel dx=\&quot;1068\&quot; dy=\&quot;784\&quot; grid=\&quot;1\&quot; gridSize=\&quot;10\&quot; guides=\&quot;1\&quot; tooltips=\&quot;1\&quot; connect=\&quot;1\&quot; arrows=\&quot;1\&quot; fold=\&quot;1\&quot; page=\&quot;1\&quot; pageScale=\&quot;1\&quot; pageWidth=\&quot;850\&quot; pageHeight=\&quot;1100\&quot; math=\&quot;0\&quot; shadow=\&quot;0\&quot;&gt;&lt;root&gt;&lt;mxCell id=\&quot;0\&quot;/&gt;&lt;mxCell id=\&quot;1\&quot; parent=\&quot;0\&quot;/&gt;&lt;mxCell id=\&quot;9\&quot; value=\&quot;\&quot; style=\&quot;strokeWidth=2;html=1;shape=mxgraph.flowchart.start_2;whiteSpace=wrap;fontSize=24;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;90\&quot; y=\&quot;270\&quot; width=\&quot;640\&quot; height=\&quot;650\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;10\&quot; value=\&quot;czzi004\&quot; style=\&quot;text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=24;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;250\&quot; y=\&quot;350\&quot; width=\&quot;80\&quot; height=\&quot;40\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;29\&quot; style=\&quot;edgeStyle=none;html=1;fontSize=24;entryX=0;entryY=0;entryDx=0;entryDy=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;14\&quot; target=\&quot;28\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;14\&quot; value=\&quot;\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;strokeWidth=2;fillWeight=4;hachureGap=8;hachureAngle=45;fillColor=#1ba1e2;sketch=1;fontSize=24;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;140\&quot; y=\&quot;480\&quot; width=\&quot;230\&quot; height=\&quot;180\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;15\&quot; value=\&quot;lib.42x\&quot; style=\&quot;text;strokeColor=none;fillColor=none;html=1;fontSize=24;fontStyle=1;verticalAlign=middle;align=center;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;140\&quot; y=\&quot;500\&quot; width=\&quot;100\&quot; height=\&quot;40\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;16\&quot; value=\&quot;sub.42x\&quot; style=\&quot;text;strokeColor=none;fillColor=none;html=1;fontSize=24;fontStyle=1;verticalAlign=middle;align=center;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;260\&quot; y=\&quot;500\&quot; width=\&quot;100\&quot; height=\&quot;40\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;17\&quot; value=\&quot;\&quot; style=\&quot;ellipse;whiteSpace=wrap;html=1;strokeWidth=2;fillWeight=2;hachureGap=8;fillColor=#990000;fillStyle=dots;sketch=1;fontSize=24;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;140\&quot; y=\&quot;560\&quot; width=\&quot;120\&quot; height=\&quot;90\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;18\&quot; value=\&quot;&amp;lt;font style=&amp;quot;font-size: 12px;&amp;quot;&amp;gt;lib1.42m&amp;lt;/font&amp;gt;\&quot; style=\&quot;text;strokeColor=none;fillColor=none;html=1;fontSize=24;fontStyle=1;verticalAlign=middle;align=center;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;140\&quot; y=\&quot;603.75\&quot; width=\&quot;70\&quot; height=\&quot;22.5\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;23\&quot; value=\&quot;\&quot; style=\&quot;ellipse;whiteSpace=wrap;html=1;strokeWidth=2;fillWeight=2;hachureGap=8;fillColor=#990000;fillStyle=dots;sketch=1;fontSize=12;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;255\&quot; y=\&quot;560\&quot; width=\&quot;110\&quot; height=\&quot;90\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;21\&quot; value=\&quot;&amp;lt;font style=&amp;quot;font-size: 12px;&amp;quot;&amp;gt;sub1.42m&amp;lt;/font&amp;gt;\&quot; style=\&quot;text;strokeColor=none;fillColor=none;html=1;fontSize=24;fontStyle=1;verticalAlign=middle;align=center;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;270\&quot; y=\&quot;572.5\&quot; width=\&quot;70\&quot; height=\&quot;22.5\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;19\&quot; value=\&quot;&amp;lt;font style=&amp;quot;font-size: 12px;&amp;quot;&amp;gt;...42m&amp;lt;/font&amp;gt;\&quot; style=\&quot;text;strokeColor=none;fillColor=none;html=1;fontSize=24;fontStyle=1;verticalAlign=middle;align=center;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;190\&quot; y=\&quot;595\&quot; width=\&quot;100\&quot; height=\&quot;40\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;22\&quot; value=\&quot;&amp;lt;font style=&amp;quot;font-size: 12px;&amp;quot;&amp;gt;...42m&amp;lt;/font&amp;gt;\&quot; style=\&quot;text;strokeColor=none;fillColor=none;html=1;fontSize=24;fontStyle=1;verticalAlign=middle;align=center;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;270\&quot; y=\&quot;595\&quot; width=\&quot;60\&quot; height=\&quot;35\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;30\&quot; style=\&quot;edgeStyle=none;html=1;entryX=0.469;entryY=0.083;entryDx=0;entryDy=0;entryPerimeter=0;fontSize=24;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;25\&quot; target=\&quot;28\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;&lt;Array as=\&quot;points\&quot;&gt;&lt;mxPoint x=\&quot;410\&quot; y=\&quot;445\&quot;/&gt;&lt;/Array&gt;&lt;/mxGeometry&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;25\&quot; value=\&quot;&amp;lt;font style=&amp;quot;font-size: 24px;&amp;quot;&amp;gt;czzi004.42m&amp;lt;/font&amp;gt;\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;strokeWidth=2;fillWeight=4;hachureGap=8;hachureAngle=45;fillColor=#1ba1e2;sketch=1;fontSize=12;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;470\&quot; y=\&quot;400\&quot; width=\&quot;140\&quot; height=\&quot;90\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;31\&quot; style=\&quot;edgeStyle=none;html=1;entryX=1;entryY=0;entryDx=0;entryDy=0;fontSize=24;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;27\&quot; target=\&quot;28\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;27\&quot; value=\&quot;s_czzi004.42m\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;strokeWidth=2;fillWeight=4;hachureGap=8;hachureAngle=45;fillColor=#1ba1e2;sketch=1;fontSize=24;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;470\&quot; y=\&quot;550\&quot; width=\&quot;180\&quot; height=\&quot;110\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;28\&quot; value=\&quot;czzi004.42r\&quot; style=\&quot;rhombus;whiteSpace=wrap;html=1;strokeWidth=2;fillWeight=-1;hachureGap=8;fillStyle=cross-hatch;fillColor=#006600;sketch=1;fontSize=24;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;260\&quot; y=\&quot;730\&quot; width=\&quot;320\&quot; height=\&quot;120\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;/root&gt;&lt;/mxGraphModel&gt;&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>
</div>

## globals

如果说不同文件之间的通过链接的形式，组成不同模组最终组成了一个可执行程序。

那么`globals`就是使不同模块中共享变量不可缺少的关键字。

我们已知的变量最大的作用域，也就是函数外，即`全局变量`。在本文件中所有函数都可以使用。但是随之我们编写程序复杂度增加，我们使用很多不同文件，不同的模块，这个时候即使是`全局变量`也无法在不同文件中使用。

`globals`就是解决这个问题的，在globals中定义的变量，在程序整个运行周期都是可用的，无论你是哪个文件、模块中的函数。

`globals`是一个块语句，它有对于的`end globals`结束语。只能定义在函数外。
它的用法是，在块中包裹变量或者自定义类型--即`define`和`type`语句。

使用方法有两种
1. 在源代码中直接定义

```sql
globals
    define g_cnt  integer
end globals
main
end main
```

2. 定义一个globals文件，然后在源码中引入文件

+ 文件czzi004.global

```sql
globals
    define g_cnt  integer
end globals
```

+ 文件czzi004.4gl
```sql
globals "./czzi004.global"
main
end main
```

第二种方式是我们常用的方式，这样不同文件只要引入同一个global文件即可，不需要每次修改`globals`变量，都修改所有文件。

### 练习

观察分析`azz/4gl/p_zz.4gl`和`lib/4gl/cl_null.4gl`文件中`globals`的使用。

