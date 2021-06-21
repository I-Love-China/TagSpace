## CopyOnWrite 容器



### 介绍 / 工作原理

1. >  最终一致性容器 ^[1]^

2. >  往容器添加元素的时候，==不直接往当前容器添加，而是先将当前容器进行Copy，复制出一个新的容器，然后新的容器里添加元素，添加完元素之后，再将原容器的引用指向新的容器== ^[1]^

3. >  好处是我们可以对CopyOnWrite容器进行==并发的读，而不需要加锁== ^[1]^



### 特点

1. > Using CopyOnWriteArrayList is ==costly for update operations==, because each mutation creates a cloned copy of underlying array and add/update element to it. ^[2]^

2. > It is thread-safe version of ArrayList. Each thread accessing the list sees its own version of ==snapshot== of backing array created while initializing the iterator for this list. ^[2]^

3. > Mutation operations on ==iterators== (remove, set, and add) are not supported. These methods throw `UnsupportedOperationException`. ^[2]^

4. > Because it creates a new copy of array everytime iterator is created, **performance is slower** than ArrayList. ^[2]^





### 适用场景

1/2.  读多写少

>  CopyOnWrite并发容器用于对于绝大部分访问都是读，且只是偶尔写的并发场景 ^[1]^



2/2.  不需要实时读的场景

  > 不适合于数据的强一致性场合。若要求数据修改之后立即能被读到，则不能用写时复制技术 ^[3]^



### 实践

1. 减少扩容开销
   
   > 根据实际需要，初始化CopyOnWriteMap的大小，避免写时CopyOnWriteMap扩容的开销 ^[1]^
   
2. 使用批量添加
   
   >  因为每次添加，容器每次都会进行复制，所以减少添加次数，可以减少容器的复制次数 ^[1]^



### Java 中的 CopyOnWrite 容器实现

1. ```java.util.concurrent.CopyOnWriteArrayList```
2. ```java.util.concurrent.CopyOnWriteArraySet```





## 参考

1. [写时复制容器CopyOnWrite](https://www.yuque.com/zjj1994/javabasic/kczd0d)

2. [Java CopyOnWriteArrayList class](https://howtodoinjava.com/java/collections/java-copyonwritearraylist/)

3. [JAVA中写时复制Copy-On-Write](https://www.yuque.com/fcant/java/tzctxv)

