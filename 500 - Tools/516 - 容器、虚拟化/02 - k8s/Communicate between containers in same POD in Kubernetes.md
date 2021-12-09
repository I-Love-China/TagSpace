## Communicate between containers in same POD in Kubernetes



### 问题

> For one POD, three images has been created. The problem here is that there is no communication between containers within same pod. How should my application connected with these three containers?



### 解决方法

> Use **localhost** to communicate with other containers within the same pod.
>
> E.g. the addresses to the containers are
>
> - 127.0.0.1:3000
> - 127.0.0.1:80
> - 127.0.0.1:6379



## 参考

1. [How to communicate between containers in same POD in Kubernetes?](https://stackoverflow.com/questions/67061603/how-to-communicate-between-containers-in-same-pod-in-kubernetes)