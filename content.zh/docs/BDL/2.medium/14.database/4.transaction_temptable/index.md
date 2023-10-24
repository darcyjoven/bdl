---
title: "4.事务和临时表"
lastmod: 2023-10-24T09:49:27+08:00
date: 2023-10-24T09:49:27+08:00
tags: [""]
categories: [""]
weight: 4
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

# 事务和临时表

## 事务

事务的特性：

- 原子性：事务是一个不可分割的工作单位，事务中的操作，要么都发生，要么都不发生。
- 一致性：事务前后数据的完整性必须保持一致。
- 隔离性：事务的隔离性是指一个事务的执行不被另一个事务干扰，即一个事务内部的操作及使用的数据对并发的
- 持久性：一个事务一旦被提交，它对数据库中数据的改变是永久性的，即使数据库发生故障也不应该对其有任何影响。

一个`update`是一个事务，一次`delete`也是一次事务，要么都成功，要么都失败，不会出现更新一半的情况。

### 事务的开启、回滚、提交

在`plsql`中操作数据，每次更新之后要提交，这里事务是自动开启的。
但是在 BDL 中事务需要主动开启，否则每个语句运行之后自动提交，即：数据库数据立即修改。

在某些场景，如工单拆分 LOT 单，订单转工单，期望的是全部成功才生成单据，任何一笔失败了，希望从新开始而不是部分产生单据。
这些场景就我们就需要手动开启事务:

```sql
--开启事务
begin work
let g_success = 'Y'
for i = 1 to 100
    update student set name='xiaoming' where id=i;
    if sqlca.sqlcode then
        let g_success = 'N'
        -- 有任何一笔失败，立即回滚事务，回滚事务，即：本次事务中所有操作取消不做，回到初始状态
        rollback work
    end if
end for
if g_success = 'Y' then
    -- 如果成功才会提交事务
    commit work
end if
```

事务的特点：

- 在事务中能查到本次事务中修改的数据
- 在事务中能查到其它事务已经提交的数据
- 在事务中查不到其它事务没有提交的数据
- **DDL 语句运行时，会自动提交事务，请避免在事务中运行 DDL 语句**

### 锁表

请购单，请购数量100，小红接到需求请购数量变为200，但是小红的主管和后面又接到需求请购数量变为150。
他们同时修改数量，主管先修改为150，这个时候小红没有刷新数据，又修改为了200。导致主管以为已经修改为了150数量。

这个场景仅仅用事务已经无法解决，因为小红无法知道主管将数量改为了150。

所以数据库提供了一个功能--**锁表**，锁表是可以将你需要操作的数据锁住，在你解锁之前，其它用户无法对这些数据进行任何操作。

锁表必须在事务中锁表，因为在事务中，你才有必要锁表：

```sql
let l_sql = "select * from student where id = 1 for update"
declare stu_upd cursor from l_sql
let l_sql = "select * from student where id = 2 for update nowait"
declare stu_upd_nowait cursor from l_sql

begin work
-- 开启事务

open stu_upd
-- 开启锁表
if sqlca.sqlcode then
    display "",sqlca.sqlcode
end if
open stu_upd_nowait
if sqlca.sqlcode then
    display "",sqlca.sqlcode
end if
-- 开启锁表

update ...

close stu_upd
close stu_upd_nowait
-- 修改完资料可以主动解锁
commit work
-- 如果不解锁，事务提交后，也会自动解锁
```

- `for update` 如果有用户锁表，会等待之前用户完成
- `for update nowait` 如果有用户锁表，立即报错


## 临时表

BDL中可以使用临时表

临时表--`TEMP TABLE`和`TABLE`和普通表的区别在于：

`TEMP TABLE`每次关闭作业数据和表结构都会被删除，即只存在于作业打开的过程。

创建临时表的两种方式：

```sql
-- 方式一
drop table stu_temp
-- 创建之前可以先drop一下，防止已经建立过
create temp table stu_temp(
stu01 varchar(20),
stu02 date,
stu03 ...
...
)
-- 方式二
drop table stu_temp
-- 创建之前可以先drop一下，防止已经建立过
select * from student where 1=2 into temp stu_temp
-- 依据查询结果建立，查询结果中的资料也会同步插入到临时表中
-- 如果不需要资料，可以设置一个永远不会成立的查询条件如 1=2
```

> **就像事务中说的一样，创建临时表也是DDL语句，所以请不要在事务中创建，会自动提交事务**
