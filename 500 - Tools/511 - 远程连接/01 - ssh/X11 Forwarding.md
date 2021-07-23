## X11 Forwarding



### What is X11 Forwarding ?

> X11 refers to the 11th (and final) version of the [X Window System,](https://en.wikipedia.org/wiki/X_Window_System) which is also the most common. In general, the terms X11, X, X Windows, and X Window System can be used interchangeably.
>
> In X, a program (X Client) displays its graphics to and receives its input from a screen (X Server) over a network. Usually, this server is represented by an IP address and screen number.
>
> As an alternative to direct connection over an IP network, there is a means to tunnel the X protocol over SSH, providing confidentiality and security not present in naive X.
>
> We call act of sending the X data over SSH instead of directly to the X server “X11 forwarding.” ^[1]^



### 基础使用

#### I、服务端 ssh 配置 ^[2]^

```
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost no
```



#### II、客户端 ssh 连接

```bash
ssh -X user@host
```



#### III、使用 GUI 应用(如 gvim)



### 更多

#### 让 X11 Forwarding 更快

1. 启用 ssh 压缩功能 ^[3]^

   ```bash
   ssh -XC user@host
   ```

   > ```
   >   -C      Requests compression of all data (including stdin, stdout,
   >              stderr, and data for forwarded X11 and TCP connections).  The
   >              compression algorithm is the same used by gzip(1), and the
   >              “level” can be controlled by the CompressionLevel option for pro‐
   >              tocol version 1.  Compression is desirable on modem lines and
   >              other slow connections, but will only slow down things on fast
   >              networks.  The default value can be set on a host-by-host basis
   >              in the configuration files; see the Compression option. ^[3]^
   > ```





#### 使用输入法

- 待确认
  - [ ] [今天试了一把更强大的ssh X11forwarding功能](https://nullget.sourceforge.io/?q=node/654)
  - [ ] [X Input Method](https://en.wikipedia.org/wiki/X_Input_Method)



### 使用体验

1. 功能 OK，确实可以显示远程服务器上的 GUI  程序
2. 带宽要求高
   - 20 MB 带宽
     - 不开启 ssh 压缩，基本无法使用，用户体验极差
     - 开启 ssh 压缩后，默认压缩级别、加密算法下，基本流畅使用；
3. 对于一些打开子窗口、菜单项的操作(如在 IntellijIDEA 中打开 `File` 菜单项)，会有长时间的延迟(10S 左右)



## 参考

1. [What is X11 forwarding?](https://www.quora.com/What-is-X11-forwarding)

2. [Ubuntu: X11 forwarding to view GUI applications running on server hosts](https://fabianlee.org/2018/10/14/ubuntu-x11-forwarding-to-view-gui-applications-running-on-server-hosts/)

3. [SSH compression for X11 forwarding](https://stackoverflow.com/questions/12977879/ssh-compression-for-x11-forwarding)

