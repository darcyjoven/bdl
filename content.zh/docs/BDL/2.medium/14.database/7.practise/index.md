---
title: "7.练习"
lastmod: 2023-08-27T15:45:02+08:00
date: 2023-08-27T15:45:02+08:00
tags: ["practise"]
categories: ["practise"]
weight: 7
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 练习

## 创建学生资料表`student`

| 字段   | 数据类型    | 字段说明 |
| :----- | :---------- | :------- |
| name   | varchar(20) | 姓名     |
| grade  | varchar(4)  | 年级     |
| course | varchar(40) | 课程名称 |
| score  | number(5)   | 得分     |

## 输入学生资料信息，插入到数据库

1. 如果相同已经有该姓名、年级、课程名称的资料那么更新已有成绩
2. 如果得分小于0，或者大于100，报错，跳过这笔资料
3. 当有20笔资料时，停止录入

姓名|年级|课程名称|得分
---:|--:|-----:|---:


## 查询每门课的最高成绩，和平均成绩，并以以下格式显示

    课程名称      平均分   最高分
    a           67      90
    b           87      99



## 查询按照课程名称和成绩倒序排列显示成绩单

    姓名    年级   课程名称    成绩
    小米    4       数学       78
    小红    5       语文       98
