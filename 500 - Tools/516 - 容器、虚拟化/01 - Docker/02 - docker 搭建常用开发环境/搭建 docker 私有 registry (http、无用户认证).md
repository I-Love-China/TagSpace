## 搭建、使用 docker 私有 registry (http、无用户认证)

### 搭建 registry 服务

#### 一、配置 docker 允许非安全的 registry ^[2]^

1. 修改/创建 `/etc/docker/daemon.json`, 添加 `insecure-registries` 配置项

```
{
     "insecure-registries":["192.168.1.21:5000"] # 私有 registry 服务机器的 IP:PORT
}
```

2. 重启 dockerd ^[3]^

   ```shell
   sudo systemctl daemon-reload
   sudo systemctl restart docker.service
   ```

   

#### 二、使用 Docker 提供的 registry 镜像创建 & 运行私有 registry 容器

```shell
sudo docker run -d -p 5000:5000 --restart=always --name pri_docker_registry registry
```



### 使用私有 registry

#### 前置条件

1. 本地 docker 守护进程也需要配置为允许 `insecure-registry`



#### push

1. > Tag the image as `192.168.1.21:5000/my-ubuntu`. This creates an additional tag for the existing image. ^[1]^
   
   > ==When the first part of the tag is a hostname and port, Docker interprets this as the location of a registry==, when pushing. ^[1]^
   
   ```shell
   sudo docker tag ubuntu:18.04 192.168.1.21:5000/ubuntu:18.04
   ```
   
   
   
2. > Push the image to the local registry running at `192.168.1.21:5000` ^[1]^

   ```shell
   sudo docker push 192.168.1.21:5000/ubuntu:18.04
   ```

   ![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/docker_registry_push_20210303153343.png)



#### pull

```shell
sudo docker pull 192.168.1.21:5000/ubuntu:18.04
```



![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/docker_registry_pull_20210303153643.png)





## 参考

1. [Deploy a registry server](https://docs.docker.com/registry/deploying/)
2. [docker私有仓库搭建并且配置仓库认证](https://www.jianshu.com/p/7918c9af45a3)
3. [Kubernetes pull from insecure docker registry](https://stackoverflow.com/questions/51893120/kubernetes-pull-from-insecure-docker-registry)