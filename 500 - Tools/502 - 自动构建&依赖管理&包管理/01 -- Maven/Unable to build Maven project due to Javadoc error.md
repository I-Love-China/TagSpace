## Unable to build Maven project due to Javadoc error?

### 问题现象


![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/maven.javadoc.error-1.png)

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/maven.javadoc.error.20211102103216.png)



### 问题原因

> I'm guessing you switched to Java 8. In this version Javadoc is stricter on the requirements.^[1]^



### 解决方法

#### a. Fix the errors ^[1]^

修改代码中 javadoc 上的标签



#### b. Disable the strict checking

**b.a. Add this to your `pom.xml` ^[1]^**

```xml
<plugins>
  <plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-javadoc-plugin</artifactId>
    <configuration>
      <additionalparam>-Xdoclint:none</additionalparam>
    </configuration>
  </plugin>
</plugins>
```



**b.b. 命令行传入对应参数以关闭严格检查 ^[2]^**

```bash
mvn clean deploy -Ddoclint=none
```



#### c. Skip Javadoc when building ^[1]^

```bash
mvn clean deploy -Dmaven.javadoc.skip=true
```



## 参考

1. [Unable to build Maven project due to Javadoc error?](https://stackoverflow.com/questions/23542876/unable-to-build-maven-project-due-to-javadoc-error)
2. [javadoc-mojo#doclint](https://maven.apache.org/plugins/maven-javadoc-plugin/javadoc-mojo.html#doclint)

