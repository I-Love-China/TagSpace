## Docker 国内镜像源

#### [原文地址](https://segmentfault.com/a/1190000023117518)



### 设置方法

1. `/etc/docker/daemon.json` 增加 `registry-mirrors` 配置

```json
{
	"registry-mirrors": ["https://registry.cn-hangzhou.aliyuncs.com"]
}
```

2. 重启 Docker 守护进程

   ```shell
   systemctl daemon-reload
   systemctl restart docker.service
   ```

   

### 常用国内镜像源

1. https://registry.cn-hangzhou.aliyuncs.com
3. https://05f073ad3c0010ea0f4bc00b7105ec20.mirror.swr.myhuaweicloud.com/
5. http://hub-mirror.c.163.com/
6. http://f1361db2.m.daocloud.io/



### 参考

1. [Docker必备六大国内镜像](https://segmentfault.com/a/1190000023117518)
```

```