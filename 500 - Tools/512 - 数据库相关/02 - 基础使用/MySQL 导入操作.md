## MySQL 导入



### 基础方法导入 ^[2]^

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



### 导入时显示进度条 ^[1]^

```shell
pv sqlfile.sql | mysql -uroot -p dbname
```

==注意==: 这种方法有时会出现 `ERROR 1215 (HY000) at line 920: Cannot add foreign key constraint`，用 `source` 导入的话不会出现



## 参考

1. [christopher-paul-shaw/mysqldump-progress-export](https://gist.github.com/christopher-paul-shaw/db73591eb749949aad126947f1122702)

2. [Linux学习笔记- MySQL常用命令](https://www.jianshu.com/p/b46fe8c2bbed#86520ff8-f173-5eaf-9a5e-8af8c0b37572)
