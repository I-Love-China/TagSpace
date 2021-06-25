

## CPU: Finding which Java threads are consuming your CPU

> [**原文链接**](http://www.mastertheboss.com/jboss-server/jboss-monitoring/finding-which-java-threads-are-consuming-your-cpu)



### 方法 A: VisualVM

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/jvm_thread_cpu_usage_visualvm_20210625104607.png)



### 方法 B: `top` command with `-H` option

```bash
top -n 1 -H -p 23408
```

> Please notice we are using the **-H option** (Threads toggle). When this toggle is On, ==all individual threads== will be displayed. Otherwise, top displays a summation of all threads in a process.



![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/jvm_thread_cpu_usage_top_20210625105537.png)



### 方法 C: [jvmtop](https://github.com/patric-r/jvmtop) 

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/jvm_thread_cpu_usage_jvmtop_20210625105852.png)



### 方法 D / 原理: Programmatically find which Thread is consuming your CPU

```java
ThreadMXBean tmxb = ManagementFactory.getThreadMXBean();

// Then you can query how much a specific thread is consuming by using:

long cpuTime = tmxb.getThreadCpuTime(aThreadID);
```







## 参考

1. [Finding which Java threads are consuming your CPU](http://www.mastertheboss.com/jboss-server/jboss-monitoring/finding-which-java-threads-are-consuming-your-cpu)