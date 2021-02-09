## Freedom

### githubusercontent.com ^[1]^
> https://site.ip138.com/raw.Githubusercontent.com/

```shell
#!/usr/bin/env bash

IP=151.101.108.133

{
cat << EOF
raw.githubusercontent.com
avatars.githubusercontent.com
camo.githubusercontent.com
EOF
} | while IFS= read -r domain
do
  echo "$domain $IP" | sudo tee -a /etc/hosts
done
```





## 参考

1. [GitHub raw.githubusercontent.com无法连接的问题](https://blog.csdn.net/benpaodelulu_guajian/article/details/105901921)