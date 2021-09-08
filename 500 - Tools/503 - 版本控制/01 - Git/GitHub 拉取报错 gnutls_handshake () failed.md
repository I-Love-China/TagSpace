﻿## GitHub 拉取报错 "gnutls_handshake () failed"



### 解决方法: 设置 git 代理到可正常访问 GitHub 的代理服务器

```bash
git config --global http.https://github.com.proxy http://127.0.0.1:3128
git config --global https.https://github.com.proxy https://127.0.0.1:3128
```



### 扩展

- 取消配置代理 ^[1]^

  ```bash
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  ```

  



## 参考
1. [解决拉取 github 仓库报错 “gnutls_handshake () failed” 问题](https://blog.frytea.com/archives/421/)