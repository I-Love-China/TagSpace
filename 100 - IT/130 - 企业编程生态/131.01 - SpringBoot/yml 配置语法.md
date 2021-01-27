## yml 配置语法

### List 配置

#### 语法 ^[1]^

> The elements in a YAML list are defined using the “-” character and they all share the same indentation level:

```yaml
list:
  - item1
  - item2
  - item3
```

>  As a comparison, the properties-based equivalent uses indices:

```java
yamlconfig.list[0]=item1
yamlconfig.list[1]=item2
yamlconfig.list[2]=item3
yamlconfig.list[3]=item4
```

### ==List\<Map>、List\<Entity> 配置==

#### 语法 ^[1]^

```yaml
application:
  // ...
  props: 
    -
      name: YamlList
      url: http://yamllist.dev
      description: Mapping list in Yaml to list of objects in Spring Boot
    -
      ip: 10.10.10.10
      port: 8091
    -
      email: support@yamllist.dev
      contact: http://yamllist.dev/contact
  users:
    -
      username: admin
      password: admin@10@
      roles:
        - READ
        - WRITE
        - VIEW
        - DELETE
    -
      username: guest
      password: guest@01
      roles:
        - VIEW
```

对应的 Java 配置类

```java
public class ApplicationProps {
    // ...
    private List<Map<String, Object>> props;
    private List<User> users;
    
    // getters and setters

    public static class User {
        private String username;
        private String password;
        private List<String> roles;

        // getters and setters
    }
}
```



## 参考
1. [YAML to List of Objects in Spring Boot](https://www.baeldung.com/spring-boot-yaml-list)
