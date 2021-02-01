## finally 效果/执行顺序

- [ ] TODO :smile: ^[1][2]^



## finally 是如何实现的 ^[3]^

1. 正常执行流之后会插入 `finally` 块中的字节码
2. 异常表中捕获所有类型的异常，跳转到 `finally` 块中

异常表中

> Compile this little program (I realized I should have used your example, but it makes no difference)
>
> ```java
> public static void main(String[] args) {
>     try {
>         Float s = Float.parseFloat("0.0327f");
>     } finally {
>         System.out.println("hello");
>     }
> }
> ```
>
> I used
>
> ```java
> >java -version 
> java version "1.8.0-ea"  // should be same for 7
> Java(TM) SE Runtime Environment (build 1.8.0-ea-b118)
> Java HotSpot(TM) 64-Bit Server VM (build 25.0-b60, mixed mode)
> ```
>
> And then execute
>
> ```java
> javac -v -c <fully qualified class name>
> ```
>
> to get the bytecode. You will see something like
>
> ```java
> public static void main(java.lang.String[]);
>   flags: ACC_PUBLIC, ACC_STATIC
>   Code:
>     stack=2, locals=3, args_size=1
>        0: ldc           #2                  // String 0.0327f
>        2: invokestatic  #3                  // Method java/lang/Float.parseFloat:(Ljava/lang/String;)F
>        5: invokestatic  #4                  // Method java/lang/Float.valueOf:(F)Ljava/lang/Float;
>        8: astore_1
>        9: getstatic     #5                  // Field java/lang/System.out:Ljava/io/PrintStream;
>       12: ldc           #6                  // String hello
>       14: invokevirtual #7                  // Method java/io/PrintStream.println:(Ljava/lang/String;)V
>       17: goto          31
>       20: astore_2
>       21: getstatic     #5                  // Field java/lang/System.out:Ljava/io/PrintStream;
>       24: ldc           #6                  // String hello
>       26: invokevirtual #7                  // Method java/io/PrintStream.println:(Ljava/lang/String;)V
>       29: aload_2
>       30: athrow
>       31: return
>     Exception table:
>        from    to  target type
>            0     9    20   any
>           20    21    20   any
>     LineNumberTable:
>       line 10: 0
>       line 12: 9
>       line 13: 17
>       line 12: 20
>       line 14: 31
>     StackMapTable: number_of_entries = 2
>          frame_type = 84 /* same_locals_1_stack_item */
>         stack = [ class java/lang/Throwable ]
>          frame_type = 10 /* same */
> ```
>
> You'll notice the **code inside the `finally` appears twice**, once before the `goto` and once after. You'll also notice the `Exception table` which specifies which statement to go to if an exception occurs at some line.
>
> ==So if any exception happens between statement 0-9, go to line 20 and execute the everything inside the `finally`==, after the `goto`. If no exception occurs, execute the `finally` and then execute the `goto` skipping the `finally` after the `goto`.
>
> In all cases you will have executed the code inside the `finally` block.
>
> > Other Exception not being explicitly handled
>
> ==With a `finally` block, an `Exception table` entry will be created that will handle **any** type of `Throwable`==.
>
> ------
>
> [Here's a listing of the bytecode instructions.](http://en.wikipedia.org/wiki/Java_bytecode_instruction_listings)



## 参考

1. [JAVA中try、catch、finally带return的执行顺序总结](https://www.cnblogs.com/pcheng/p/10968841.html)
2. [Java中try-catch-finally-return的执行顺序](https://www.jianshu.com/p/ebb13ac70f5d)
3. [How does the JVM guarantee execution of the finally block?](https://stackoverflow.com/questions/20963575/how-does-the-jvm-guarantee-execution-of-the-finally-block)