## maven override project.version from command line

### 问题

> I wonder if it is possible to override project.version/version variable in maven via command line ? 
>
> ^[1]^



### 解决方法

> Use [`versions:set`](http://www.mojohaus.org/versions-maven-plugin/set-mojo.html) from the [versions-maven plugin](http://www.mojohaus.org/versions-maven-plugin/):
>
> ```xml
> mvn versions:set -DnewVersion=2.50.1-SNAPSHOT
> ```
>
> It will adjust all pom versions, parent versions and dependency versions in a multi-module project.
>
> If you made a mistake, do
>
> ```xml
> mvn versions:revert
> ```
>
> afterwards, or
>
> ```xml
> mvn versions:commit
> ```
>
> if you're happy with the results.
>
> ------
>
> Note: this solution assumes that all modules use the aggregate pom as parent pom also, a scenario that was considered standard at the time of this answer. If that is not the case, go for [Garret Wilson's answer](https://stackoverflow.com/a/49246337/342852). ^[2]^



### 注意

- 此命令会修改代码中的 \<version>



## 参考

1. [maven override project.version from command line](https://stackoverflow.com/questions/18100389/maven-override-project-version-from-command-line)

2. [Updating version numbers of modules in a multi-module Maven project](https://stackoverflow.com/questions/5726291/updating-version-numbers-of-modules-in-a-multi-module-maven-project)