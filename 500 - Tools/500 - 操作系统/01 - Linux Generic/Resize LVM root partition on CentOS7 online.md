## Resize LVM root partition on CentOS7 online

### 背景

> By default, CentOS 7 uses `XFS` for the file system and Logical Volume Manager (LVM), creating 3 partitions: `/`,`/home` and `/swap` ^[1]^



### 步骤(xfs) ^[1][2]^

#### I、login using the `root` account, logout other users

   > This requires you to be able to ssh into the instance using the root user account and that no services be running as users out of /home on the target machine.

```bash
# logout an open SSH session
pkill -KILL -t pts/0 

# logout user
pkill -KILL -u zhang
```



#### II、Copy `/home` Contents

```bash
mkdir /temp
cp -a /home /temp/
```



#### III、Unmount the `/home` directory

```bash
umount -fl /home
```



#### IV、Remove the `home` LVM volume

```bash
lvremove /dev/mapper/centos-home
```



#### V、Extend the `root` LVM volume

```
lvextend -L +100G /dev/mapper/centos-root
```



#### VI、Resize the `root` partition

```bash
xfs_growfs /dev/mapper/centos-root
```



#### VII、sync systemd up with the changes

```
dracut --regenerate-all --force
```





### 问题

1. [**Currently XFS Filesystems ==can't be shrunk==.**](https://xfs.org/index.php/Shrinking_Support)

2. **resize2fs: Bad magic number in super-block while trying to open /dev/mapper/centos-home**

   - 原因
   
     >  The tool `resize2fs` works with ext2, ext3 and ext4 only. ^[5]^
   - 解决方法
     1. xfs_growfs
     2. fsadm ^[4]^



### 其他方法

- [How to Shrink XFS File System on Enterprise Linux 7.2](https://logic.edchen.org/how-to-shrink-xfs-file-system-on-enterprise-linux-7-2/)

  1. Install XFS backup utilities(xfsdump)
  2. Backup the XFS file system
  3. Remove the source LV
  4. Create a new LV
  5. Restore data back to the new and smaller XFS file system(xfsrestore)





### 引申阅读

- **why we can't shrink an XFS filesystem?**

  > The reason it hasn't been done is that there is basically no demand for shrinking large filesystems. Storage is -cheap-, and in most environments data sets and capacity only grow. ^[6]^



### 参考

1. [Resize root partition (or how to remove the default /home partition) on CentOS 7 online](https://gist.github.com/troyfontaine/87091bd6a5c68f45dd62ced3d12bc377)
2. [How to shrink /home and add more space on CentOS7](https://serverfault.com/questions/771921/how-to-shrink-home-and-add-more-space-on-centos7)
3. [How can I logout an open, remote SSH session?](https://superuser.com/questions/193168/how-can-i-logout-an-open-remote-ssh-session)
4. [resize2fs: Bad magic number in super-block while trying to open](https://stackoverflow.com/questions/26305376/resize2fs-bad-magic-number-in-super-block-while-trying-to-open)
5. [Trying to resize2fs EB volume fails ](https://stackoverflow.com/questions/13362910/trying-to-resize2fs-eb-volume-fails)
6. [XFS: the filesystem of the future?](https://lwn.net/Articles/476808/)

