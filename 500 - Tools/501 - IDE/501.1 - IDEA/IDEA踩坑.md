## IDEA 踩坑

### 1. 开启方法断点后以 `debug` 方式启动项目速度很慢

> Debugger performance can be affected by the following:
>
> - **Method breakpoints** will slow down debugger a lot because of the JVM design, they are expensive to evaluate. Remove method breakpoints and consider using the regular line breakpoints. To verity that you don't have any method breakpoints open **.idea/workspace.xml** file in the project root directory (or **\<project>.iws** file if you are using the old project format) and look for any breakpoints inside the **method_breakpoints** node.
> - **Watch method return values** option is enabled in the Debugger Panel. Try disabling this option to improve the performance.
> - **Enable alternative views for Collections classes** and **Enable toString()’ object view** options enabled in **Settings** | **Debugger** | **Data Views**. If toString() methods take a long time to complete, disable this option. Note that custom toString() methods can also change the semantics of the application when running under debugger in case the code inside these methods changes the state of your application.
> - **Memory** tab in the debugger toolwindow. It is updated on every debugger stop, try to minimize it to improve stepping performance. ^[1]^



### 2. 使 IDEA 总是以新窗口的方式打开新项目
**问题:**
​        默认情况下，IDEA 打开新项目时会询问 “当前窗口打开”、“新窗口打开”，而选择 “新窗口打开” 并不会保证每次都会开一个新窗口，而是会在当前窗口打开新项目

**解决方法:**

> In Intellij 2018 it is `File --> Settings --> Appearance & Behavior --> System Settings`.
>
> In System Settings you'll see a radio button for `Open project in new window`^[2]^


### 3. 启动 SpringBoot 项目报错 ` Command line is too long.`

**问题:**

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/springboot_cmd_line_too_long_20210303181124.png)

**解决方法:^[3]^**

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/springboot_cmd_too_long_solution_17890732-4e5f0024a6030a15.png)

## 参考

1. [Java: slow performance or hangups when starting debugger and stepping](https://intellij-support.jetbrains.com/hc/en-us/articles/206544799-Java-slow-performance-or-hangups-when-starting-debugger-and-stepping#:~:text=Java%3A%20slow%20performance%20or%20hangups%20when%20starting%20debugger%20and%20stepping%20Follow&text=Debugger%20performance%20can%20be%20affected,using%20the%20regular%20line%20breakpoints.)
2. [How do I open a new window](https://intellij-support.jetbrains.com/hc/en-us/community/posts/206372659-How-do-I-open-a-new-window)
3. [idea报错：Error running 'XXX': Command line is too long. Shorten command line for xxxApplication or ...](https://www.jianshu.com/p/68d1a6bd2cc3)