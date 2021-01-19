# Ubuntu 安装、配置 Rime 输入法

1. 安装 Rime 输入法和双拼方案
```shell
sudo apt install ibus-rime
sudo apt install librime-data-double-pinyin
```
2. im-config 使用 ibus，重启电脑
3. 配置输入源:  System Settings -> Text Entry 中添加输入源（Input sources to use）为 Chinese(Rime)

3. 配置双拼方案: /home/user/.config/ibus/rime下增加配置文件default.custom.yaml:
```
patch:
  schema_list:
    - schema: luna_pinyin          # 朙月拼音
    - schema: luna_pinyin_simp     # 朙月拼音 简化字模式
    - schema: double_pinyin        # 自然碼雙拼
    - schema: double_pinyin_flypy  # 小鶴雙拼
```

4. 切换 Rime 输入方案
```
Ctrl + ~
```



### 参考
1. [RIME输入法配置双拼方案（Ubuntu下基于ibus）](https://blog.csdn.net/momo1938/article/details/107013949)
2. [RIME 常用配置备份](https://www.jianshu.com/p/2624fad33fe4)