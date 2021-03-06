﻿## 日常使用合集

### 切换 JDK 版本

#### CentOS ^[1][2]^

```sh
alternatives --config java
alternatives --config javac
```

#### Ubuntu

```shell
sudo update-alternatives --config java
sudo update-alternatives --config javac
```

#### Arch / Manjaro ^[4]^

```bash
archlinux-java status

archlinux-java set java-14-jdk
```



### JDK 下载

- [Java Downloads for All Operating Systems](https://java.com/en/download/manual.jsp)



## 参考

1. [How to set Python3.5.2 as default Python version on CentOS?](https://stackoverflow.com/questions/45542690/how-to-set-python3-5-2-as-default-python-version-on-centos)
2. [Switch java version on CentOS 6](https://stackoverflow.com/questions/22378696/switch-java-version-on-centos-6)
3. [Switch between multiple java versions](https://askubuntu.com/questions/740757/switch-between-multiple-java-versions)
4. [Arch Linux: set a Java version](https://rtfm.co.ua/en/arch-linux-set-a-java-version/)

