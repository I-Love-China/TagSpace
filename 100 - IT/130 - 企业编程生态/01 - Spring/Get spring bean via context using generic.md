## Get spring bean via context using generic

> [**原文地址 -- Get spring bean via context using generic**](https://stackoverflow.com/questions/30374267/get-spring-bean-via-context-using-generic)



### 背景 / What

从 `ApplicationContext` 中获取泛型 `bean`



### How

```java
String[] beanNamesForType = ctx.getBeanNamesForType(ResolvableType.forClassWithGenerics(Repository.class, node.getClass()));

// If you expect several beans of the same generic type then extract them as you wish. Otherwise, just take the first
Repository<T> repository = (Repository<T>) ctx.getBean(beanNamesForType[0]);
```



## 参考

1. [Get spring bean via context using generic](https://stackoverflow.com/questions/30374267/get-spring-bean-via-context-using-generic)
