## 以 root 用户登入容器

### 背景 / Why

> I'm using a Docker image which was built using the USER command to use a non-root user called `dev`. Inside a container, I'm "dev", but I want to edit the `/etc/hosts` file.
>
> So I ==need to be root==. I'm trying the su command, but I'm asked to enter ==the root password==.
>
> What's the default root user's password inside a Docker container? ^[1]^



### 方法

```bash
docker exec -u 0 -it mycontainer bash

docker run -u 0 -it myimage bash
```

> You can log into the Docker container using the root user (ID = 0) instead of the provided default user when you use the `-u` option. ^[1]^

> root (id = 0) is the default user within a container. The image developer can create additional users. Those users are accessible by name. When passing a numeric ID, the user does not have to exist in the container. ^[1]^

> The developer can set a default user to run the first process with the Dockerfile `USER` instruction. When starting a container, the operator can override the `USER` instruction by passing the `-u` option. ^[2]^





## 参考

1. [Root password inside a Docker container](https://stackoverflow.com/questions/28721699/root-password-inside-a-docker-container)

2. [Docker run reference](https://docs.docker.com/engine/reference/run/)