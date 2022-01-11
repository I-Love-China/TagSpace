## Drop all tables from a database with one SQL query



```sql
SELECT
	CONCAT('drop table ', table_schema, '.', table_name, ';')
FROM
	information_schema.tables
WHERE
	TABLE_SCHEMA in ('test_db');

```





## 参考

1. [How to drop all tables from a database with one SQL query?](https://stackoverflow.com/questions/27606518/how-to-drop-all-tables-from-a-database-with-one-sql-query)