## 导入
### 基础方法导入 ^[3]^
- A:常用source 命令  
> 进入mysql数据库控制台， 如mysql -u root -p  
> mysql> use 数据库  
> 然后使用source命令，后面参数为脚本文件(如这里用到的.sql)  
> mysql>source wcnc_db.sql  

- B:使用mysqldump命令  
```shell
mysqldump -u username -p dbname < filename.sql  
```

- C:使用mysql命令  
```shell
mysql -u username -p -D dbname < filename.sql
```

- D:也可以用文本方式将数据装入数据库表中（例如D:/mysql.txt）  
```shell
mysql> LOAD DATA LOCAL INFILE “D:/mysql.txt”INTO TABLE MYTABLE;  
```

### 导入时显示进度条 ^[2]^
```shell
pv sqlfile.sql | mysql -uroot -p dbname
```

==注意==: 这种方法有时会出现 `ERROR 1215 (HY000) at line 920: Cannot add foreign key constraint`，用 `source` 导入的话不会出现



## 导出

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

### 导出为 INSERT 语句 ^[8]^

> There doesn't seem to be a way to get the `INSERT` statements from the MySQL console, but you can get them using **mysqldump** like Rob suggested. Specify `-t` to omit table creation. ^[8]^

```shell
mysqldump -t -u MyUserName -pMyPassword MyDatabase MyTable --where="ID = 10"
```





## 信息查看

### 当前使用的数据库 ^[4]^
```sql
SELECT DATABASE()
```

### 查看表结构

```sql
desc <TABLE>
```

### processlist ^[5]^

```sql
-- 方法A:
show processlist

-- 方法B:
select * from information_schema.processlist
```

### 数据库大小 ^[7]^

```sql
select
	concat(round(sum(data_length / 1024 / 1024), 2), 'MB') as data
from
	information_schema.tables
where
	table_schema = 'schema_name'
	and table_name = 'table_name';

```





## 其他

### 生成 UUID ^[6]^

```sql
select uuid()
```



## 参考
1. [Does mysqldump support a progress bar?](https://stackoverflow.com/questions/4852933/does-mysqldump-support-a-progress-bar)

2. [christopher-paul-shaw/mysqldump-progress-export](https://gist.github.com/christopher-paul-shaw/db73591eb749949aad126947f1122702)

3. [Linux学习笔记- MySQL常用命令](https://www.jianshu.com/p/b46fe8c2bbed#86520ff8-f173-5eaf-9a5e-8af8c0b37572)

4. [MySQL: determine which database is selected?](https://stackoverflow.com/questions/8096550/mysql-determine-which-database-is-selected)

5. [mysql: show processlist 详解](https://zhuanlan.zhihu.com/p/30743094)

6. [mybatis生成UUID主键，且获取当前新增的UUID主键](https://my.oschina.net/whatwhy/blog/3020583)

7. [用SQL命令查看Mysql数据库大小](https://www.jianshu.com/p/cc20d90ac138)

8. [Get Insert Statement for existing row in MySQL](https://stackoverflow.com/questions/3978326/get-insert-statement-for-existing-row-in-mysql)