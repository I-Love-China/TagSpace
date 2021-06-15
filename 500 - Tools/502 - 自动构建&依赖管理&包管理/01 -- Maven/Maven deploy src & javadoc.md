## Maven deploy src & javadoc

### 背景

> I want to deploy sources and javadocs with my snapshots.  ^[1]^



### 方法

```xml
<build>
  <plugins> 
    <plugin>
      <artifactId>maven-source-plugin</artifactId>
      <executions>
        <execution>
          <id>attach-sources</id>
          <phase>deploy</phase>
          <goals><goal>jar-no-fork</goal></goals> 
        </execution>
      </executions>
    </plugin>
    <plugin> 
      <artifactId>maven-javadoc-plugin</artifactId> 
      <executions> 
        <execution> 
          <id>attach-javadocs</id>
          <phase>deploy</phase>
          <goals><goal>jar</goal></goals> 
        </execution> 
      </executions> 
    </plugin>
    <plugin> 
      <!-- explicitly define maven-deploy-plugin after other to force exec order -->
      <artifactId>maven-deploy-plugin</artifactId> 
      <executions> 
        <execution> 
          <id>deploy</id>
          <phase>deploy</phase>
          <goals><goal>deploy</goal></goals> 
        </execution> 
      </executions> 
    </plugin>
  </plugins> 
</build>
```





## 参考

1. [How to deploy SNAPSHOT with sources and JavaDoc?](https://stackoverflow.com/questions/4725668/how-to-deploy-snapshot-with-sources-and-javadoc)