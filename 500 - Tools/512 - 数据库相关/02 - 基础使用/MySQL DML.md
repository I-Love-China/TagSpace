## MySQL DML



### Delete with Join in MySQL ^[1]^

> Since you are selecting multiple tables, The table to delete from is no longer unambiguous. You need to *select*:
>
> ```sql
> DELETE posts FROM posts
> INNER JOIN projects ON projects.project_id = posts.project_id
> WHERE projects.client_id = :client_id
> ```
>
> In this case, `table_name1` and `table_name2` are the same table, so this will work:
>
> ```sql
> DELETE projects FROM posts INNER JOIN [...]
> ```
>
> You can even delete from both tables if you wanted to:
>
> ```sql
> DELETE posts, projects FROM posts INNER JOIN [...]
> ```
>
> Note that `order by` and `limit` [don't work for multi-table deletes](http://dev.mysql.com/doc/refman/5.7/en/delete.html).
>
> Also be aware that if you declare an alias for a table, you must use the alias when referring to the table:
>
> ```sql
> DELETE p FROM posts as p INNER JOIN [...]
> ```





## 参考

1. [Delete with Join in MySQL](https://stackoverflow.com/questions/652770/delete-with-join-in-mysql)