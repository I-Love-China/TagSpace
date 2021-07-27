## MySQL Suppress column header output for a single SQL statement



### 方法 ^[2]^

> Invoke mysql with the `-N` (the alias for `-N` is `--skip-column-names`) option:
>
> ```sql
> mysql -N ...
> use testdb;
> select * from names;
> 
> +------+-------+
> |    1 | pete  |
> |    2 | john  |
> |    3 | mike  |
> +------+-------+
> 3 rows in set (0.00 sec)
> ```
>
> Credit to ErichBSchulz for pointing out the -N alias.
>
> To remove the grid (the vertical and horizontal lines) around the results use `-s` (`--silent`). Columns are separated with a `TAB` character.
>
> ```sql
> mysql -s ...
> use testdb;
> select * from names;
> 
> id  name
> 1   pete
> 2   john
> 3   mike
> ```
>
> To output the data with no headers and no grid just use both `-s` and `-N`.
>
> ```sql
> mysql -sN ...
> ```





## 参考

1. [How can I suppress column header output for a single SQL statement?](https://stackoverflow.com/questions/16101495/how-can-i-suppress-column-header-output-for-a-single-sql-statement)