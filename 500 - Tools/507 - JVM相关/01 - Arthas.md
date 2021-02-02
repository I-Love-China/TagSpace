## 安装 ^[1]^
```shell
curl -L https://arthas.aliyun.com/install.sh | sh
# 上述命令会下载启动脚本文件 as.sh 到当前目录，你可以放在任何地方或将其加入到 $PATH 中
```



## 常用操作

#### ognl
##### 调用静态字段的方法
```shell
ognl '@com.aliyun.code.typist.Chapter2_Basic.SuspendBadly@t2.setName("t22222")'
ognl '@com.aliyun.code.typist.Chapter2_Basic.SuspendBadly@t2.getName()'
```


## 参考

1. [Arthas Install](https://arthas.aliyun.com/doc/install-detail.html)


```

```