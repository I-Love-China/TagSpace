### Tell the maven-resources-plugin which files NOT to filter when including ^[1]^
```xml
  <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-resources-plugin</artifactId>
        <version>2.7</version>
        <configuration>
            <delimiters>
                <delimiter>@</delimiter>
            </delimiters>
            <nonFilteredFileExtensions>
                <nonFilteredFileExtension>p12</nonFilteredFileExtension>
                <nonFilteredFileExtension>pfx</nonFilteredFileExtension>
                <nonFilteredFileExtension>pem</nonFilteredFileExtension>
            </nonFilteredFileExtensions>
        </configuration>
    </plugin>
```

### 参考
1. [generated certificate stops working when moved to resources folder](https://stackoverflow.com/questions/17298126/generated-certificate-stops-working-when-moved-to-resources-folder/27568768)