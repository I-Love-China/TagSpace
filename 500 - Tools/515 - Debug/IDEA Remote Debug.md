## IDEA Remote Debug



### Prerequisition

1. > the app is compiled with **debug information**
   >
   > This is the default compiler setting and must not be overridden. Otherwise, most of the debugger functionality will be unavailable. ^[1]^
   
   >`javac` **-g** option
   > 
   >Generate all debugging information, including local variables. By default, only line number and source file information is generated. ^[2]^

  

2. >  you have the **source code** of the application. 
   >
   > While it is possible to use decompiled code for debugging, it is more complicated and not covered in this tutorial. ^[1]^



### 方法 / 步骤

#### I、启动应用并开放 JDWP 服务

```bash
java -jar \
     -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8084 \
     Application.jar
```

> - ***transport*** is the only fully required option. It defines which transport mechanism to use. `dt_shmem` only works on Windows and if both processes run on the same machine while `dt_socket` is compatible with all platforms and allows the processes to run on different machines
> - ***server*** is not a mandatory option. This flag, when on, defines the way it attaches to the debugger. It either exposes the process through the address defined in the *address* option. Otherwise, JDWP exposes a default one
> - ***suspend*** defines whether the JVM should suspend and wait for a debugger to attach or not
> - ***address*** is the option containing the address, generally a port, exposed by the debuggee. It can also represent an address translated as a string of characters (like *javadebug* if we use *server=y* without providing an *address* on Windows) ^[3]^



![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/idea_remote_debug_debugee_20210715183631.png)



#### II、IDEA attach 目标 JVM

> 1. From the main menu, select **Run | Edit Configurations** or press Alt+Shift+F10 then 0.
> 2. In the **Run/Debug Configurations** dialog, click the **Add New Configuration** button ![Icons general add](https://resources.jetbrains.com/help/img/idea/2021.1/icons.general.add.svg) and select **Remote**. ^[1]^



![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/idea_remote_debug_debugger_20210715184138.png)





## 参考

1. [Tutorial: Remote debug](https://www.jetbrains.com/help/idea/tutorial-remote-debug.html)
2. [javac - Java programming language compiler](https://docs.oracle.com/javase/7/docs/technotes/tools/windows/javac.html)
3. [Java Application Remote Debugging](https://www.baeldung.com/java-application-remote-debugging)