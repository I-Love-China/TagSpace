## Force user to logout

### 方法

```bash
# kill all processes owned by the user.
sudo pkill -u zhangjl

# Force process termination if the user is still logged in after a while.
sudo pkill -9 -u zhangjl
```





## 参考
1. [How to force user to logout in Linux](https://www.simplified.guide/linux/user-force-logout)

