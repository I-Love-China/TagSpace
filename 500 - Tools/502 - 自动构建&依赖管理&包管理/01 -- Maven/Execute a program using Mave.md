## Execute a program using Maven

### What

> Execute system and Java programs.



### How

```bash
mvn clean install exec:java
    -Dexec.mainClass="com.logicbig.service.UiApplication"
```



### More

#### exec:exec


#### exec:java



## 参考

1. [Create Extensible Applications using Java ServiceLoader](https://www.logicbig.com/tutorials/core-java-tutorial/java-se-api/service-loader.html)
2. [Exec Maven Plugin -- exec:java](https://www.mojohaus.org/exec-maven-plugin/java-mojo.html)
3. [Exec Maven Plugin -- Usage](https://www.mojohaus.org/exec-maven-plugin/usage.html)

