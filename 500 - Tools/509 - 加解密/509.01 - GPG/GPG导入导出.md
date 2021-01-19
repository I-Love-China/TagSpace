### GPG 常用操作

#### 列出本的地所有 Key
```shell
gpg --list-keys /home/$USER/.gnupg/pubring.gpg 
 ----------------------------------- 
pub   4 096R/375A500B 2017-03-22 [有效至：2018-03-22] 
uid                  Goren G (Git) <gythialy.koo+git@gmail.com> 
sub   4096R/ADB9D36C 2017-03-22 [有效至：2018-03-22]
```

#### 导出公钥、私钥
```shell
gpg --output mygpgkey_pub.gpg --armor --export 375A500B
gpg --output mygpgkey_sec.gpg --armor --export-secret-key 375A500B
```

#### 导入公钥、私钥
```shell
gpg --import ~/mygpgkey_pub.gpg
gpg --allow-secret-key-import --import ~/mygpgkey_sec.gpg
```


### 参考
1. [GPG 导入导出 Key](https://gythialy.github.io/Howto-import-export-gpg-key/)