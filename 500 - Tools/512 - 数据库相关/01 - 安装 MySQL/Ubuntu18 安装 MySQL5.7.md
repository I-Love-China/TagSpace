## MySQL5.7 @ Ubuntu 18.04 ^[1]^

### I、Installing MySQL

```shell
sudo apt update
sudo apt install mysql-server-5.7
```



### II、Configuring MySQL

```shell
sudo mysql_secure_installation
```

> This will take you through a series of prompts where you can make some changes to your MySQL installation’s security options. ^[1]^

> Note that even though you’ve set a password for the **root** MySQL user, this user ==**is not**== configured to authenticate with a password when connecting to the MySQL shell. If you’d like, you can adjust this setting by following Step 3. ^[1]^



### III、Adjusting User Authentication and Privileges

#### **允许 `root` 账号通过密码连接**

> In Ubuntu systems running MySQL 5.7 (and later versions), the **root** MySQL user is set to authenticate using the `auth_socket` plugin by default rather than with a password. ^[1]^

> In order to use a password to connect to MySQL as **root**, you will need to switch its authentication method from `auth_socket` to `mysql_native_password`. ^[1]^

```shell
sudo mysql # 注意需要加上 sudo
```

```sql
SELECT user,authentication_string,plugin,host FROM mysql.user;

-- To configure the root account to authenticate with a password, 
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

-- Tells the server to reload the grant tables and put your new changes into effect
FLUSH PRIVILEGES;
```



#### **添加新用户**

```sql
CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
```

> Note that, at this point, you do not need to run the `FLUSH PRIVILEGES` command again. This command is only needed when you modify the grant tables using statements like `INSERT`, `UPDATE`, or `DELETE`. Because you created a new user, instead of modifying an existing one, ==`FLUSH PRIVILEGES` is unnecessary here.== ^[1]^





## 参考

1. [How To Install MySQL on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04)