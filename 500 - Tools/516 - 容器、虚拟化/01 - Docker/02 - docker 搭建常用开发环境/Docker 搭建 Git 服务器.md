## Docker 搭建 Git 服务器: 使用 gogs



### I、运行 gogs docker 容器

```bash
docker run --name=gogs --restart=always -d \
           -p 10022:22 -p10086:3000 \
           -v /var/gogs:/data gogs/gogs
```

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/gogs_install_20210714113301.png)



### II、首次运行配置

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/gogs_init_20210714115253.png)



### III、注册新用户，首个用户即为管理员帐号

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/gogs_register_20210714114535.png)

### IV、畅快使用

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/gogs_using_20210714114658.png)



## 参考

1. [Docker for Gogs](https://github.com/gogs/gogs/tree/main/docker)