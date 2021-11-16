## Spring classpath prefix difference



### 问题

> What is the difference between using `classpath*:conf/appContext.xml` as opposed to `classpath:conf/appContext.xml` without the asterisk.



### 解答

> **SIMPLE DEFINITION**
>
> The `classpath*:conf/appContext.xml` simply means that **all appContext.xml files** under `conf` folders in all your jars on the classpath will be picked up and joined into one big application context.
>
> In contrast, `classpath:conf/appContext.xml` will load **only one such file**... the first one found on your classpath.





## 参考

1. [Spring classpath prefix difference](https://stackoverflow.com/questions/3294423/spring-classpath-prefix-difference)