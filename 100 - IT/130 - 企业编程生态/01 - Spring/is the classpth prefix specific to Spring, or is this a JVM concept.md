## Is the "classpath:" prefix specific to Spring, or is this a JVM concept?



### 问题

> I have this in my web.xml:
>
> ```java
> <context-param>
>      <param-name>contextConfigLocation</param-name>
>      <param-value>classpath:spring-config.xml</param-value>
> </context-param>
> ```
>
> I suspect this is a convention used only by Spring? If it is, will it take my app longer to load, since I'm not specifying a direct file location, but now it must search the entire classpath?



### 解答

> > I suspect this is a convention used only by Spring?
>
> ==Yes==, it stands for a [`ClassPathResource`](http://static.springsource.org/spring/docs/3.0.x/spring-framework-reference/html/resources.html#resources-implementations-classpathresource) and is part of [Spring's `Resource` abstraction](http://static.springsource.org/spring/docs/3.0.x/spring-framework-reference/html/resources.html)
>
> > If it is, will it take my app longer to load, since I'm not specifying a direct file location, but now it must search the entire classpath?
>
> No, 
>
> a) it uses the ClassLoader internally which should be fast enough. 
>
> b) you don't really have much of a choice. using files is a very bad idea in a webapp context, because it makes you dependent on implementation details that should be left to the implementing App server (a WAR may or may not be unpacked).



## 参考

1. [Is the "classpath:" prefix specific to Spring, or is this a JVM concept?](https://stackoverflow.com/questions/6346639/is-the-classpath-prefix-specific-to-spring-or-is-this-a-jvm-concept)