### 换国内源 ^[2]^
```shell
cd /etc/yum.repos.d/
rm -f CentOS-Base.repo CentOS-AppStream.repo CentOS-PowerTools.repo CentOS-centosplus.repo CentOS-Extras.repo
curl -o CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-8.repo
yum makecache
```

### 检查更新 ^[1]^
1. yum check-update
2. yum list updates
3. dnf check-update
4. dnf list updates
5. dnf updateinfo



### 参考资料

1. [How to Check Available Package Updates in Linux](https://www.2daygeek.com/check-available-package-updates-in-linux/)
2. [分享一个Centos8的国内yum源](https://www.cnblogs.com/hackyo/p/11650188.html)