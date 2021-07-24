## xpra 日常使用



### What

> Xpra is an open-source multi-platform persistent remote display server and client for forwarding applications and desktop screens.
>
> It gives you remote access to individual applications or full desktops.
> On X11, it is also known as ==*screen for X11*==: it allows you to run programs, usually on a remote host, direct their display to your local machine, and then to disconnect from these programs and reconnect from the same or another machine, without losing any state.
> It can also be used to forward full desktops, from X11 servers, MS Windows, or Mac OS X.
>
> Xpra also allows forwarding of sound, clipboard and printing services.
> Sessions can be accessed over SSH, or password protected over plain TCP sockets with or without SSL.
> Xpra is usable over reasonably slow links and does its best to adapt to changing network bandwidth constraints. ^[1]^



### 基础使用

#### I、客户端(真正运行 GUI 程序的机器)、服务端(显示窗口的机器)均安装 `xpra`

[xpra download](https://github.com/Xpra-org/xpra/wiki/Download#-for-debian-based-distributions)



#### II、在服务端启动 `xpra`

```bash
xpra start ssh://zhangjl@192.168.1.21 --input-method=fcitx --start='fcitx -r'
```



#### III、通过 `xpra tray` 启动要运行的应用

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/xpra_tray_20210724092457.png)





### 演示 & demo

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/xpra_demo_20210724095840.gif)



### 更多

#### 使用 fcitx 输入法 ^[3]^

```bash
xpra start --start=xterm --input-method=fcitx --start="fcitx -r"
```



#### 使用 ibus 输入法 ^[4]^

> 安装ibus
>
> ```bash
> sudo apt install ibus-pinyin
> ```
>
> 配置ibus
>
> ```bash
> xpra start ssh://user@host --exit-with-children=yes --speaker=off --webcam=no --input-method=IBus --start-child="ibus-setup"
> ```
>
> 运行firefox，同时启动ibus输入法
>
> ```bash
> xpra start ssh://user@host --start-child=firefox --exit-with-children=yes --speaker=off --webcam=no --input-method=IBus --start-child="ibus-daemon -x -d -r"
> ```



## 参考

1. [multi-platform screen and application forwarding system "screen for X11"](http://xpra.org/)
2. [xpra download](https://github.com/Xpra-org/xpra/wiki/Download#-for-debian-based-distributions)
3. [Input methods don't work](https://xpra.org/trac/ticket/1294)
4. [Xpra入门](https://openwares.net/2020/02/04/xpra-intro/)



