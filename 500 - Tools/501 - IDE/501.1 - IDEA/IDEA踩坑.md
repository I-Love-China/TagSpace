## IDEA 踩坑

### 1. 开启方法断点后以 `debug` 方式启动项目速度很慢

> Debugger performance can be affected by the following:
>
> - **Method breakpoints** will slow down debugger a lot because of the JVM design, they are expensive to evaluate. Remove method breakpoints and consider using the regular line breakpoints. To verity that you don't have any method breakpoints open **.idea/workspace.xml** file in the project root directory (or **\<project>.iws** file if you are using the old project format) and look for any breakpoints inside the **method_breakpoints** node.
> - **Watch method return values** option is enabled in the Debugger Panel. Try disabling this option to improve the performance.
> - **Enable alternative views for Collections classes** and **Enable toString()’ object view** options enabled in **Settings** | **Debugger** | **Data Views**. If toString() methods take a long time to complete, disable this option. Note that custom toString() methods can also change the semantics of the application when running under debugger in case the code inside these methods changes the state of your application.
> - **Memory** tab in the debugger toolwindow. It is updated on every debugger stop, try to minimize it to improve stepping performance. ^[1]^




## 参考

1. [Java: slow performance or hangups when starting debugger and stepping]