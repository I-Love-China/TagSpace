## MySQL DDL

#### 新建数据库 ^[1]^

```sql
create database test default character set utf8mb4 collate utf8mb4_unicode_ci;

create database test default character set utf8mb4 collate utf8mb4_general_ci;
```



#### 修改字段类型 ^[2]^

```sql
ALTER TABLE <tablename> MODIFY COLUMN <columename> VARCHAR(64)
```



## 参考

1. [mysql create database新建utf8mb4 数据库](http://www.ecjson.com/article/123.html)

2. [How to change Column size of varchar type in mySQL? ](https://stackoverflow.com/questions/22668024/how-to-change-column-size-of-varchar-type-in-mysql)