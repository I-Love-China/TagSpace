## docker exec 

### Description

> Run a command in a running container

> The command started using `docker exec` only runs while the container’s primary process (`PID 1`) is ==running==, and it is not restarted if the container is restarted.





### Examples

#### set environment variables

`--env`,`-e` option

```bash
docker exec -it -e VAR=1 ubuntu_bash bash
```





## 参考

1. [docker exec](https://docs.docker.com/engine/reference/commandline/exec/)