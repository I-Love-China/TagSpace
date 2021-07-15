## MySQL 清理 binlog

> [原文地址](https://dba.stackexchange.com/questions/41050/is-it-safe-to-delete-mysql-bin-files)



### clear all binlogs before the specific binlog file

```sql
PURGE BINARY LOGS TO 'mysql-bin.000223';
```



### clear all binlogs before specific timestamp

```sql
PURGE BINARY LOGS BEFORE 'datetimestamp';

PURGE BINARY LOGS BEFORE DATE(NOW() - INTERVAL 3 DAY) + INTERVAL 0 SECOND;
```



### keep binlogs for a period of time

```ini
[mysqld]
expire_logs_days=3
```







## 参考

1. [Is it safe to delete mysql-bin files?](https://dba.stackexchange.com/questions/41050/is-it-safe-to-delete-mysql-bin-files)