> [原文链接](https://blog.justwe.site/post/git-submodule/)

### 背景/作用
项目中经常会使用到第三方的 git 库,将三方库整合到项目中最简单的办法就是复制粘贴,但是如果这个库更新升级了,你要怎么整合进来呢?
这就是本次要介绍的 `git-submodule` 操作,直接把第三方的版本库合并到自己的库中.

### 添加第三方库
这里是自己开了两个库做测试,主库叫 `body`,另一个库叫 `leg`

首先在本地的 `body` 库中添加 `leg`
```shell
git clone https://git.oschina.net/gaofeifps/body.git
cd body
git submodule add https://git.oschina.net/gaofeifps/leg.git
```
这时查看下状态会多两个文件

```shell
➜  body git:(master) ✗ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

       	new file:   .gitmodules
       	new file:   leg
```
这就多了一个 `leg` 的库,和一个`.gitmodules` 的文件,现在提交一下

```shell
git commit -am "add leg"
```

### 在其他地方使用合并后的版本库
本地提交了版本之后可以提交到远程试一下

```shell
git push
```
这时去远程库中看的话库中的内容是这样的 
![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/git_module1.png)
这里有个奇怪的 `leg@6dec2fa`,明明是没有的啊? 点一下原来是一个快捷方式,直接给链接到了 `leg` 库的地址,版本库中不会存第三方引入库的实体文件,而是通过 `.gitmodules` 的方式存储三方的联系方式,当下载到本地运行的时候才会再拉取文件

而且这个时候在其他的地方安装 `body` 这个库的时候直接运行 `git clone` 是生成不了完整的文件的,缺少了 `leg` 库的文件 因为这个时候的 `body/leg` 目录是空的需要多走一步,这时为什么呢?我们下面会讲到原因

```shell
git clone https://git.oschina.net/gaofeifps/body.git
git submodule init && git submodule update

# 下面这一句的效果和上面三条命令的效果是一样的,多加了个参数  `--recursive`
git clone https://git.oschina.net/gaofeifps/body.git --recursive
```

这时才是一个完整的库

### 将第三方库同步到主线

这里有个问题就是如果`body/leg`发生了更新就首先在这个文件中提交一个`commit`,然后在`body`这个目录下再 `commit`一次 第一次 commit 是为了更新 `leg`的版本控制,第二次更新是更新`body`的版本控制,同时更新 `leg`库在`body`的指针

如果更新的比较多,可以运行

### 批量更新第三方库
假设你的项目当中引入了100个第三方的库,你需要同步的时候难道还要每一个都要执行:
```shell
cd module-dir/
git checkout master
git pull
```
是不是想起了小学被老师罚抄一百遍的恐惧当中了? 少年,多看看文档准没错的,这些东西 git 早就帮你想好了 具体操作可以看一下 `git help submodule` 有相关的介绍的 不想看文档的就直接告诉你
```shell
git submodule foreach <command>
# 比如:
git submodule foreach git checkout master
```
这条命令就会按照 `.gitmodules` 会根据 `path` 寻找所有的三方模块,并在每一个模块中都执行 `foreach` 后的命令, 比如你想批量更新模块到最新的时候就:
```shell
git submodule foreach git submodule update
```

### 删除 submodule
在 git `1.7.8`之前,删除指定的 submodule 的命令是
```shell
git rm <submodule-name>
```
在新版的 git 下,则是运行以下命令
```shell
git submodule deinit <submodule-name>
```

### 查看本地有哪些第三方模块
```shell
➜  body git:(master) cat .gitmodules
[submodule "leg"]
       	path = leg
       	url = https://git.oschina.net/gaofeifps/leg.git
```

### 参考

1. [git-submodule](https://blog.justwe.site/post/git-submodule/)