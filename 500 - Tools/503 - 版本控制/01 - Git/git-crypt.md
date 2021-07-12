### git-crypt 合并分支配置 ^[1]^
1. 安装最新 git-crypt(可能需要手动编译)
2. .gitattributes 文件中配置 merge 选项
不配置 merge 选项会导致合并的时候签出加密后的文件
```
* !filter !diff merge=git-crypt

.gitattributes !filter !diff
.gitignore !filter !diff
```

### 参考
1. [Problem with git merge #140](https://github.com/AGWA/git-crypt/issues/140)