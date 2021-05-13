## MySQL 进阶使用

### 比较操作 大小写敏感

> Comparisons are **case insensitive** when the column uses a collation which ends with `_ci` (such as the *default* `latin1_general_ci` collation) and they are **case sensitive** when the column uses a collation which ends with `_cs` or `_bin` (such as the `utf8_unicode_cs` and `utf8_bin` collations). ^[1]^



### 创建索引时指定索引类型

> `CREATE INDEX` supports `USING BTREE` or `USING HASH` on the end. ^[2]^



 **Index Types Per Storage Engine** ^[3]^

| Storage Engine                                               | Permissible Index Types            |
| :----------------------------------------------------------- | :--------------------------------- |
| [`InnoDB`](https://dev.mysql.com/doc/refman/8.0/en/innodb-storage-engine.html) | `BTREE`                            |
| [`MyISAM`](https://dev.mysql.com/doc/refman/8.0/en/myisam-storage-engine.html) | `BTREE`                            |
| [`MEMORY`](https://dev.mysql.com/doc/refman/8.0/en/memory-storage-engine.html)/`HEAP` | `HASH`, `BTREE`                    |
| [`NDB`](https://dev.mysql.com/doc/refman/8.0/en/mysql-cluster.html) | `HASH`, `BTREE` (see note in text) |



## 参考

1. [MySQL: is a SELECT statement case sensitive?](https://stackoverflow.com/questions/3936967/mysql-is-a-select-statement-case-sensitive)

2. [How to add Btree or hash index to a table in mysql? \[closed]](https://stackoverflow.com/questions/13716435/how-to-add-btree-or-hash-index-to-a-table-in-mysql)

3. [13.1.15 CREATE INDEX Statement](https://dev.mysql.com/doc/refman/8.0/en/create-index.html#create-index-functional-key-parts)