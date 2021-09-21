## SpringBoot 中使用 Filter

> [原文地址 --- **SpringBoot系列——Filter 过滤器**](https://www.cnblogs.com/huanzi-qch/p/11239167.html)



### 方法 A: `@WebFilter` & `@ServletComponentScan`

#### 步骤

1. 实现 `javax.servlet.Filter` 接口
2. 在 `Filter` 实现类上注解 `@javax.servlet.annotation.WebFilter`
3. 在 SpringBoot 启动类上注解 `@org.springframework.boot.web.servlet.ServletComponentScan`



#### 示例

- Filter 实现

  ```java
  package cn.huanzi.qch.springbootfilter.filter;
  
  import javax.servlet.*;
  import javax.servlet.annotation.WebFilter;
  import javax.servlet.http.HttpServletRequest;
  import javax.servlet.http.HttpServletResponse;
  import java.io.IOException;
  
  //配置拦截路径
  @WebFilter(filterName = "testFilter",urlPatterns = {"/test"})
  public class TestFilter implements Filter {
      @Override
      public void init(FilterConfig filterConfig) throws ServletException {
  
      }
  
      @Override
      public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
          HttpServletRequest request = (HttpServletRequest) servletRequest;
          HttpServletResponse response = (HttpServletResponse) servletResponse;
  
          System.out.println("TestFilter,"+request.getRequestURI());
  
          //执行
          filterChain.doFilter(servletRequest, servletResponse);
      }
  
      @Override
      public void destroy() {
  
      }
  }
  ```

- 启动类配置

  ```java
  package cn.huanzi.qch.springbootfilter;
  
  import org.springframework.boot.SpringApplication;
  import org.springframework.boot.autoconfigure.SpringBootApplication;
  import org.springframework.boot.web.servlet.ServletComponentScan;
  
  //自动扫描与当前类的同包以及子包
  @ServletComponentScan
  @SpringBootApplication
  public class SpringbootFilterApplication {
  
      public static void main(String[] args) {
          SpringApplication.run(SpringbootFilterApplication.class, args);
      }
  
  }
  ```

  



### 方法 B: 实现 Filter 接口 & `@Component`

#### 步骤

1. 实现 `javax.servlet.Filter` 接口
2. 在 `Filter` 实现类上注解 `@Component`

#### 示例

- Filter 实现

  ```java
  package cn.huanzi.qch.springbootfilter.filter;
  
  import org.springframework.stereotype.Component;
  
  import javax.servlet.*;
  import javax.servlet.http.HttpServletRequest;
  import javax.servlet.http.HttpServletResponse;
  import java.io.IOException;
  
  @Component
  public class TestFilter implements Filter {
      @Override
      public void init(FilterConfig filterConfig) throws ServletException {
  
      }
  
      @Override
      public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
          HttpServletRequest request = (HttpServletRequest) servletRequest;
          HttpServletResponse response = (HttpServletResponse) servletResponse;
  
          System.out.println("TestFilter,"+request.getRequestURI());
  
          //执行
          filterChain.doFilter(servletRequest, servletResponse);
      }
  
      @Override
      public void destroy() {
  
      }
  }
  ```



## 参考

1. [SpringBoot系列——Filter 过滤器](https://www.cnblogs.com/huanzi-qch/p/11239167.html)