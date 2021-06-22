## Remote monitoring with visualvm and JMX



### 使用方法/步骤

#### I、JVM Options

```bash
-Dcom.sun.management.jmxremote \
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





## 参考

1. [Remote monitoring with visualvm and JMX](https://stackoverflow.com/questions/30069643/remote-monitoring-with-visualvm-and-jmx)
