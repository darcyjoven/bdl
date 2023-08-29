---
title: "2.lib和sub函数"
lastmod: 2023-08-28T16:00:05+08:00
date: 2023-08-28T16:00:05+08:00
tags: [""]
categories: ["BDL"]
weight: 2
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# lib 和 sub 函数

## 42x 文件

回顾上一节的练习，调用`cl_null()`函数，是不是比较简单。

但是我们来看下一下`p_zz.4gl`的源码中调用了多少次 lib 函数(lib 函数一般以`cl`开始，有误差，但误差不大)，`$AZZ/4gl`目录下。

```bash
cd $AZZ/4gl
grep -c "cl" p_zz.4gl
...
265
```

调用了 265 次 lib 函数，如果按照上一节的办法，我们要找到这 265 个 lib 函数对应的文件，链接后并编译。

这实在太不方便了，所以 BDL 在链接时其实还隐藏了一个功能。

不需要额外的命令和源代码，我们依然使用`czzi004.4gl`和`s_czzi004.4gl`进行示例。

我们先删除之前生成的文件，防止影响本次结果。

```bash
cd $CZZ/4gl
rm *czzi004*.42m
rm *czzi004*.42r
```

1. 编译 `czzi004.4gl`和`s_czzi004.4gl`，和之前一样

2. 单独链接 `s_czzi004.42m`

```bash
fgllink -o czzi004_sub.42x s_czzi004.42m
```

3. 编译 `czzi004_sub.42x`和`czzi004.42m`

```bash
fgllink -o czzi004.42r czzi004.42m czzi004_sub.42x
```

4. `fglrun czzi004`

一样可以运行，看起来并没有减少步骤。

但是我们可以将第二步运用到整个 lib 目录下的所有文件，将所有 lib 目录下源代码都链接为`lib.42x`文件，那么之后不管哪个作业调用多少个 lib 函数，那么我们只要在编译这个新作业后，将`lib.42x`这个文件和主程序链接以下即可。

只要当`lib`目录下哪个文件修改了，才需要重新连接`lib.42x`文件。

这一步`tiptop gp`已经替我们做好了，`$LIB/42m`目录下有一个`lib.42x`文件。

上一节的练习题中，让我们使用以下命令，连接主程序。

```bash
fgllink -o czzi004.42r czzi004.42m $LIB/42m/lib.42x
```

结果一样可以运行。

## lib 和 sub 函数

`lib`和`sub`是`tiptop gp`中的两个子函数库，如果你使用`r.l2`链接程序，那么程序自动将这两个函数库链接到程序中。

所以这两个库的函数，你可以随时调用，而不用担心函数不存在的报错。

在结构上`lib`和`sub`没有任何区别，在使用上没有任何区别。

但如果你要新增，或者修改那么有几点需要注意：

|     项目 | lib                                                    | sub                                |
| -------: | :----------------------------------------------------- | :--------------------------------- |
| 功能范围 | 底层逻辑(替换字符串、判断字符段是否为空、四舍五入函数) | 业务逻辑（库存过账、系统日志记录） |
| 建议新增 | 不建议                                                 | 可以                               |
| 建议修改 | 不建议                                                 | 可以                               |
| 建议删除 | 不建议                                                 | 不建议                             |

{{< hint danger >}}
**重要**

无论是 sub 还是 lib，链接失败都影响所有作业，如果你要修改或新增这两个库的函数，请**务必**现在测试区测试成功后再搬到正式区运行。
{{</ hint >}}

## lib、sub函数新增流程

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile&gt;&lt;diagram id=\&quot;4Cfzrlh4ryToqalkVrY9\&quot; name=\&quot;Page-1\&quot;&gt;&lt;mxGraphModel dx=\&quot;1161\&quot; dy=\&quot;792\&quot; grid=\&quot;1\&quot; gridSize=\&quot;10\&quot; guides=\&quot;1\&quot; tooltips=\&quot;1\&quot; connect=\&quot;1\&quot; arrows=\&quot;1\&quot; fold=\&quot;1\&quot; page=\&quot;1\&quot; pageScale=\&quot;1\&quot; pageWidth=\&quot;3300\&quot; pageHeight=\&quot;4681\&quot; math=\&quot;0\&quot; shadow=\&quot;0\&quot;&gt;&lt;root&gt;&lt;mxCell id=\&quot;0\&quot;/&gt;&lt;mxCell id=\&quot;1\&quot; parent=\&quot;0\&quot;/&gt;&lt;mxCell id=\&quot;16\&quot; style=\&quot;edgeStyle=none;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;entryPerimeter=0;fontFamily=Helvetica;fontSize=12;fontColor=default;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;2\&quot; target=\&quot;8\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;2\&quot; value=\&quot;开始\&quot; style=\&quot;strokeWidth=2;html=1;shape=mxgraph.flowchart.terminator;whiteSpace=wrap;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;470\&quot; y=\&quot;60\&quot; width=\&quot;100\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;48\&quot; style=\&quot;edgeStyle=none;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;entryPerimeter=0;fontFamily=Helvetica;fontSize=12;fontColor=default;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;4\&quot; target=\&quot;43\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;4\&quot; value=\&quot;修改函数代码\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;absoluteArcSize=1;arcSize=14;strokeWidth=2;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;710\&quot; y=\&quot;360\&quot; width=\&quot;130\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;8\&quot; value=\&quot;新增函数\&quot; style=\&quot;strokeWidth=2;html=1;shape=mxgraph.flowchart.decision;whiteSpace=wrap;rounded=1;strokeColor=default;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;445\&quot; y=\&quot;170\&quot; width=\&quot;150\&quot; height=\&quot;100\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;9\&quot; value=\&quot;修改函数\&quot; style=\&quot;strokeWidth=2;html=1;shape=mxgraph.flowchart.decision;whiteSpace=wrap;rounded=1;strokeColor=default;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;445\&quot; y=\&quot;340\&quot; width=\&quot;150\&quot; height=\&quot;100\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;29\&quot; style=\&quot;edgeStyle=none;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;fontFamily=Helvetica;fontSize=12;fontColor=default;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;10\&quot; target=\&quot;4\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;10\&quot; value=\&quot;新增函数文件\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;absoluteArcSize=1;arcSize=14;strokeWidth=2;strokeColor=default;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;710\&quot; y=\&quot;190\&quot; width=\&quot;130\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;11\&quot; value=\&quot;删除函数\&quot; style=\&quot;strokeWidth=2;html=1;shape=mxgraph.flowchart.decision;whiteSpace=wrap;rounded=1;strokeColor=default;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;445\&quot; y=\&quot;640\&quot; width=\&quot;150\&quot; height=\&quot;100\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;14\&quot; value=\&quot;\&quot; style=\&quot;endArrow=classic;html=1;fontFamily=Helvetica;fontSize=12;fontColor=default;exitX=1;exitY=0.5;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;8\&quot; target=\&quot;10\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;&lt;mxPoint x=\&quot;600\&quot; y=\&quot;170\&quot; as=\&quot;sourcePoint\&quot;/&gt;&lt;mxPoint x=\&quot;700\&quot; y=\&quot;170\&quot; as=\&quot;targetPoint\&quot;/&gt;&lt;/mxGeometry&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;15\&quot; value=\&quot;是\&quot; style=\&quot;edgeLabel;resizable=0;html=1;align=center;verticalAlign=middle;rounded=1;strokeColor=default;strokeWidth=2;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; connectable=\&quot;0\&quot; vertex=\&quot;1\&quot; parent=\&quot;14\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;17\&quot; value=\&quot;\&quot; style=\&quot;endArrow=classic;html=1;fontFamily=Helvetica;fontSize=12;fontColor=default;exitX=0.5;exitY=1;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;entryPerimeter=0;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;8\&quot; target=\&quot;9\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;&lt;mxPoint x=\&quot;330\&quot; y=\&quot;280\&quot; as=\&quot;sourcePoint\&quot;/&gt;&lt;mxPoint x=\&quot;430\&quot; y=\&quot;280\&quot; as=\&quot;targetPoint\&quot;/&gt;&lt;/mxGeometry&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;18\&quot; value=\&quot;否\&quot; style=\&quot;edgeLabel;resizable=0;html=1;align=center;verticalAlign=middle;rounded=1;strokeColor=default;strokeWidth=2;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; connectable=\&quot;0\&quot; vertex=\&quot;1\&quot; parent=\&quot;17\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;19\&quot; value=\&quot;\&quot; style=\&quot;endArrow=classic;html=1;fontFamily=Helvetica;fontSize=12;fontColor=default;exitX=1;exitY=0.5;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;9\&quot; target=\&quot;4\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;&lt;mxPoint x=\&quot;620\&quot; y=\&quot;320\&quot; as=\&quot;sourcePoint\&quot;/&gt;&lt;mxPoint x=\&quot;720\&quot; y=\&quot;320\&quot; as=\&quot;targetPoint\&quot;/&gt;&lt;/mxGeometry&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;20\&quot; value=\&quot;是\&quot; style=\&quot;edgeLabel;resizable=0;html=1;align=center;verticalAlign=middle;rounded=1;strokeColor=default;strokeWidth=2;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; connectable=\&quot;0\&quot; vertex=\&quot;1\&quot; parent=\&quot;19\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;21\&quot; value=\&quot;\&quot; style=\&quot;endArrow=classic;html=1;fontFamily=Helvetica;fontSize=12;fontColor=default;exitX=0.5;exitY=1;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;entryPerimeter=0;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;9\&quot; target=\&quot;11\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;&lt;mxPoint x=\&quot;220\&quot; y=\&quot;470\&quot; as=\&quot;sourcePoint\&quot;/&gt;&lt;mxPoint x=\&quot;320\&quot; y=\&quot;470\&quot; as=\&quot;targetPoint\&quot;/&gt;&lt;/mxGeometry&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;22\&quot; value=\&quot;否\&quot; style=\&quot;edgeLabel;resizable=0;html=1;align=center;verticalAlign=middle;rounded=1;strokeColor=default;strokeWidth=2;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; connectable=\&quot;0\&quot; vertex=\&quot;1\&quot; parent=\&quot;21\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;51\&quot; style=\&quot;edgeStyle=none;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;fontFamily=Helvetica;fontSize=12;fontColor=default;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;23\&quot; target=\&quot;32\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;23\&quot; value=\&quot;修改p_link中lib的资料\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;absoluteArcSize=1;arcSize=14;strokeWidth=2;strokeColor=default;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;710\&quot; y=\&quot;660\&quot; width=\&quot;130\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;24\&quot; value=\&quot;\&quot; style=\&quot;endArrow=classic;html=1;fontFamily=Helvetica;fontSize=12;fontColor=default;entryX=0;entryY=0.5;entryDx=0;entryDy=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;exitPerimeter=0;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;11\&quot; target=\&quot;23\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;&lt;mxPoint x=\&quot;250\&quot; y=\&quot;490\&quot; as=\&quot;sourcePoint\&quot;/&gt;&lt;mxPoint x=\&quot;350\&quot; y=\&quot;490\&quot; as=\&quot;targetPoint\&quot;/&gt;&lt;Array as=\&quot;points\&quot;/&gt;&lt;/mxGeometry&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;25\&quot; value=\&quot;是\&quot; style=\&quot;edgeLabel;resizable=0;html=1;align=center;verticalAlign=middle;rounded=1;strokeColor=default;strokeWidth=2;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; connectable=\&quot;0\&quot; vertex=\&quot;1\&quot; parent=\&quot;24\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;28\&quot; value=\&quot;结束\&quot; style=\&quot;strokeWidth=2;html=1;shape=mxgraph.flowchart.terminator;whiteSpace=wrap;rounded=1;strokeColor=default;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;470\&quot; y=\&quot;1069\&quot; width=\&quot;100\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;50\&quot; style=\&quot;edgeStyle=none;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;entryPerimeter=0;fontFamily=Helvetica;fontSize=12;fontColor=default;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;31\&quot; target=\&quot;33\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;31\&quot; value=\&quot;链接用到函数的主程序\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;absoluteArcSize=1;arcSize=14;strokeWidth=2;strokeColor=default;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;455\&quot; y=\&quot;800\&quot; width=\&quot;130\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;49\&quot; style=\&quot;edgeStyle=none;html=1;entryX=1;entryY=0.5;entryDx=0;entryDy=0;fontFamily=Helvetica;fontSize=12;fontColor=default;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;32\&quot; target=\&quot;31\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;32\&quot; value=\&quot;r.l2 lib\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;absoluteArcSize=1;arcSize=14;strokeWidth=2;strokeColor=default;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;709\&quot; y=\&quot;800\&quot; width=\&quot;130\&quot; height=\&quot;60\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;33\&quot; value=\&quot;运行测试成功否\&quot; style=\&quot;strokeWidth=2;html=1;shape=mxgraph.flowchart.decision;whiteSpace=wrap;rounded=1;strokeColor=default;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;445\&quot; y=\&quot;920\&quot; width=\&quot;150\&quot; height=\&quot;100\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;34\&quot; value=\&quot;\&quot; style=\&quot;endArrow=classic;html=1;fontFamily=Helvetica;fontSize=12;fontColor=default;exitX=0.5;exitY=1;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;entryPerimeter=0;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;33\&quot; target=\&quot;28\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;&lt;mxPoint x=\&quot;630\&quot; y=\&quot;900\&quot; as=\&quot;sourcePoint\&quot;/&gt;&lt;mxPoint x=\&quot;730\&quot; y=\&quot;900\&quot; as=\&quot;targetPoint\&quot;/&gt;&lt;/mxGeometry&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;35\&quot; value=\&quot;是\&quot; style=\&quot;edgeLabel;resizable=0;html=1;align=center;verticalAlign=middle;rounded=1;strokeColor=default;strokeWidth=2;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; connectable=\&quot;0\&quot; vertex=\&quot;1\&quot; parent=\&quot;34\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;36\&quot; value=\&quot;\&quot; style=\&quot;endArrow=classic;html=1;fontFamily=Helvetica;fontSize=12;fontColor=default;exitX=1;exitY=0.5;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;33\&quot; target=\&quot;4\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;&lt;mxPoint x=\&quot;290\&quot; y=\&quot;780\&quot; as=\&quot;sourcePoint\&quot;/&gt;&lt;mxPoint x=\&quot;780\&quot; y=\&quot;330\&quot; as=\&quot;targetPoint\&quot;/&gt;&lt;Array as=\&quot;points\&quot;&gt;&lt;mxPoint x=\&quot;940\&quot; y=\&quot;970\&quot;/&gt;&lt;mxPoint x=\&quot;940\&quot; y=\&quot;330\&quot;/&gt;&lt;mxPoint x=\&quot;775\&quot; y=\&quot;330\&quot;/&gt;&lt;/Array&gt;&lt;/mxGeometry&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;37\&quot; value=\&quot;否\&quot; style=\&quot;edgeLabel;resizable=0;html=1;align=center;verticalAlign=middle;rounded=1;strokeColor=default;strokeWidth=2;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; connectable=\&quot;0\&quot; vertex=\&quot;1\&quot; parent=\&quot;36\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;43\&quot; value=\&quot;p_link是否已有资料\&quot; style=\&quot;strokeWidth=2;html=1;shape=mxgraph.flowchart.decision;whiteSpace=wrap;rounded=1;strokeColor=default;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;700\&quot; y=\&quot;480\&quot; width=\&quot;150\&quot; height=\&quot;100\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;44\&quot; value=\&quot;\&quot; style=\&quot;endArrow=classic;html=1;fontFamily=Helvetica;fontSize=12;fontColor=default;exitX=1;exitY=0.5;exitDx=0;exitDy=0;exitPerimeter=0;entryX=1;entryY=0.5;entryDx=0;entryDy=0;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;43\&quot; target=\&quot;32\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;&lt;mxPoint x=\&quot;790\&quot; y=\&quot;600\&quot; as=\&quot;sourcePoint\&quot;/&gt;&lt;mxPoint x=\&quot;890\&quot; y=\&quot;600\&quot; as=\&quot;targetPoint\&quot;/&gt;&lt;Array as=\&quot;points\&quot;&gt;&lt;mxPoint x=\&quot;880\&quot; y=\&quot;530\&quot;/&gt;&lt;mxPoint x=\&quot;880\&quot; y=\&quot;800\&quot;/&gt;&lt;mxPoint x=\&quot;880\&quot; y=\&quot;830\&quot;/&gt;&lt;/Array&gt;&lt;/mxGeometry&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;45\&quot; value=\&quot;是\&quot; style=\&quot;edgeLabel;resizable=0;html=1;align=center;verticalAlign=middle;rounded=1;strokeColor=default;strokeWidth=2;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; connectable=\&quot;0\&quot; vertex=\&quot;1\&quot; parent=\&quot;44\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;46\&quot; value=\&quot;\&quot; style=\&quot;endArrow=classic;html=1;fontFamily=Helvetica;fontSize=12;fontColor=default;exitX=0.5;exitY=1;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;\&quot; edge=\&quot;1\&quot; parent=\&quot;1\&quot; source=\&quot;43\&quot; target=\&quot;23\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;&gt;&lt;mxPoint x=\&quot;640\&quot; y=\&quot;590\&quot; as=\&quot;sourcePoint\&quot;/&gt;&lt;mxPoint x=\&quot;740\&quot; y=\&quot;590\&quot; as=\&quot;targetPoint\&quot;/&gt;&lt;/mxGeometry&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;47\&quot; value=\&quot;否\&quot; style=\&quot;edgeLabel;resizable=0;html=1;align=center;verticalAlign=middle;rounded=1;strokeColor=default;strokeWidth=2;fontFamily=Helvetica;fontSize=12;fontColor=default;fillColor=default;\&quot; connectable=\&quot;0\&quot; vertex=\&quot;1\&quot; parent=\&quot;46\&quot;&gt;&lt;mxGeometry relative=\&quot;1\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;/root&gt;&lt;/mxGraphModel&gt;&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>