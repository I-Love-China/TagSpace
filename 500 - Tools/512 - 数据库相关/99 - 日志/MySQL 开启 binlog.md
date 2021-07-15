## MySQL 开启 binlog



### MySQL 5.7 ^[1]^

```ini
# /etc/mysql/my.cnf

[mysqld]
log-bin=mysql-binlog
server-id=1
binlog_format=ROW
```





## 参考

1. [enable binlog in MySQL on Ubuntu](https://serverfault.com/questions/706699/enable-binlog-in-mysql-on-ubuntu)