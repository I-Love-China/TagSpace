## Use A Remote Docker Host

### 背景

> The `docker` CLI program is independent of the Docker daemon which runs your containers. Although both components usually run on your local machine, ==you can run `docker` commands against a remote Docker host==.



### 使用方法 / 步骤

#### Prerequisition

> 1. Make sure you’ve got Docker installed on the system which will be your **remote host**. 
> 2. You only need the `docker-cli` package on your **local machine**, as you won’t be running Docker Engine.



#### I、Setting Up The Remote Host

**A. Over TCP**

> A fresh Docker installation provides a Unix socket by default. Remote access requires a TCP socket. Run `dockerd` (the Docker daemon executable) with the `-H` flag to define the sockets you want to bind to.

```ini
[Service]
ExecStart=/usr/bin/dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375
```

> Reload your `systemd` configuration to apply the changes:
>
> ```bash
> sudo systemctl daemon-reload
> systemctl restart docker
> ```



**B. Over SSH**

> Docker supports SSH instead of TCP. This is usually a better option if the host has an SSH server available. It prevents unauthenticated users from gaining access. ==Using SSH requires no extra configuration==. `DOCKER_HOST` lets you pass in an SSH connection string:

```bash
DOCKER_HOST=ssh://user@hostname docker run -d --name httpd
```





#### II、Connecting To The Remote Host

> The Docker CLI uses the `DOCKER_HOST` environment variable to determine the host to connect to. 
>
> The local daemon’s Unix socket will be used when the variable isn’t set.

```bash
DOCKER_HOST=tcp://192.168.0.1:2375 docker run httpd:latest -d

docker -H tcp://192.168.0.1:2375 ps
```



### 示例

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/docker_host_ssh_20211207101814.png)



## 参考

1. [How and Why to Use A Remote Docker Host](https://www.cloudsavvyit.com/11185/how-and-why-to-use-a-remote-docker-host/)