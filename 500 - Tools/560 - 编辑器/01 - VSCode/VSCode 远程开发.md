## VSCode 远程开发

### Why 远程开发 / 优点 ^[1]^

1. 开发和部署在同一个环境下
2. 本地开发环境沙盒处理，避免影响本地机器的配置
3. 项目中的每个开发者都使用一致的开发环境
4. 某些工具可能在本地机器的操作系统上不提供
5. 随时随地、不限设备访问远程开发环境
6. 远程服务器的性能更好，或者节约本地机器资源



### 前置条件

- 远程服务器 
  - ssh 服务
- 本地机器
  - VSCode 



### 方法/步骤

#### I、安装 VSCode `Remote Development` 插件 ^[3]^

   `Ctrl + P`  打开 `Quick Open` 面板，键入 `ext install ms-vscode-remote.vscode-remote-extensionpack`



#### II、 VSCode 连接到远程服务器

按 `F1` 快捷键，输入(选择) `Remote-SSH: Connect to Host...` 

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/vscode_ssh_20210205104559.png)

填写正确的 `user@host`

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/vscode_ssh_uname_pwd_20210205104909.png)



#### III、打开对应工作空间，像在本地一样开发

   > After a moment, VS Code will connect to the SSH server and set itself up. VS Code will keep you up-to-date using a progress notification and you can see a detailed log in the `Remote - SSH` output channel. ^[2]^

   > You can then open any folder or workspace on the remote machine using **File > Open...** or **File > Open Workspace...** just as you would locally! ^[2]^
   > 

   ![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/vscode_ssh_log20210205105857.png)

   ![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/vscode_ssh_workspace_20210205110431.png)

  

### 可能遇到的问题

- `System limit for number of file watchers reached`

  **原因:**

  > Linux uses the [inotify](http://man7.org/linux/man-pages/man7/inotify.7.html) package to observe filesystem events, individual files or directories.
  >
  > Since React / Angular hot-reloads and recompiles files on save it needs to keep track of all project's files. Increasing the inotify watch limit should hide the warning messages. ^[4]^

  **解决方法:**
  
  ```shell
  echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
  ```
  
  

## 参考

1. [VS Code Remote Development](https://code.visualstudio.com/docs/remote/remote-overview)
2. [Remote Development using SSH](https://code.visualstudio.com/docs/remote/ssh#_debugging-on-the-ssh-host)
3. [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
4. [React Native Error: ENOSPC: System limit for number of file watchers reached](https://stackoverflow.com/questions/55763428/react-native-error-enospc-system-limit-for-number-of-file-watchers-reached)