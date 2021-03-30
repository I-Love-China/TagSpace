## CentOS 安装 NFS 服务

### NFS 简介

> Network File System (NFS) is a distributed file system protocol that allows you to share remote directories over a network. ^[1]^

> With NFS, you can mount remote directories on your system and work with the files on the remote machine as if they were local files. ^[1]^

### 注意

> NFS protocol is ==not encrypted== by default, and it does ==not provide user authentication==. ^[1]^

> Access to the server is restricted by the clients' IP addresses or hostnames. ^[1]^



### Prerequisites

1. Private Network
   因为 NFS 默认不加密，无需用户授权的原因;
   也可以用公网，但要设置对应的防火墙规则
   
2. CentOS

   [原文](https://linuxize.com/post/how-to-install-and-configure-an-nfs-server-on-centos-8/)中使用的是 CentOS8，本文中使用的是 CentOS7，步骤基本未变



### Set up NFS Server

#### I、安装

```bash
sudo yum install nfs-utils -y
```

#### II、启动

```bash
sudo systemctl enable --now nfs
```

#### III、Creating the file systems

##### Why

> When configuring an NFSv4 server, it is a good practice is to use a global NFS root directory and bind mount the actual directories to the share mount point. ^[1]^



##### 例

以 `/srv/nfs4` 作为 NFS 根目录



#### IV、Exporting the file systems

##### Why

> The next step is to define the file systems that will be exported by the NFS server. ^[1]^



##### How

###### I、编辑 `/etc/exports` 文件，添加需要 NFS export 的目录

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/nfs_exports_20210330173758.png)

###### II、使修改生效

```bash
sudo exportfs -ra
```

> You need to run the command above each time you modify the `/etc/exports` file. ^[1]^



##### Options

1. fsid=0

   >  The first line contains `fsid=0` which defines the NFS root directory `/srv/nfs` ^[1]^
   
2. crossmnt

   > The `crossmnt` option is required to share directories that are sub-directories of an exported directory. ^[1]^
   
3. sync

   >  The `sync` option tells NFS to write changes to disk before replying. ^[1]^

4. CIDR



#### V、设置防火墙允许 NFS 访问 ^[2]^

```bash
sudo ufw allow nfs
```



#### 查看 `active exports`

```bash
sudo exportfs -v
```



### 客户端连接 NFS

#### I、安装 NFS Client

```bash
# Install NFS client on CentOS and Fedora
sudo yum install nfs-utils

# Install NFS client on Debian and Ubuntu
# sudo apt install nfs-common
```

#### II、Mounting file systems

```bash
sudo mkdir -p /backups

sudo mount -t nfs -o vers=4 192.168.33.148:/backups /backups
```

> When mounting an NFSv4 filesystem, you need to omit the NFS root directory, so instead of `/srv/nfs4/backups` you need to use `/backups`. ^[1]^



#### Unmounting NFS File System

```bash
sudo umount /backups
```



### 参考

1. [How to Install and Configure an NFS Server on CentOS 8](https://linuxize.com/post/how-to-install-and-configure-an-nfs-server-on-centos-8/)

2. [nfs is blocked by ufw even though ports are opened](https://askubuntu.com/questions/103910/nfs-is-blocked-by-ufw-even-though-ports-are-opened)