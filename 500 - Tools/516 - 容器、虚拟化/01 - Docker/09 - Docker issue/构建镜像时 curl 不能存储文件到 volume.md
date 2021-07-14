## 构建镜像时 curl 不能存储文件到 volume

### 表现

> If a folder is a `volume`, `curl` cannot save file to it. `ADD` local file works ^[1]^

```dockerfile
FROM ubuntu

RUN apt update && apt install -y curl

VOLUME /data # If comment this out everything works
WORKDIR /data

RUN curl http://www.bing.com > bing.txt # This fails to save
RUN pwd
RUN ls # Shows nothing
```

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/docker_curl_volume_not_works_20210310101834.png)

### 解决方法 ^2^

```shell
sudo DOCKER_BUILDKIT=1 docker build -t my1 .
```

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/docker_curl_DOCKER_BUILDKIT_20210310102124.png)

### 原理

╮（╯＿╰）╭



### 扩展阅读

#### Docker BuildKit 介绍

> Docker Build enhancements for 18.09 release introduces a much-needed ==overhaul== of the build architecture. By integrating BuildKit, users should see an improvement on performance, storage management, feature functionality, and security.
>
> - Docker images created with BuildKit can be pushed to Docker Hub just like Docker images created with ==legacy== build
> - the Dockerfile format that works on legacy build will also work with BuildKit builds
> - The new `--secret` command line option allows the user to pass secret information for building new images with a specified Dockerfile ^[3]^



#### 启用 Docker BuildKit

> Easiest way from a fresh install of docker is to set the `DOCKER_BUILDKIT=1` environment variable when invoking the `docker build` command ^[3]^

```sh
DOCKER_BUILDKIT=1 docker build .
```



### 参考

1. [curl cannot save file to data volume folder #13117](https://github.com/moby/moby/issues/13117)
2. [Base Images & Volume & mkdir #3639](https://github.com/moby/moby/issues/3639#issuecomment-481746950)
3. [Build images with BuildKit](https://docs.docker.com/develop/develop-images/build_enhancements/)