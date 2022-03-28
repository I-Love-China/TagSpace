## difference between UNION and UNION ALL

> UNION and UNION ALL are SQL operators used to concatenate 2 or more result sets. This allows us to write multiple SELECT statements, retrieve the desired results, then combine them together into a final, unified set.



**The main difference between UNION and UNION ALL is that:**

> - **UNION:** only keeps *unique* records
> - **UNION ALL:** keeps all records, including *duplicates*
>
> 
>
> UNION first performs a sorting operation and eliminates of the records that are duplicated across all columns before finally returning the combined data set.



**UNION or UNION ALL have the same basic requirements of the data being combined:**

> 1. There must be the same number of columns retrieved in each SELECT statement to be combined.
> 2. The columns retrieved must be in the same order in each SELECT statement.
> 3. The columns retrieved must be of similar data types.



## 参考

1. [What is the difference between UNION and UNION ALL](https://dataschool.com/learn-sql/what-is-the-difference-between-union-and-union-all/)