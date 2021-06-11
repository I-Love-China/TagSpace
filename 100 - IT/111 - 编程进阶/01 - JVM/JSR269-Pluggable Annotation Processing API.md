## JSR269: Pluggable Annotation Processing API



### 概念 / What

> Annotation Processing" is a hook into the compile process of the java compiler, to analyse the source code for user defined annotations and handle then (by producing compiler errors, compiler warning, emitting source code, byte code ...) ^[7]^

> Provide an API to allow the processing of JSR 175 annotations (metadata); this will require modeling elements of the Java(TM) programming language as well as processing-specific functionality. ^[1]^



### 组成

1. an API that models the Java programming language, 
2. and an API for writing annotation processors.



### Annotation Processor 运行

#### 运行时机

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/jsr269-1.jpg)

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/jsr269-2.jpg)

#### Processor 实例化 & 运行步骤

> 1. If an existing `Processor` object is not being used, to create an instance of a processor the tool calls the no-arg constructor of the processor class.
> 2. Next, the tool calls the [`init`](https://docs.oracle.com/javase/8/docs/api/javax/annotation/processing/Processor.html#init-javax.annotation.processing.ProcessingEnvironment-) method with an appropriate `ProcessingEnvironment`.
> 3. Afterwards, the tool calls [`getSupportedAnnotationTypes`](https://docs.oracle.com/javase/8/docs/api/javax/annotation/processing/Processor.html#getSupportedAnnotationTypes--), [`getSupportedOptions`](https://docs.oracle.com/javase/8/docs/api/javax/annotation/processing/Processor.html#getSupportedOptions--), and [`getSupportedSourceVersion`](https://docs.oracle.com/javase/8/docs/api/javax/annotation/processing/Processor.html#getSupportedSourceVersion--). These methods are only called once per run, not on each round.
> 4. As appropriate, the tool calls the [`process`](https://docs.oracle.com/javase/8/docs/api/javax/annotation/processing/Processor.html#process-java.util.Set-javax.annotation.processing.RoundEnvironment-) method on the `Processor` object; a new `Processor` object is *not* created for each round.



> Annotation processing happens in a sequence of [rounds](https://docs.oracle.com/javase/8/docs/api/javax/annotation/processing/RoundEnvironment.html). On each round, a processor may be asked to [process](https://docs.oracle.com/javase/8/docs/api/javax/annotation/processing/Processor.html#process-java.util.Set-javax.annotation.processing.RoundEnvironment-) a subset of the annotations found on the source and class files produced by a prior round. The inputs to the first round of processing are the initial inputs to a run of the tool; these initial inputs can be regarded as the output of a virtual zeroth round of processing. ==If a processor was asked to process on a given round, it will be asked to process on subsequent rounds,== including the last round, even if there are no annotations for it to process. The tool infrastructure may also ask a processor to process files generated implicitly by the tool's operation.



### 自定义 Annotation Processor

#### I、实现 `javax.annotation.processing.AbstractProcessor`

- Each implementation of a `Processor` must provide a public ==no-argument constructor== to be used by tools to instantiate the processor.

#### II、注册自定义的 Annotation Processor

**a. `javac` `-processor` 参数指定**

> **-processor** *class1[,class2,class3...]*
>
> Names of the annotation processors to run. This bypasses the default discovery process. ^[6]^



**b. [SPI Pattern](https://en.wikipedia.org/wiki/Service_provider_interface)**

  **b.1 `META-INF/services/javax.annotation.processing.Processor` file **

> Instead of specifying the annotation processor in the compiler options, you may simply add a specially structured jar with the processor class to the classpath of the compiler.
>
> To pick it up automatically, the compiler has to know the name of the processor class. So you have to specify it in the *META-INF/services/javax.annotation.processing.Processor* file as a fully qualified class name of the processor ^[4]^



  **b.2 [Optional] Specify where to find annotation**

> **-processorpath** *path*
>
> Specify where to find annotation processors; if this option is not used, the class path will be searched for processors. ^[6]^





### JSR 269 应用

- [ lombok](https://github.com/projectlombok/lombok)
- [mapstruct](https://github.com/mapstruct/mapstruct)





## 参考

1. [JSR 269: Pluggable Annotation Processing API](https://jcp.org/en/jsr/detail?id=269)

2. [Interface Processor](https://docs.oracle.com/javase/8/docs/api/javax/annotation/processing/Processor.html)

3. [Annotation Processing Tool (apt)](https://docs.oracle.com/javase/6/docs/technotes/guides/apt/index.html)

4. [Java Annotation Processing and Creating a Builder](https://www.baeldung.com/java-annotation-processing-builder#3a322b82-a59a-b377-14b7-acb50a0abd03)

5. [Ten minutes to understand the use and principle of Lombok](https://programmer.help/blogs/ten-minutes-to-understand-the-use-and-principle-of-lombok.html)

6. [javac - Java programming language compiler](https://docs.oracle.com/javase/7/docs/technotes/tools/solaris/javac.html)

7. [What is annotation processing in Java?](https://stackoverflow.com/questions/2146104/what-is-annotation-processing-in-java)

