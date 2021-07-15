## MySQL 查看连接的客户端 IP



### 应用场景

1. 排查长时间持有锁的连接所属机器/应用

   

### Prerequisition

- 开启 general query log 功能，TABLE 格式



### 方法

#### I、查找对应连接 id

```sql
select * from information_schema.`PROCESSLIST` where INFO like '%PROCESSLIST%';
```



#### II、从 general_log 中查找对应 thread_id 的记录

```sql
select user_host, argument from mysql.general_log where thread_id = 1049;
```





### 演示

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/mysql_client_ip_general_log_20210712155157.png)

