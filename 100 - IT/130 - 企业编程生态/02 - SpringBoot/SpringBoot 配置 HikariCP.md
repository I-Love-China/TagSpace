## SpringBoot 配置 HikariCP

### 示例

```xml
<!-- pom.xml -->
<dependency>
  <groupId>com.zaxxer</groupId>
  <artifactId>HikariCP</artifactId>
  <version>3.4.1</version>
</dependency>
```

==注意 URL 在 `datasource.url` 中配置，而不是在 `hikari.jdbc-url` 中配置==

```yaml
# application.yml

spring:
  datasource:
    
    driver-class-name: com.mysql.jdbc.Driver
    url: jdbc:mysql://192.168.1.21:3306/test?useSSL=false&useUnicode=true&characterEncoding=utf8&autoReconnect=true&failOverReadOnly=false&allowMutiQueries=true
    username: user
    password: 123456
    
    hikari:
      maximum-pool-size: 50  # 池中最大连接数，包括闲置和使用中的连接
      minimum-idle: 5
      idle-timeout: 600000   # 连接允许在池中闲置的最长时间，单位: 毫秒
    
```





## 参考
1. [HikariCP连接池及其在springboot中的配置](https://www.cnblogs.com/chenziyu/p/10270778.html)