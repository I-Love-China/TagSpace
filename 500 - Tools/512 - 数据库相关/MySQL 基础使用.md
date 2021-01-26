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
```
# 注意是 mysqlpump，不是 mysqldump
mysqlpump -h 192.168.1.21 -uroot -p --databases $DB | sed -e '/^USE `/d' > $DB.$DATE_TIME.db 
```

## 信息查看
### 当前使用的数据库 ^[4]^
```
SELECT DATABASE()
```

## 参考
1. [Does mysqldump support a progress bar?](https://stackoverflow.com/questions/4852933/does-mysqldump-support-a-progress-bar)
2. [christopher-paul-shaw/mysqldump-progress-export](https://gist.github.com/christopher-paul-shaw/db73591eb749949aad126947f1122702)
3. [Linux学习笔记- MySQL常用命令](https://www.jianshu.com/p/b46fe8c2bbed#86520ff8-f173-5eaf-9a5e-8af8c0b37572)
4. [MySQL: determine which database is selected?](https://stackoverflow.com/questions/8096550/mysql-determine-which-database-is-selected)