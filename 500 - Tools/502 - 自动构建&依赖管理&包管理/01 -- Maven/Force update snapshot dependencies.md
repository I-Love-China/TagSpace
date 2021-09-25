## Force update snapshot dependencies

> [**原文地址**  How to force maven update?](https://stackoverflow.com/questions/4701532/how-to-force-maven-update)



### 方法 ^[1]^

> ```xml
> mvn clean install -U
> ```
>
> `-U` means force update of *snapshot* dependencies.
>
> Release dependencies will be updated this way if they have never been previously successfully downloaded. ref: https://stackoverflow.com/a/29020990/32453 





## 参考

1. [How to force maven update?](https://stackoverflow.com/questions/4701532/how-to-force-maven-update)
