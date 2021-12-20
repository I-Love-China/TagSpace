## SpringBoot using both properties and yml files at the same time



### 问题

> I have a spring boot application and I want to use both a yml file for my application properties and also a plain application-${profile}.properties file set to configure my application.
>
> So my question is can this be done and if so, how do you configure spring boot to look for both the yml file and the properties and merge them into one set per environment?



### 答案

> **Yes You can use both at same time in same project.**
>
> - When you use both YML and properties at same time, say for example
>   application.yml and application.properties at same time in same
>   project, **first application.yml will be loaded later
>   application.properties will be loaded**.
> - Important point to be noted is that if application.yml and application.properties have **same keys** for example in **application.yml** has **spring.app.name = testYML** and **application.properties** has **spring.app.name = testProperties** **at same time in same project**, ==then application.yml value will be overwritten by application.properties value since it is loading at last==.
> - And the value in **spring.app.name = testProperties**.



## 参考

1. [Does spring boot support using both properties and yml files at the same time?](https://stackoverflow.com/questions/25231918/does-spring-boot-support-using-both-properties-and-yml-files-at-the-same-time)