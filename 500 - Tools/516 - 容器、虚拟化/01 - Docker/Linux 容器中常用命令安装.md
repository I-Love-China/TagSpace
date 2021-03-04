## Linux 容器中常用命令安装

### ps ^[1]^

```shell
apt update && apt install -y procps
```

### ping ^[2]^

```shell
apt install iputils-ping
```

### ip ^[3]^

```shell
apt install iproute2
```



### 参考

1. [ps command doesn't work in docker container](https://stackoverflow.com/questions/26982274/ps-command-doesnt-work-in-docker-container)

2. [Ping command not found on Ubuntu 20.04 Focal Fossa Linux](https://linuxconfig.org/ping-command-not-found-on-ubuntu-20-04-focal-fossa-linux)

3. [Docker - Bash: IP: command not found](https://stackoverflow.com/questions/42679270/docker-bash-ip-command-not-found)