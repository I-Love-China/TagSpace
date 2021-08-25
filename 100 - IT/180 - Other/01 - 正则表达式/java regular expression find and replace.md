﻿## java regular expression find and replace



> [原文地址]([java regular expression find and replace](https://stackoverflow.com/questions/9605716/java-regular-expression-find-and-replace))



### 需求 ^[1]^

> I am trying to find environment variables in input and replace them with values.
>
> The pattern of env variable is `${\\.}`
>
> ```java
> Pattern myPattern = Pattern.compile( "(${\\.})" );
> String line ="${env1}sojods${env2}${env3}";
> ```
>
> How can I replace `env1` with `1` and `env2` with `2` and `env3` with `3`, so that after this I will have a new string `1sojods23`?



### 方法 ^[1]^

```java
Map<String, String> replacements = new HashMap<String, String>() {{
    put("${env1}", "1");
    put("${env2}", "2");
    put("${env3}", "3");
}};

String line ="${env1}sojods${env2}${env3}";
String rx = "(\\$\\{[^}]+\\})";

StringBuilder sb = new StringBuilder(); //use StringBuffer before Java 9
Pattern p = Pattern.compile(rx);
Matcher m = p.matcher(line);

while (m.find())
{
    // Avoids throwing a NullPointerException in the case that you
    // Don't have a replacement defined in the map for the match
    String repString = replacements.get(m.group(1));
    if (repString != null)    
        m.appendReplacement(sb, repString);
}
m.appendTail(sb);

System.out.println(sb.toString());
```



## 参考

1. [java regular expression find and replace](https://stackoverflow.com/questions/9605716/java-regular-expression-find-and-replace)