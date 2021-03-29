## screen

>  [原文地址](https://linuxize.com/post/how-to-use-linux-screen/)



### 为什么用 / 适用场景

1. multiplexer
2. > Processes running in Screen will continue to run when their window is not visible even if you get disconnected. ^[1]^


### 使用
#### Multiplexer

##### Starting Linux Screen Session

```sh
screen
```



##### Working with Linux Screen Windows

| Command                | Description                                        |
| ---------------------- | -------------------------------------------------- |
| `Ctrl + a`  `?`        | Get a list of commands                             |
| `Ctrl + a`  `c`        | ==Create a new window (with shell)==               |
| `Ctrl + a`  `|`        | Split current region vertically into two regions   |
| `Ctrl + a`  `S`        | Split current region horizontally into two regions |
| `Ctrl + a`  `"`        | List all window                                    |
| `Ctrl + a`  `tab`      | Switch the input focus to the next region          |
| `Ctrl + a`  `Ctrl + a` | Toggle between the current and previous region     |
| `Ctrl + a`  `Q`        | Close all regions but the current one              |
| `Ctrl + a`  `X`        | Close the current region                           |



#### Detach & Reattach

##### Detach from Linux Screen Session

`Ctral + a` `d`

> The program running in the screen session will ==continue to run after you detach from the session==. ^[1]^



##### Reattach to a Linux Screen

```shell
screen -r
```



##### Reattch to a specific screen session

###### I、Find the session ID list

```shell
screen -ls
```

###### II、Reattach to it 

```sh
screen -r <SESSION>
```



### 参考

1. [How To Use Linux Screen](https://linuxize.com/post/how-to-use-linux-screen/)