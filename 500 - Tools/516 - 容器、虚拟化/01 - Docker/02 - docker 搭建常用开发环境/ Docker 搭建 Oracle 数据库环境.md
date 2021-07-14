## Docker 搭建 Oracle 数据库环境

> [原文链接](https://www.hangge.com/blog/cache/detail_2797.html)



### I、启动容器

```bash
docker run -d -p 1521:1521 --name oracle11g registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g
```



### II、配置连接账户

1. 以 `root` 用户进入容器

   ```bash
    docker exec -it -u 0 oracle11g bash
   ```

2. 创建 `sqlplus` 软链接

   ```bash
   ln -s $ORACLE_HOME/bin/sqlplus /usr/bin
   ```

3. [Optional] 配置 SID (默认 `helowin`)

   ```
   export ORACLE_SID=helowin
   ```

   

4. 切换 `oracle` 用户，登录 `sqlplus`

   ```bash
   su - oracle
   
   sqlplus /nolog
   ```

   > **注意:** 一定要写中间的那一横条（**-**）必须要，否则软连接无效。

5. 设置 `system`、`sys` 账号的密码

   ```sql
   conn /as sysdba
   
   alter user system identified by abc;
   alter user sys identified by abc;
   ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
   ```

   ![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/sqlplus_2020030218303751551.png)

6. 解锁 `scott` 用户

   ```sql
   alter user scott account unlock;
   alter user scott identified by abc;
   commit;
   ```

7. 配置完毕



### 客户端连接测试

#### DBeaver

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/oracle_dbeaver_20210527121048.png)



#### DataGrip

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/oracle_datagrip_20210527121430.png)