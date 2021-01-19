### 导入导出 ^[1]^

#### 导出整个数据库
  ```shell
   mysqldump -u 用户名 -p –default-character-set=utf-8 数据库名 > 导出的文件名
   mysqldump -u root -p sop> sop.sql  
  ```
#### 导出一个表
  ```shell
  mysqldump -u 用户名 -p 数据库名 表名> 导出的文件名  
  mysqldump -u wcnc -p smgp_apps_wcnc users> wcnc_users.sql
  ```
#### 导入数据库
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

### 参考
1. [Linux学习笔记- MySQL常用命令](https://www.jianshu.com/p/b46fe8c2bbed#86520ff8-f173-5eaf-9a5e-8af8c0b37572)