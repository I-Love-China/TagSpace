## Transactional annotation on whole class + excluding a single method



### 问题

> I have a class with `@Transactional` annotation (instead of marking it for all of its method).
>
> Although i have a single method inside that class that shouldn't be annotated as `@Transactional`.
>
> My question is is there an annotation i can put in this method to mark it as "non-transactional"? or should i start marking each single method in this class as "transactional" excluding this method (a lot of work)
>



### 解决方法

> There are different transaction propagation strategies to use. These exist in the enum `Propagation`. The ones you might want to use are
>
> ```php
> /**
>  * Execute non-transactionally, suspend the current transaction if one exists.
>  * Analogous to EJB transaction attribute of the same name.
>  * <p>Note: Actual transaction suspension will not work on out-of-the-box
>  * on all transaction managers. This in particular applies to JtaTransactionManager,
>  * which requires the {@code javax.transaction.TransactionManager} to be
>  * made available it to it (which is server-specific in standard J2EE).
>  * @see org.springframework.transaction.jta.JtaTransactionManager#setTransactionManager
>  */
> NOT_SUPPORTED(TransactionDefinition.PROPAGATION_NOT_SUPPORTED),
> 
> /**
>  * Execute non-transactionally, throw an exception if a transaction exists.
>  * Analogous to EJB transaction attribute of the same name.
>  */
> NEVER(TransactionDefinition.PROPAGATION_NEVER), // maybe not this one
> ```
>
> So annotate the method inside your class with either of these.
>
> ```java
> @Transactional
> public class MyTransactionalClass { 
>     @Transactional(propagation = Propagation.NOT_SUPPORTED)
>     public void nonTransactionalMethod() {...}
> }
> ```
>
> You can find all the propagation strategies [here](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/transaction/annotation/Propagation.html).





## 参考

1. [Transactional annotation on whole class + excluding a single method](https://stackoverflow.com/questions/18233171/transactional-annotation-on-whole-class-excluding-a-single-method)