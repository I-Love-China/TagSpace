## basename ^[1]^
### 作用/效果
> basename 命令从文件路径中剥离目录[和后缀]，以获取文件的基本名称

### 语法
```shell
basename NAME [SUFFIX]
basename OPTION... NAME...
```

### 常用例子
#### 获取文件名
```
basename /root/go/src/main.go
main.go
```

#### 获取文件名，不包含目录和后缀
```
basename /root/go/src/main.go .go
main
```


## 参考
1. [每天一个 Linux 命令（91）： basename 命令](https://mp.weixin.qq.com/s/V6GF4f82ThQ5sAOUjIQfLA)