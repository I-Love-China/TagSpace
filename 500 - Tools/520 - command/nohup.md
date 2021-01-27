## 简介/作用

> nohup 可以将程序忽略挂起信号的方式运行，
>
> 常见的用法是和 `&` 命令一同使用，将命令放置到后台运行，即使终端关闭，进程仍会继续运行，忽略挂起信号 ^[1]^



## 常用示例

### 基础使用 ^[1]^

```shell
nohup ./test.sh &
```

### 标准输出与标准错误输出重定向 ^[1]^

```shell
nohup ./test.sh 2>&1 > run.log
```

## 注意

### 输出重定向 ^[1]^

1. 默认输出到 nohup.out 文件中
> 如果使用 `nohup`执行程序未显示进行标准输出重定向，则标准输出默认重定向当前工作目录的 `nohup.out` 文件中
2. 如果当前工作目录的 `nohup.out` 文件不可写，输出重定向到 `$HOME/nohup.out` 文件中


## 参考

1. [每天一个 Linux 命令（81）： nohup 命令](https://mp.weixin.qq.com/s?__biz=MzAxODI5ODMwOA==&mid=2666550199&idx=2&sn=888c625bce23046bb44680d984a24fc2&chksm=80dc971cb7ab1e0ad1dac8d5c2f6a0f218ffc49823785f4e9732d007d626e3a1106f4d04ae1a&mpshare=1&scene=1&srcid=0127dM66aof7XLW7XUeih9ST&sharer_sharetime=1611711540474&sharer_shareid=7d84fec8f6d2c3bbc1f0f74bf5f3a886#rd)