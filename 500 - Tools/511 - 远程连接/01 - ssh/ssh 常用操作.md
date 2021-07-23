### ssh 常用操作

#### 清除 ssh-agent 缓存 ^[1]^
```shell
ssh-add -D
```

#### 仅允许公钥登录(禁用密码登录)
```shell
# /etc/ssh/sshd_config 后面添加

# 禁用系统用户名、密码登录
PasswordAuthentication no
```



### 参考

1. [How do I clear out the ssh-agent entries (on Mac OS X )?](https://superuser.com/questions/271657/how-do-i-clear-out-the-ssh-agent-entries-on-mac-os-x)