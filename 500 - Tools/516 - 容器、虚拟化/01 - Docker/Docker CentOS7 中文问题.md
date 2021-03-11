## Docker CentOS 7 中文 "?" 问题

### 问题表现

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/docker_centos7_zhcn_20210311164253.png)



### 解决方法

```shell
yum makecache && yum install kde-l10n-Chinese glibc-common -y

localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
export LANG=zh_CN.UTF-8
echo "export LANG=zh_CN.UTF-8" >> /etc/locale.conf
export LC_ALL=zh_CN.UTF-8
```



### 效果

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/docker_centos7_zhcn20210311165256.png)



### 参考

1. [Docker centos7 中文乱问题解决方案](https://blog.csdn.net/wo541075754/article/details/89787894)