## MySQL json操作

### 查询记录 ^[1]^

```sql
SELECT JSON_EXTRACT(info, '$.age') FROM t_json;
```



### 修改记录 ^[1]^

```sql
UPDATE t_json SET info = JSON_SET(info, "$.ip", "192.168.1.1") WHERE id = 2;
```



## 参考
1. [mysql json 使用 类型 查询 函数](https://www.cnblogs.com/ooo0/p/9309277.html)