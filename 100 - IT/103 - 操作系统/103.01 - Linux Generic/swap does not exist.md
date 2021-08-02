## /dev/centos/swap does not exist

### 问题来源

LVM 删除 swap 分区后未执行 ```dracut --regenerate-all -f```



### 问题表现

启动时提示:

```
warning: /dev/centos/swap does not exist
```



### 解决方法
```bash
dracut --regenerate-all -f && grub2-mkconfig -o /boot/grub2/grub.cfg
```

> This will rebuild `initramfs` and solve naming issues in block devices (`/dev/sda1` might now be `/dev/xvde1` or something similar). ^[1]^





## 参考

1. [Error booting Linux. Root and swap does not exist](https://unix.stackexchange.com/questions/467019/error-booting-linux-root-and-swap-does-not-exist)
