## Debugger 基础工作原理

### 前言: Java Platform Debugger Architecture

#### JDPA 是什么/作用 ^[1]^

JPDA 是设计用于 `debugger` 、`debuggee` 之间的通信，它包含 3 个组件

#### JPDA 组成

##### 1. JVM Tool Interface(JVM TI)
> A native interface which defines the services a VM must provide for debugging purposes ^[1]^

一个原生接口，定义了 JVM 必须提供的用于调试的服务

> The JVM tool interface (JVM TI) is a native programming interface for use by tools. It provides both a way to ==inspect the state== and to ==control the execution of applications== running in the Java virtual machine (JVM). ^[2]^

>  JVM TI supports the full breadth of tools that need access to JVM state, including but not limited to: profiling, debugging, monitoring, thread analysis, and coverage analysis tools ^[2]^



##### 2. Java Debug Wire Protocol(JDWP)
> A textual API which defines the communication's protocol between `debuggee` and `debugger`^[1]^

一个文本类型的 API，定义了 `debuggee` 和 `debugger` 之间的通信协议

> The Java™ Debug Wire Protocol (JDWP) is the protocol used for communication between a debugger and the Java virtual machine (VM) which it debugs (hereafter called the target VM). ^[3]^

>  ==JDWP is optional==; it might not be available in some implementations of the Java(TM) 2 SDK. 



##### 3. Java Debug Interface(JDI)
> Defines a high-level Java API designed to facilitate the interaction between `debuggee` and `debuggers`.
> Internally JDI implements the `JDWP protocol` ^[1]^

> The Java™ Debug Interface (JDI) is a high level Java API providing information useful for debuggers and similar systems needing access to the running state of a (usually remote) virtual machine.^[4]^

定义了一个高层次的 API，这个 API 用于促进 `debugger` 和 `debuggee` 之间的交互



#### JPDA 组件之间的交互

![JavaPlatformDebuggerArchitecture](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/JavaPlatformDebuggerArchitecture.png)

1. > The `VM` expose JVMTI capabilities to its `Agent`(==back-end-layer==)
2. > The `Agent` lives inside `VM's` process
3. > The `Agent` communicates with the `VM` with ==callbacks(via JNI)==
4. > Whenever something interesting happens the VM fires a callback to the Agent which in turn send the event back to the `debugger` (==front-end layer==), our IDE, in most of the cases
5. > The `debugger` can communicate with the `Agent` via raw JDWP or via JDI.

- debug 模式启动参数
  ![debug 模式启动参数](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/jvm_input_args_debug.png)
- 非 debug 模式启动参数
    ![非 debug 模式启动参数](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/jvm_input_arguments_nondebug.png)

### 断点是如何工作的

> Whenever you set a Breakpoint, step into your code, read and alter variables' values, you are triggering a chain of events directed to your VM. ^[1]^



### JVM TI 设置断点的方法/步骤

#### I、Enable Breakpoint Events

JVM 允许 `debuggers`通过 `Agent` 启用不同事件

> enable the `can_generate_breakpoint_events` event via the `setEventNotificationMode()` method ^[1]^



#### II、Registering A Breakpoint

JVM 提供了在指定字节码指令位置注册断点事件的接口，

```c
SetBreakpoint(jvmtiEnv* env, 
			  jmethodID method, 
              jlocation location)
```

现在，当有一个线程执行到了对应行的指令时，JVM 将产生一个断点事件，并且停止所有活动线程的执行流



#### III、Breakpoint Event 数据结构

```c
Breakpoint(jvmtiEnv *jvmti_env,
           JNIEnv* jni_env,
           jthread thread,
           jmethodID method,
           jlocation location)
```



### 方法断点

#### 方法断点的实现原理

方法断点并不是 JPDA 提供的特性，而是 IDE 的

##### 启用方法断点相关的事件: 
- `can_generate_method_entry_events` 
- `can_generate_method_exit_events`



```
MethodEntry(jvmtiEnv *jvmti_env,
            jNIEnv* jni_env,
            jthread thread,
            jmethodID method)
```

```
MethodExit(jvmtiEnv *jvmti_env,
           JNIEnv* jni_env,
           jthread thread,
           jmethodID method,
           jboolean was_popped_by_exception,
           jvalue return_value)
```

##### 启用之后的效果

Once done, the VM will fire events when ==any thread== enters or exit ==any method==. ^[1]^

When registered, events are fired on each method ==twice== on entering and exiting. ^[1]^

#### IDE 方法断点的实现

> 1. IDE adds the Breakpoints to ==its internal list== of Method Breakpoints
> 2. IDE tells the front-end to enable Method Entry and Method Exit events
> 3. front-end (the Debugger) communicates the request to the VM through the Agent
> 4. On each Method Entry and Method Exit event a notification is forwarded through the entire chain to the IDE
> 5. The IDE checks whether its Method Breakpoint's list contains the method id which just fired the Method Entry event
> 6. ==If #5 is found to be true then the IDE will send a SetBreakpoint request to the VM==, otherwise, VM's thread will be released and nothing will happen ^[1]^



#### 方法断点会极大地影响 `debugger` 的性能

##### 1. jmethodid 的 `lookup` 过程耗性能

```c
MethodEntry(jvmtiEnv *jvmti_env,
            jNIEnv* jni_env,
            jthread thread,
            jmethodID method)
```

> It figures out that when the VM needs to retrieve a jmethodid it needs to perform an ==expensive== lookup. 

##### 2. `Agent` 和 `Debugger` 之间的大量通信消耗时间

> Furthermore, in case of ==remote debugging==, communication can turn to a severe I/O penalty. ^[1]^

##### 3. VM's callbacks are synchronous

> As already explained, once the Agent registers itself to VM's events (as specified by JVMTI specification), the VM will notify the Agent via callbacks.
> These callbacks are fired from the same thread which triggered the event. VM's thread needs to ==wait== for the following:
>
> - Context switch - Agent must now take control and send a notification to the Debugger
> - Method Breakpoint Validation - The Debugger needs to check whether the jmethodid related the MethodEntry or MethodExit events matches a jmethodid registered to be breaked.
>
> During this period of time code execution is stopped. ^[1]^



## 参考

1. [Method Breakpoints are Evil](https://www.smartik.net/2017/11/method-breakpoints-are-evil.html)
2. [Java Virtual Machine Tool Interface (JVM TI)](https://docs.oracle.com/javase/8/docs/technotes/guides/jvmti/)
3. [Java™ Debug Wire Protocol](https://docs.oracle.com/javase/7/docs/technotes/guides/jpda/jdwp-spec.html)
4. [Java™ Debug Interface](https://docs.oracle.com/javase/8/docs/jdk/api/jpda/jdi/)
