## 搭建简单 DNS 服务



### 安装方法/步骤 ^[1]^

#### I、安装 `dnsmasq`

```bash
sudo apt install dnsmasq
sudo cp /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
```



#### II、HelloWorld 配置

```ini
#/etc/dnsmasq.conf
domain-needed
bogus-priv
expand-hosts
 
# The address 192.168.0.176 is the static IP of this server 
# You can find this ip by running ifconfig and look for the 
# IP of the interface which is connected to the router.
listen-address=127.0.0.1
listen-address=192.168.0.176
bind-interfaces
 
# Use open source DNS servers
server=8.8.8.8
server=8.8.4.4
server=208.67.220.220
 
# Create custom 'domains'.
# Custom 'domains' can also be added in /etc/hosts
address=/busyserver.net/192.168.0.176
```



#### III、重启 `dnsmasq` 服务

```
sudo systemctl restart dnsmasq
```





## 参考

1. [Setting up a simple DNS server](https://medium.com/nuculabs/setting-up-a-simple-dns-server-859de750f6fe)