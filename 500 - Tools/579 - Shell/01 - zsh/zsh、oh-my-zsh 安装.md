## 安装 & 配置为默认 Shell

### Debian 系

```shell
apt install zsh -y

chsh -s `which zsh`
```



## 安装配置 `oh-my-zsh`

```shell
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# [Optional] theme 修改为 `agnoster`
```

[oh-my-zsh Theme 预览](https://zshthem.es/all/)




## 参考
1. [zsh & oh-my-zsh 的配置与使用](https://zhuanlan.zhihu.com/p/58073103)