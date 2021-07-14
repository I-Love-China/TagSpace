## CentOS 安装指定版本 Docker



### I、Check which versions are in yum repo

```shell
sudo yum list docker-ce.x86_64 --showduplicates | sort -r
```



### II、Install the version listed that you want

```shell
sudo yum -y install docker-ce-<VERSION_STRING>
```



## 参考

1. [How to install specific version of Docker on Centos?](https://stackoverflow.com/questions/36545206/how-to-install-specific-version-of-docker-on-centos)