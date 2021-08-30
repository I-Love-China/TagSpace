### 安装后配置
1. 换国内源
2. 安装 epel ^[3][4]^
```
yum install epel-release
```



### 换国内源 ^[2]^
#### CentOS 8
```shell
cd /etc/yum.repos.d/
rm -f CentOS-Base.repo CentOS-AppStream.repo CentOS-PowerTools.repo CentOS-centosplus.repo CentOS-Extras.repo
curl -o CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-8.repo
yum makecache
```
#### CentOS 7 & 8 
- [清华大学开源软件镜像站#CentOS 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/centos/)

### 检查更新 ^[1]^
1. yum check-update
2. yum list updates
3. dnf check-update
4. dnf list updates
5. dnf updateinfo



### 参考资料

1. [How to Check Available Package Updates in Linux](https://www.2daygeek.com/check-available-package-updates-in-linux/)
2. [分享一个Centos8的国内yum源](https://www.cnblogs.com/hackyo/p/11650188.html)
3. [How To Install EPEL Repo on a CentOS and RHEL 7.x](https://www.cyberciti.biz/faq/installing-rhel-epel-repo-on-centos-redhat-7-x/)
4. [What's EPEL, and how do I use it?](https://www.redhat.com/en/blog/whats-epel-and-how-do-i-use-it)