## 各种参数默认值

###  -Xms

   > **Parallel Garbage Collector**
   >
   > Larger of 1/64th of the machine's physical memory on the machine or some reasonable minimum.
   >
   > You can override this default using the `-Xms` command-line option. ^[1]^

> ```bash
> java -XX:+PrintFlagsFinal -version | grep InitialHeapSize
> ```
>
> ^[2]^

   

### -Xmx

   > **Parallel Garbage Collector**
   > Smaller of 1/4th of the physical memory or 1GB. 
   >
   > Before Java SE 5.0, the default maximum heap size was 64MB. 
   >
   > You can override this default using the `-Xmx` command-line option. ^[1]^

> ```bash
> java -XX:+PrintFlagsFinal -version | grep MaxHeapSize
> ```
>
> ^[2]^





## 参考

1. [Garbage Collector Ergonomics](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gc-ergonomics.html)

2. [How is the default max Java heap size determined?](https://stackoverflow.com/questions/4667483/how-is-the-default-max-java-heap-size-determined)