## MySQL 清理 general_log

> [原文地址](https://programmersought.com/article/21553224559/)



### I、关闭 general query log

```sql
SET GLOBAL general_log = 'OFF'
```



### II.a、清理查询日志文件

```bash
cat /dev/null > /var/lib/mysql/general_log.log
```



### II.b、清理 `general_log` 表

```sql
RENAME TABLE mysql.general_log TO mysql.general_log_2;
DELETE FROM mysql.general_log_2;

-- Note: When DELETE FROM mysql.general_log_2 delete table data, found that the operating system data file still exists, you need to manually delete the data file, and then continue with the following steps data

OPTIMIZE TABLE general_log_2;
RENAME TABLE mysql.general_log_2 TO mysql.general_log;
```



### III、开启 general query log

```sql
SET GLOBAL general_log = 'ON'
```







## 参考

1. [Cleanup MySQL general_log](https://programmersought.com/article/21553224559/)