## GitBash: Git fatal: protocol 'http' is not supported



### 问题表现

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/gitbash_http_not_supported_20210714102507.png)



### 原因

> Problem is probably this. ^[1]^
>
> You tried to paste it using
>
> - `CTRL +V`
>
> Sadly whenever you enter `CTRL +V` on **terminal** it adds
>
> - a **hidden** **^?**



> Many new users try to use `Ctrl + C` and `Ctrl + V` to copy and paste into Git Bash, but these shortcuts are reserved for other functions. 
>
> `Ctrl + C` interrupts the currently running command, 
>
> while `Ctrl + V` tells the terminal to treat the next typed character as a literal, (e.g. to *literally* add a keyboard combo such as `Ctrl + C`). ^[2]^





## 参考

1. [Git fatal: protocol 'https' is not supported](https://stackoverflow.com/questions/53988638/git-fatal-protocol-https-is-not-supported)
2. [How To Paste In Git Bash](https://initialcommit.com/blog/how-to-paste-in-git-bash)