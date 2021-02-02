## 安装 ^[1]^
```shell
curl -L https://arthas.aliyun.com/install.sh | sh
# 上述命令会下载启动脚本文件 as.sh 到当前目录，你可以放在任何地方或将其加入到 $PATH 中
```



## 常用操作

### ognl
#### 调用静态字段的方法
```shell
ognl '@com.aliyun.code.typist.Chapter2_Basic.SuspendBadly@t2.setName("t22222")'
ognl '@com.aliyun.code.typist.Chapter2_Basic.SuspendBadly@t2.getName()'
```

### trace ^[2]^

#### 语法

```shell
 trace [--exclude-class-pattern <value>] [-h] [-n <value>] [--listenerId <value>] [-p <value>] [-E] [--skipJDKMethod <value>] [-v] class-pattern method-pattern [condition-exp 
 ress] 
```

#### 示例

```shell
trace com.xxx.yyy.service.impl.AServiceImpl * -n 1000
```

#### 注意

1. `method-pattern` 参数是一个 pattern，如果写成固定的一个方法，会看不到这个类中其他方法的耗时



## 参考

1. [Arthas Install](https://arthas.aliyun.com/doc/install-detail.html)
2. [trace](https://arthas.aliyun.com/doc/trace.html#6b91d63f-91a0-731f-1bcc-6b2672d29b9f)

