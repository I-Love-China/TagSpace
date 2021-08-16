## Difference between `instanceof` and `Class.isAssignableFrom()`



### 区别

1. 编译期 or 运行时

   > When using `instanceof`, you need to know the class of `B` at compile time. When using `isAssignableFrom()` it can be dynamic and change during runtime. ^[1]^

   

2. `instanceof` can only be used with reference types, not primitive types. `isAssignableFrom()` can be used with any class objects:

   ```java
   a instanceof int  // syntax error
   3 instanceof Foo  // syntax error
   int.class.isAssignableFrom(int.class)  // true
   ```

   



## 参考

1. [What is the difference between instanceof and Class.isAssignableFrom(…)?](https://stackoverflow.com/questions/496928/what-is-the-difference-between-instanceof-and-class-isassignablefrom)