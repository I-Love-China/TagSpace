### SpringBoot 项目启动时指定 classpath ^[1]^
### 背景
> However, -classpath and -jar cannot co-exist. 

### 方法
#### 方法1: loader.path
```
java -Dloader.path="your-lib/" -jar your-app.jar
```

#### 方法2
```
# 注意后面还带了个 class
java -cp bootApp.jar -Dloader.main=org.khan.DemoApplication  org.springframework.boot.loader.PropertiesLauncher
```

### 参考
1. [Spring Boot Executable Jar with Classpath](https://stackoverflow.com/questions/39716796/spring-boot-executable-jar-with-classpath)