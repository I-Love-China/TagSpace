## 配置
### 标题栏高度配置 ^[2]^

创建对应配置文件

```shell
# 默认的亮色主题
mkdir -p ~/.local/share/deepin/themes/deepin/light
# 深色主题
mkdir -p ~/.local/share/deepin/themes/deepin/dark

cd ~/.local/share/deepin/themes/deepin/light
nano titlebar.ini
```

保存配置

```ini
[Active]
height=24

[Inactive]
height=24
```





## 常见疑惑
### Deepin 基于的 Debian 版本 ^[1]^
```shell
cat /etc/debian_version
```


# 参考
1. [Deepin 目前是基于 Debian 的哪个版本发布的](https://bbs.deepin.org/post/145736#mod=viewthread&tid=145736)
2. [Deepin窗口标题栏边框太宽了修改方法](https://www.jianshu.com/p/3f6204274eed)
