## MySQL: How to reset or change the MySQL root password?





> Set / change / reset the MySQL root password on Ubuntu Linux. Enter the following lines in your terminal.
>
> 1. Stop the MySQL Server: `sudo /etc/init.d/mysql stop`
> 2. Start the `mysqld` configuration: `sudo mysqld --skip-grant-tables &`
>
> In some cases, you've to create the `/var/run/mysqld` first:
>
> ```bash
>     sudo mkdir -v /var/run/mysqld && sudo chown mysql /var/run/mysqld
> ```
>
> 3. Login to MySQL as root: `mysql -u root mysql`
> 4. Replace `YOURNEWPASSWORD` with your new password:
>
> **For MySQL < 8.0**
>
> ```sql
>     UPDATE
>       mysql.user
>     SET
>       Password = PASSWORD('YOURNEWPASSWORD')
>     WHERE
>       User = 'root';
>     FLUSH PRIVILEGES;
>     exit;
> ```
>
> > Note: on some versions, if `password` column doesn't exist, you may want to try:
> > `UPDATE user SET authentication_string=password('YOURNEWPASSWORD') WHERE user='root';`
>
> **Note: This method is not regarded as the most secure way of resetting the password, however, it works.**
>
> **For MySQL >= 8.0**
>
> ```sql
> ALTER USER 'root'@'localhost' IDENTIFIED BY 'YOURNEWPASSWORD';
> ```
>
> References:
>
> 1. [Set / Change / Reset the MySQL root password on Ubuntu Linux](http://ubuntu.flowconsult.at/en/mysql-set-change-reset-root-password/)
> 2. [How to Reset the Root Password (v5.6)](http://dev.mysql.com/doc/refman/5.6/en/resetting-permissions.html)
> 3. [How to Reset the Root Password (v8.0)](https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html)



## 参考

1. [MySQL: How to reset or change the MySQL root password?](https://stackoverflow.com/questions/16556497/mysql-how-to-reset-or-change-the-mysql-root-password)