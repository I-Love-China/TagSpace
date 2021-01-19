#### 设置国内源 ^[2]^
```shell
sudo pacman-mirrors -c China
```
>这个命令并不需要等太久，很快的更新了中国源。更新后/etc/pacman.d/mirrorlist文件的内容为：Server = https://mirrors.huaweicloud.com/manjaro/stable/$repo/$arch
Server = https://mirrors.sjtug.sjtu.edu.cn/manjaro/stable/$repo/$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/manjaro/stable/$repo/$arch
Server = https://mirrors.zju.edu.cn/manjaro/stable/$repo/$arch所以手动更新也可以直接修改这个文件。

#### 检查更新 ^[1]^
1. pacman -Qu





###  参考
1. [How to Check Available Package Updates in Linux](https://www.2daygeek.com/check-available-package-updates-in-linux/)
2. [Manjaro Linux如何手动设置国内源host？](https://www.zhihu.com/question/320386416)