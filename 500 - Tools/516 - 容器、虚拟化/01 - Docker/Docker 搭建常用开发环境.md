## Docker 搭建常用开发环境

### centos7/mysql-57

```bash
sudo docker run --restart=always -d \
     -e MYSQL_USER=user \
     -e MYSQL_PASSWORD=123456 \
     -e MYSQL_DATABASE=test \
     -e TZ="Asia/Shanghai" \
     -p 3307:3306 \
     centos/mysql-57-centos7 \
     run-mysqld --user=root \
     --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci  # ^[1]^
```







## 参考

1. [How to change the default character set of mysql using docker-compose?](https://stackoverflow.com/questions/45729326/how-to-change-the-default-character-set-of-mysql-using-docker-compose)