﻿### 安装 & 配置
#### 安装更新版本的 git
```shell
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt install git-all
```

#### 安装后首次配置
```shell
git config --global core.quotepath false
git config --global core.editor nano
```

#### 配置 alias
```shell
git config --global alias.unstage "reset HEAD --"
git config --global alias.ci "commit"
git config --global alias.co "checkout"
git config --global alias.st "status"
```

### 查看历史

#### 查看 Committer、Author ^[3][4]^
```shell
git log  --pretty=format:"Author: %an (%ae) %n Committer: %cn %ce" origin/master 
```

#### 显示某次提交时，某个文件的内容 ^[12]^
```shell
git show [commit]:[filename]
```

#### 显示所有提交过的用户，按提交次数排序 ^[12]^
```shell
git shortlog -sn
```

### 添加暂存区
#### 只将已跟踪的文件加入暂存区
```shell
git add -u
```

####  不将某个文件加入暂存区 ^[7]^
a. 先全部添加，然后将不想加入暂存区的文件移出暂存区
b. 
```shell
git add --all -- :!path/to/file1 :!path/to/file2 :!path/to/folder1/*
```

#### 取消暂存所有文件 ^[11]^
```shell
git reset
```

### 分支
#### 查看所有本地分支 ^[12]^
```shell
git branch
```

#### 查看所有远程分支 ^[12]^
```shell
git branch -r
```

#### 查看所有分支(本地 & 远程) ^[8]^
```shell
git branch -a
```

#### 查看当前分支名称 ^[8]^
```shell
git branch --show-current
```

#### 从指定提交创建新分支 ^[5]^
```shell
git branch test 07aeec983bfc17c25f0b0a7c1d47da8e35df7af8
```

#### 创建 Orphan 分支[没有父提交] ^[13]^
```shell
git checkout --orphan foobar

# Unstage all the files in your working tree.
git rm --cached $(git ls-files)
```

### 远程仓库相关
#### fetch ^[8]^
```shell
git fetch <remote>
```

#### 删除远程分支 ^[8]^
```shell
git push origin --delete <branch_name>
```

#### 将本地所有分支推送到指定远程服务器 ^[1]^
```shell
git push REMOTE --all
```

#### 将指定分支推送到所有远端服务器 ^[2]^
- 方法 1: 手动修改 .git/config 文件
```shell
# 先修改 .git/config 文件
[remote "all"]
  url=ssh://user@server/repos/g0.git
  url=ssh://user@server/repos/g1.git

# 然后直接 push 到 all
git push all master
```
- 方法 2
```shell
git config --add remote.all.url ssh://user@server/repos/g0.git
git config --add remote.all.url ssh://user@server/repos/g1.git
```

#### clone 时指定用户名[密码] ^[15]^

```shell
# 指定用户名
git clone https://username@github.com/username/repository.git

# 指定用户名 & 密码
git clone https://username:password@github.com/username/repository.git
```



### stash

#### stash message
```shell
git stash save <message>
```

#### 使用指定索引处的储藏
```shell
git stash apply stash${1} # 使用第二个储藏
```

### diff

#### compare staged changes with specific commit  ^[16]^
```bash
git diff [--options] --cached [<commit>] [--] [<path>...]
```

> This form is to view the changes you staged for the next commit relative to the named `<commit>`. Typically you would want comparison with the latest commit, so if you do not give `<commit>`, it defaults to HEAD. ^[16]^



#### compare working directory with specific commit ^[16]^

```bash
git diff [--options] <commit> [--] [<path>...]
```

> This form is to view the changes you have in your working tree relative to the named `<commit>` ^[16]^



#### compare any two commits

```bash
git diff [--options] <commit> <commit> [--] [<path>...]
```

> This is to view the changes between two arbitrary `<commit>`s.



### credential

#### credential 文件位置
  - 默认 ~/.git-credentials ^[9]^

### 签出
#### 签出指定提交中的所有文件 ^[10]^
```shell
git checkout <commit> -- .
```

#### 签出指定提交中的某个文件 ^[6]^
```shell
git checkout COMMIT -- file1/to/restore  fiel2/to/restore
```

#### 签出远程仓库的所有分支 ^[17]^
```shell
#!/bin/bash

#Whenever you clone a repo, you do not clone all of its branches by default.
#If you wish to do so, use the following script:

for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master `; do
   git branch --track ${branch#remotes/origin/} $branch
done
```



### 连接

#### 配置代理 ^[14]^
```shell
git config --global http.proxy http://127.0.0.1:1081
git config --global https.proxy https://127.0.0.1:1081
```



### 后悔药

#### 修改提交的 author 信息 ^[18]^

**a. 最近的一次提交**

```bash
# 注意邮箱的 "<>" 也是需要的 😂😂
git commit --amend --author="John Doe <john@doe.org>"
```



**b. 更早的提交**

```bash
git rebase -i <commit>

git commit --amend --author="John Doe <john@doe.org>" --no-edit
git rebase --continue
```





### 参考

1. [Push local Git repo to new remote including all branches and tags](https://stackoverflow.com/questions/6865302/push-local-git-repo-to-new-remote-including-all-branches-and-tags)

2. [git push to multiple repositories simultaneously [duplicate]](https://stackoverflow.com/questions/4255865/git-push-to-multiple-repositories-simultaneously/4255934#4255934)

3. [How can I display the committer using git diff](https://stackoverflow.com/questions/26360563/how-can-i-display-the-committer-using-git-diff)

4. [git-log](https://git-scm.com/docs/git-log)

5. [How to create the branch from specific commit in different branch](https://stackoverflow.com/questions/8483983/how-to-create-the-branch-from-specific-commit-in-different-branch/8491176)

6. [How can I reset or revert a file to a specific revision?](https://stackoverflow.com/questions/215718/how-can-i-reset-or-revert-a-file-to-a-specific-revision)

7. [Add all files to a commit except a single file?](https://stackoverflow.com/questions/4475457/add-all-files-to-a-commit-except-a-single-file)

8. [一学就会的git命令](https://mp.weixin.qq.com/s/-LHi_9Z0lfBoxg-kjoIdWg)

9. [git-scm doc git-credential-store#_options](https://git-scm.com/docs/git-credential-store#_options)

10. [Git checkout all files from exact commit](https://stackoverflow.com/questions/23956587/git-checkout-all-files-from-exact-commit)

11. [git unstage all files](https://michaelsoolee.com/git-unstage-all/)

12. [常用的Git命令清单](https://mp.weixin.qq.com/s/r68M3qQ3Ed1J5ge1kLxrYQ)

13. [How can I start a clean branch with no ancestry, then commit files progressively?](https://stackoverflow.com/questions/11487811/how-can-i-start-a-clean-branch-with-no-ancestry-then-commit-files-progressively/11487993)

14. [Github 仓库 git clone 速度过慢解决方案](https://www.funyan.cn/p/5538.html)

15. [How do I provide a username and password when running “git clone git@remote.git”?](https://stackoverflow.com/questions/10054318/how-do-i-provide-a-username-and-password-when-running-git-clone-gitremote-git)

16. [Difference between a git commit and the working directory?](https://stackoverflow.com/questions/18124699/difference-between-a-git-commit-and-the-working-directory)

17. [wilmarvh](https://gist.github.com/wilmarvh)/[git checkout-all-branches.sh](https://gist.github.com/wilmarvh/95fe7daed6ee6a63d811677e040ae421)

18. [How can I change the author name / email of a commit?](https://www.git-tower.com/learn/git/faq/change-author-name-email/)

