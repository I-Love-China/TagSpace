## Remove jar file from local maven repository



> Although deleting files manually works, there is an *official* way of removing dependencies *of your project* from your local (cache) repository and optionally re-resolving them from remote repositories.
>
> The goal `purge-local-repository`, on the standard Maven dependency plugin, will remove the locally installed dependencies *of this project* from your cache. Optionally, you may re-resolve them from the remote repositories at the same time.
>
> ***This should be used as part of a project phase*** because it applies to the dependencies for the containing project. Also transitive dependencies will be purged (locally) as well, by default.
>
> If you want to explicitly remove a single artifact from the cache, use `purge-local-repository` with the `manualInclude` parameter. For example, from the command line:
>
> ```xml
> mvn dependency:purge-local-repository -DmanualInclude="groupId:artifactId, ..."
> ```
>
> The documentation implies that this does not remove transitive dependencies by default. If you are running with a non-standard cache location, or on multiple platforms, these are more reliable than deleting files "by hand".
>
> The full documentation is in the [maven-dependency-plugin](http://maven.apache.org/plugins/maven-dependency-plugin/plugin-info.html) spec.
>
> *Note*: Older versions of the maven `dependency` plugin had a `manual-purge-local-repository` goal, which is now (version 2.8) implied by the use of `manualInclude`. The documentation for `manualIncludes` (with an `s`) should be read as well.





## 参考

1. [How to remove jar file from local maven repository which was added with install:install-file?](https://stackoverflow.com/questions/15358851/how-to-remove-jar-file-from-local-maven-repository-which-was-added-with-install)