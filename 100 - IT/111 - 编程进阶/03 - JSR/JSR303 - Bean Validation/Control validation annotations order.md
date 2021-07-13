## Control validation annotations order

### 背景

```java
public class User {
    @Pattern(regExp = "^[a-z]+$")
    @Length(min=3,max=100)
    private String firstName;
}
```



### 需求

控制 `@Pattern`、`@Length` …… 对应 validator 的执行顺序



### 实现方法: Use JSR-303 validation groups.

#### I、定义 validation group 类

```java
public interface First {}

public interface Second {}
```



#### II、使用 group

```java
public class User {
    @org.hibernate.validator.constraints.Pattern(regExp = "^[a-z]+$", groups = {Default.class, Second.class})
    @org.hibernate.validator.constraints.Length(min=3,max=100, groups = {Default.class, First.class})
    private String firstName;
}
```



#### III、定义 GroupSequence

```java
@javax.validation.GroupSequence({First.java, Second.class})
public interface Ordered {}

@javax.validation.GroupSequence({Second.java, First.class})
public interface Inverted {}
```



#### IV、校验时使用对应 GroupSequence

```java
validator.validate(user, Ordered.class);
```





## 参考

1. [Control validation annotations order](https://stackoverflow.com/questions/5571231/control-validation-annotations-order)