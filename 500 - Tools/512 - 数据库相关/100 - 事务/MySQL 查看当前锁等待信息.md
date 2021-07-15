## MySQL 查看当前锁等待信息

### 方法

> There are some INFORMATION_SCHEMA tables for this:
>
> - [INFORMATION_SCHEMA.INNODB_LOCK_WAITS](https://dev.mysql.com/doc/refman/5.7/en/innodb-lock-waits-table.html)
> - [INFORMATION_SCHEMA.INNODB_LOCKS](https://dev.mysql.com/doc/refman/5.7/en/innodb-locks-table.html)
>
> In general, you can't get a list of locks, ==unless there's a lock-wait in progress==.
>
> That is, transaction A can hold some number of locks, but unless some transaction B is stuck waiting for it, it doesn't show up in the INFORMATION_SCHEMA. ^[1]^



## 参考

1. [How to see a list of Locks from a MySql Query?](https://stackoverflow.com/questions/49738809/how-to-see-a-list-of-locks-from-a-mysql-query)

