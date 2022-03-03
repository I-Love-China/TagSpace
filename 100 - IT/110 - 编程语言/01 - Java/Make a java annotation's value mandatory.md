## Make a java annotation's value mandatory

### 问题描述

> Java allows the definition of values in annotations, for example:
>
> ```java
> public @interface MyAnnotation {
>     int MyValue();
> }
> ```
>
> Although it is possible to set a default value for the `MyValue` annotation, I was wondering whether it is possible to make it mandatory. What I mean is forcing the user to provide a value for `MyValue` when annotating a class or field. ^[1]^



### 答案

> If you do not specify a default value, it is mandatory. For your example using your annotation without using the `MyValue` attribute generates this compiler error:
>
> > annotation MyAnnotation is missing MyValue ^[1]^



## 参考

1. [Is it possible to make a Java annotation's value mandatory?](https://stackoverflow.com/questions/7070251/is-it-possible-to-make-a-java-annotations-value-mandatory)