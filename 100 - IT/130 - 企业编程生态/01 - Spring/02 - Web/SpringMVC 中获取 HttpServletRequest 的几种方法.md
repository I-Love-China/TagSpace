## SpringMVC 中获取 HttpServletRequest 的几种方法

> [原文地址 -- Spring中获取request的几种方法，及其线程安全性分析](https://www.cnblogs.com/kismetv/p/8757260.html)



### 方法 A: Controller 中加参数

```java
@Controller
public class TestController {
    @RequestMapping("/test")
    public void test(HttpServletRequest request) throws InterruptedException {
        // 模拟程序执行了一段时间
        Thread.sleep(1000);
    }
}
```





### 方法 B: 自动注入

```java
@Controller
public class TestController{
     
    @Autowired
    private HttpServletRequest request; //自动注入request
     
    @RequestMapping("/test")
    public void test() throws InterruptedException{
        //模拟程序执行了一段时间
        Thread.sleep(1000);
    }
}
```



### 方法 C: 通过 `RequestContextHolder` 获取

```java
@Controller
public class TestController {
    @RequestMapping("/test")
    public void test() throws InterruptedException {
        HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
        // 模拟程序执行了一段时间
        Thread.sleep(1000);
    }
}
```





## 参考

1. [Spring中获取request的几种方法，及其线程安全性分析](https://www.cnblogs.com/kismetv/p/8757260.html)