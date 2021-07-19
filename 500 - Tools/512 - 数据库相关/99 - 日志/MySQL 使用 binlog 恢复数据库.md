## MySQL 使用 binlog 恢复数据库

### Prerequisition

- 开启 binlog
- 对于闪回操作的额外要求
  - binlog_format=row
  - 只支持 DML、不支持 DDL 的闪回



### 方法 & 步骤

#### 方法 A、mysqldump + mysqlbinlog replay ^[1]^

##### 演示

**I、Create the mysqldump as follow:**

```bash
mysqldump -v --msater-data=2 --single-transaction --routines test_binlog > test_binlog.sql
```

> The mysqldump option `--master-data=1` recorded the log file and position as of the start of the mysqldump on line 22. ^[1]^

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/mysql_binlog_rec_mysqldump_20210713184937.png)



**II、演示误删除数据**

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/mysql_binlog_rec_mock_del_20210713185225.png)



**III、从 mysqldump 中全量恢复**

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/mysql_binlog_rec_mysqldump_all_20210713185442.png)

**IV、binlog 中删除错误 SQL 并重演**

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/mysql_binlog_rec_filter_20210713185902.png)

删除最后两条误提交的 SQL 重演 binlog 即可





#### 方法B、binlog2sql 闪回 ^[2]^

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/mysql_binlog_flashback_20210713190632.png)

> -B, --flashback 生成回滚SQL，可解析大文件，不受内存限制。可选。默认False。与stop-never或no-primary-key不能同时添加 ^[2]^





## 参考

1. [Restoring MySQL database with db dump and binlogs](https://dba.stackexchange.com/questions/27411/restoring-mysql-database-with-db-dump-and-binlogs)
2. [binlog2sql](https://github.com/danfengcao/binlog2sql)

