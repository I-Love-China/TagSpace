## Wrapper Design Patterns

> - A Wrapper class "wraps" an object of another class. ==It is used to implement a design pattern that has an instance of an object and presents its own interface or behavior to that object, without changing the original class (this is the key point!)==. These patterns demonstrate delegation.
>
> ​       There are ==a number of== design patterns that can be considered Wrappers:
>
> - - Adapter - An Adapter translates the interface of one class to match another. It allows an object that implements a set of features to be used with software that expects a different interface, without changing the code for the original class. The Adapter class has an instance of the the class being adapted (the Adaptee). It implements its own set of methods that then call the methods in the Adaptee. It is often used to wrap a legacy class (i.e. old) that is targeted for future replacement.
>
> - - Proxy - the Proxy pattern controls access to an object (the Real Object). The Proxy implements the same interface as the Real Object, but may add additional behavior, such as security checks, before calling the methods in the the Real Object.
>
> - - Decorator - a Decorator augments the behavior of an existing class. It has the same super class as the decorated class (and sometimes extends the decorated class). When the method is called with the decorator, it then calls the methods in the decorated class and further processes the results. It is both "isa" Decorated class and "hasa" Decorated class.
>
> Java has these wrapper-classes as decorators: [Synchronization Wrappers](http://docs.oracle.com/javase/tutorial/collections/implementations/wrapper.html). **Note**: do NOT use these in your Project code; you must code the multithreading yourself.
>
> This is a great book on Design Patterns: [Head First Design Patterns](http://shop.oreilly.com/product/9780596007126.do)
>
> Here is the chapter on Decorators (old, broken link): http://oreilly.com/catalog/hfdesignpat/chapter/ch03.pdf
>
> Decent online References:
>
> http://sourcemaking.com/design_patterns/adapter
> http://java.dzone.com/articles/design-patterns-uncovered-0[
> https://dzone.com/refcardz/design-patterns](https://dzone.com/refcardz/design-patterns)
> http://sourcemaking.com/design_patterns/proxy/java/1
> http://java.dzone.com/articles/design-patterns-proxy
> http://stackoverflow.com/questions/350404/how-do-the-proxy-decorator-adapter-and-bridge-patterns-differ





## 参考

1. [Wrapper Design Patterns](http://public.africa.cmu.edu/cbishop/jsmart/notes/Wrappers.html)