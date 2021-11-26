## Maven git commit id plugin



## Relocation of the Project

- Newer version (5.x.x or more recent) are available via

```xml
<groupId>io.github.git-commit-id</groupId>
<artifactId>git-commit-id-maven-plugin</artifactId>
```

- older version (4.x.x or older) are available via:

```xml
<groupId>pl.project13.maven</groupId>
<artifactId>git-commit-id-plugin</artifactId>
```



## Plugin compatibility with Java

Here is an overview of the current plugin compatibility with Java

| Plugin Version | Required Java Version |
| -------------- | --------------------- |
| 2.1.X          | Java 1.6              |
| 2.2.X          | Java 1.7              |
| 3.0.0          | Java 1.8              |
| 4.0.0          | Java 1.8              |
| 5.0.0          | Java 11               |



## Plugin compatibility with Maven

Even though this plugin tries to be compatible with every Maven version there are some known limitations with specific versions. Here is a list that tries to outline the current state of the art:

| Maven Version              | Plugin Version | Notes                                                        |
| -------------------------- | -------------- | ------------------------------------------------------------ |
| Maven 3.0.X (EOL)          | up to 4.0.5    | Maven 3.0.X is EOL                                           |
| Maven 3.1.0                | any            | git-commit-id-plugin:2.1.14, 2.1.15, 2.2.0, 2.2.1, 2.2.3 doesn't work -- requires maven version 3.1.1 |
| Maven 3.3.1                | any            | git-commit-id-plugin:2.1.14 doesn't work                     |
| Maven 3.3.3                | any            | git-commit-id-plugin:2.1.14 doesn't work                     |
| Maven 3.X.X (3.0.X is EOL) | any            | Any other non listed version here should work with any plugin version |

Note: As an example -- this table should be read as: For `Maven 3.1.0` `any` Plugin Version should work, besides the ones listed in the `Notes` have the limitations listed.



## Basic configuration / Basic usage of the plugin

It's really simple to setup this plugin; below is a sample plugin configuration that you may paste into the `<plugins>` section of your **pom.xml** to get started quickly. This will get you a properties file `git.properties` with build time, project version and git commit id (both abbreviated and full).

For more in-depth explanation of all options read the next section.

```xml
            <plugin>
                <groupId>io.github.git-commit-id</groupId>
                <artifactId>git-commit-id-maven-plugin</artifactId>
                <version>5.0.0</version>
                <executions>
                    <execution>
                        <id>get-the-git-infos</id>
                        <goals>
                            <goal>revision</goal>
                        </goals>
                        <phase>initialize</phase>
                    </execution>
                </executions>
                <configuration>
                    <generateGitPropertiesFile>true</generateGitPropertiesFile>
                    <generateGitPropertiesFilename>${project.build.outputDirectory}/git.properties</generateGitPropertiesFilename>
                    <includeOnlyProperties>
                        <includeOnlyProperty>^git.build.(time|version)$</includeOnlyProperty>
                        <includeOnlyProperty>^git.commit.id.(abbrev|full)$</includeOnlyProperty>
                    </includeOnlyProperties>
                    <commitIdGenerationMode>full</commitIdGenerationMode>
                </configuration>
            </plugin>
```



## 参考

1. [git-commit-id-maven-plugin](https://github.com/git-commit-id/git-commit-id-maven-plugin)
2. [using-the-plugin](https://github.com/git-commit-id/git-commit-id-maven-plugin/blob/master/docs/using-the-plugin.md)