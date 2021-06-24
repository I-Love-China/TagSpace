## Remote monitoring with visualvm and JMX



### 使用方法/步骤

#### I、JVM Options ^[1]^

```bash
-Dcom.sun.management.jmxremote=true \
-Dcom.sun.management.jmxremote.port=9010 \
-Dcom.sun.management.jmxremote.authenticate=false \
-Dcom.sun.management.jmxremote.ssl=false \
-Djava.rmi.server.hostname=192.168.1.21
```



#### II、连接
```
service:jmx:rmi:///jndi/rmi://192.168.1.21:9010/jmxrmi
```

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/visualvm_remote.png)



### More

**VisualVM 通过 SSH 连接远程 JVM**

> Connect via ssh to the server and forward your local *port1* and *port2* to localhost:port1|2 an the server. ^[2]^


```bash
ssh -L 9999:192.168.1.21:9010 user@192.168.1.21
```

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/visualvm_ssh_20210622170720.png)





## 参考

1. [Remote monitoring with visualvm and JMX](https://stackoverflow.com/questions/30069643/remote-monitoring-with-visualvm-and-jmx)

2. [VisualVM over ssh](https://stackoverflow.com/questions/1609961/visualvm-over-ssh)
