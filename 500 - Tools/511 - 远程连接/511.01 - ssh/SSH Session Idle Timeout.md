## SSH Session Idle Timeout

### 方法 A: 配置服务端 ^[1]^

#### 方法1

```
# /etc/ssh/sshd_config
# Timeout value = ClientAliveInterval * ClientAliveCountMax

ClientAliveInterval  1200 # 单位: 秒
ClientAliveCountMax  3
```

这里是由服务端向客户端发送空包续活
> The `ClientAliveInterval` parameter specifies the time in seconds that the server will wait before sending a null packet to the client system to keep the connection alive.
>
> On the other hand, the `ClientAliveCountMax` parameter defines the number of client alive messages which are sent without getting any messages from the client.  ^[1]^

#### 方法2

> Alternatively, you can achieve the same result by specifying the `ClientAliveInterval` parameter alone. ^[1]^

```
# /etc/ssh/sshd_config
ClientAliveInterval  3600
```



### 方法 B: 配置客户端  ^[2]^

```sh
ssh -o "ServerAliveInterval 60" -o "ServerAliveCountMax 120" <SERVER_ADDRESS>
```
> The `ServerAliveInterval` will send a keepalive every x seconds (default is `0`, which disables this feature if not set to something else).
This will be done `ServerAliveCountMax` times if no response is received. The default value of `ServerAliveCountMax` is `3` (see [manpage ssh_config](https://linux.die.net/man/5/ssh_config)). ^[2]^


## 参考
1. [How to Increase SSH Connection Timeout in Linux](https://www.tecmint.com/increase-ssh-connection-timeout/)
2. [How to prevent SSH from disconnecting if it's been idle for a while](https://superuser.com/questions/699676/how-to-prevent-ssh-from-disconnecting-if-its-been-idle-for-a-while)