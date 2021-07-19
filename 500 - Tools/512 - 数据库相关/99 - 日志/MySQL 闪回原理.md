## MySQL 闪回原理

> [**原文地址**](https://www.cnblogs.com/youge-OneSQL/p/5249736.html)



### 背景: binlog 格式选择

MySQL的binlog格式分为三类：statement、mixed、row。其中

1. statement
   记录了所有客户端的执行语句。比如 update tb1 set name='aaa' where id=1;

2.  row
   记录了数据库的变更前和变更后数据。比如 update tb1 set name='aaa' ,id=1 where name='bbb' , id=1;

3.  mixed
   是二者的混合。在使用 statement 格式不会造成主从不一致时，使用 statement 格式，否则使用 row 模式

因此想要把数据回退到上一个时间点，==必须保证binlog_format=row==



### 单个event闪回

- 反转
  - insert：event 中包含该行数据的每个字段值，删除即可
  - delete：event 中包含了删除前，该行数据的所有字段值。将删除的数据，重新插入即可
  - update：只需将 set 和 where 部分调换，即可完成反转



### 多个event闪回

如果误操作的事务是由多个 event 组成的，那么必须将整个事务==倒序恢复==，即从最后一个 event 恢复到第一个event



### 限制

闪回利用 binlog 中记录了操作前的数据镜像和操作后的数据镜像。有如下限制

1. binlog_format=row

2. 只支持 insert、update、delete

3. ==不支持 drop 、truncate、alter 等 ddl 语句==



## 参考

1. [mysqlbinlog flashback 5.6完全使用手册与原理](https://www.cnblogs.com/youge-OneSQL/p/5249736.html)