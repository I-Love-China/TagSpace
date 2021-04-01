## if 常用操作

### 测试文件夹是否为空 ^[1]^

```bash
if [ -z "$(ls -A /path/to/dir)" ]; then
   echo "Empty"
else
   echo "Not Empty"
fi
```



## 参考

1. [Bash scripting: test for empty directory](https://superuser.com/questions/352289/bash-scripting-test-for-empty-directory)