### 安装

#### CentOS 安装 Typora

```shell
wget -O Typora-linux-x64.tar.gz https://typora.io/linux/Typora-linux-x64.tar.gz

tar xzf Typora-linux-x64.tar.gz
mv bin/Typora-linux-x64 /opt/

echo "[Desktop Entry]
Name=Typora
Comment=Typora
Exec=/opt/Typora-linux-x64/Typora
Icon=/opt/Typora-linux-x64/resources/app/asserts/icon/icon_512x512@2x.png
Terminal=false
Type=Application
StartupNotify=true
Categories=Development;
" > /usr/share/applications/Typora.desktop
```





### 	功能

####  [画图(时序图、流程图、甘特图、类图、状态机、饼图)](https://support.typora.io/Draw-Diagrams-With-Markdown/)

### 快捷键

#### 段落

| Function               | Hotkey(Windows/Linux)      |
| ---------------------- | -------------------------- |
| Heading 1 to 6         | `Ctrl 1/2/3/4/5/6`         |
| Increase Heading Level | `Ctrl + =`                 |
| Decrease Heading Level | `Ctrl + -`                 |

#### 表格
| Function               | Hotkey(Windows/Linux)      |
| ---------------------- | -------------------------- |
| Table                  | `Ctrl + T`                 |
| Table 增加行           | `Ctrl + Enter`             |
| Table 删除行           | `Ctrl + Shift + Backspace` |

#### 格式
| Function               | Hotkey(Windows/Linux)      |
| ---------------------- | -------------------------- |
| Strong           | `Ctrl + B` |
| Emphasis | `Ctrl + I` |

#### 视图

| Function         | Hotkey(Windows/Linux) |
| ---------------- | --------------------- |
| Toggle Sidebar   | `Ctrl + Shift + L`    |
| Outline          | `Ctrl + Shift + 1`    |
| Source Code Mode | `Ctrl + /`            |



### 参考
1. [Typora#Shortcut Keys](https://support.typora.io/Shortcut-Keys/#change-shortcut-keys)