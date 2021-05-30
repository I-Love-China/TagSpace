## MySQL json操作

### 查询记录 ^[1]^

```sql
SELECT JSON_EXTRACT(info, '$.age') FROM t_json;
```



### 修改记录 ^[1]^

```sql
UPDATE t_json SET info = JSON_SET(info, "$.ip", "192.168.1.1") WHERE id = 2;
```



### 字符串转为 JSON ^[2]^

```sql
CONVERT( your_long_text_col,  JSON)
```





## 参考
1. [mysql json 使用 类型 查询 函数](https://www.cnblogs.com/ooo0/p/9309277.html)

2. [How to return a LONGTEXT field as JSON in MySQL/MariaDB](https://stackoverflow.com/questions/59934389/how-to-return-a-longtext-field-as-json-in-mysql-mariadb)
