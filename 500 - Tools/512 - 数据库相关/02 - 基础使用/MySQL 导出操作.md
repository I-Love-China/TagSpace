## MySQL 导出操作



### 导出一个表 ^[3]^
```shell
mysqldump -u 用户名 -p 数据库名 表名> 导出的文件名  
mysqldump -u wcnc -p smgp_apps_wcnc users> wcnc_users.sql
```

### 导出整个数据库 ^[3]^
```shell
mysqldump -u 用户名 -p –default-character-set=utf-8 数据库名 > 导出的文件名
mysqldump -u root -p sop> sop.sql  
```

### 导出时显示进度 ^[1]^
```shell
# 注意是 mysqlpump，不是 mysqldump
mysqlpump -h 192.168.1.21 -uroot -p --databases $DB | sed -e '/^USE `/d' > $DB.$DATE_TIME.db 
```

### 导出为 INSERT 语句 ^[4]^

> There doesn't seem to be a way to get the `INSERT` statements from the MySQL console, but you can get them using **mysqldump** like Rob suggested. Specify `-t` to omit table creation. ^[4]^

```shell
mysqldump -t -u MyUserName -pMyPassword MyDatabase MyTable --where="ID = 10"
```



### Create column names for inserts when backing up ^[5]^

> Use `--complete-insert` in the mysqldump command params



### mysqldump without dropping any tables^[6]^

> Include the command for the mysqldump ignore the structure.
>
> > mysqldump --no-create-info ...



## 参考
1. [Does mysqldump support a progress bar?](https://stackoverflow.com/questions/4852933/does-mysqldump-support-a-progress-bar)

2. [christopher-paul-shaw/mysqldump-progress-export](https://gist.github.com/christopher-paul-shaw/db73591eb749949aad126947f1122702)

3. [Linux学习笔记- MySQL常用命令](https://www.jianshu.com/p/b46fe8c2bbed#86520ff8-f173-5eaf-9a5e-8af8c0b37572)

4. [Get Insert Statement for existing row in MySQL](https://stackoverflow.com/questions/3978326/get-insert-statement-for-existing-row-in-mysql)

5. [Mysqldump: create column names for inserts when backing up](https://stackoverflow.com/questions/5467517/mysqldump-create-column-names-for-inserts-when-backing-up)

6. [How to mysqldump WITHOUT dropping any tables](https://stackoverflow.com/questions/49682922/how-to-mysqldump-without-dropping-any-tables)
