## MySQL 最大连接数 ^[1]^

## 相关参数
### `max_connections`

#### 含义
> The maximum permitted number of ==simultaneous== client connections. For more information, see [Section 5.1.12.1, “Connection Interfaces”](https://dev.mysql.com/doc/refman/8.0/en/connection-interfaces.html). ^[2]^

#### 属性 ^[2]^
>| Command-Line Format                                          | `--max-connections=#` |
>| ------------------------------------------------------------ | --------------------- |
>| System Variable                                              | `max_connections`     |
>| Scope                                                        | Global                |
>| ==Dynamic==                                                  | Yes                   |
>| [`SET_VAR`](https://dev.mysql.com/doc/refman/8.0/en/optimizer-hints.html#optimizer-hints-set-var) Hint Applies | No                    |
>| Type                                                         | Integer               |
>| ==Default Value==                                            | `151`                 |
>| Minimum Value                                                | `1`                   |
>| Maximum Value                                                | `100000`              |
>


#### 查看^[1]^

```sql
show variables like '%max_connections%';
```

#### ==设置^[1]^==

```sql
set GLOBAL max_connections=500
```





### `Max_used_connections`

#### 含义

> The maximum number of connections that have been ==in use== simultaneously since the server started. ^[3]^

#### 查看^[1]^

```sql
show global status like 'Max_used_connections';
```



## 参考
1. [Mysql 连接数,最大并发数设置](https://www.cnblogs.com/phpper/p/9570792.html)
2. [max_connections](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_max_connections)
3. [Max_used_connections](https://dev.mysql.com/doc/refman/8.0/en/server-status-variables.html#statvar_Max_used_connections)