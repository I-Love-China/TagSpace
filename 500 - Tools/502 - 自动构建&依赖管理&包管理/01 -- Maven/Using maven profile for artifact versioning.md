## Using maven profile for artifact versioning

### 问题

> I want a project's version number to be as the follow format for the normal release versioning:
>
> ```xml
> <version>1.0-SNAPSHOT</version>
> <version>1.0.1-SNAPSHOT</version>
> ......
> ```
>
> On the other hand, I want to have a built artifact for every change merged like below:
>
> ```xml
> <version>1.0-SNAPSHOT-${timestamp}</version>
> ```
>
> Can I achieve this by using maven profile? something like:
>
> ```xml
> <profiles>
>     <profile>
>         <id>normal</id>
>         <version>1.0-SNAPSHOT<version>
>     </proifle>
>     <profile>
>         <id>build</id>
>         <version>1.0-SNAPSHOT-${timestamp}<version>
>     </proifle>
> </profiles>
> ```
>
> so that I can build it like :
>
> ```xml
> mvn package -P normal  // this gives me artifact-1.0-SNAPSHOT.jar
> or
> mvn package -P build     // this gives me artifact-1.0-SNAPSHOT-${timestamp}.jar 
> ```
>
> if profile can solve this problem, what are the other approaches? ^[1]^



### 方法

> Though I wouldn't recommend this approach, you can use profiles for this task. Here's how it can be done: ^[1]^
>
> ```xml
> <version>${projectVersion}</version>
> ...
> <profiles>
>     <profile>
>         <id>normal</id>
>         <activation>
>             <activeByDefault>true</activeByDefault>
>         </activation>
>         <properties>
>             <projectVersion>1.0-SNAPSHOT</projectVersion>
>         </properties>
>     </profile>
>     <profile>
>         <id>build</id>
>         <properties>
>             <projectVersion>1.0-SNAPSHOT-${timestamp}</projectVersion>
>         </properties>
>     </profile>
> </profiles>
> ```



## 参考

1. [Using maven profile for artifact versioning](https://stackoverflow.com/questions/10514425/using-maven-profile-for-artifact-versioning)