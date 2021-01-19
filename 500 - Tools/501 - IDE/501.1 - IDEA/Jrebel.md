### Jrebel 分享



#### 是什么 & 为什么使用？
- 背景: 编码完成后运行项目的方式
  1. 重新构建 & 启动
  2. devtools 自动重启
  3. 热部署: JRebel是一款JVM插件，实时监控java代码的状态，它使得Java代码修改后不用重启系统，立即生效。

#### 安装
- IDEA: Jrebel 插件


#### 破解
- https://ld246.com/article/1579141153169

####  配置
##### Tomcat 下使用(如 SSM 项目):  在 tomcat 启动参数上加参数 ^[5]^

##### 直接通过 JRebel 启动项目(如 SpringBoot 项目)
1. Jrebel 设置为离线使用:  jrebel激活之后默认是联网使用的 , 在该模式下 , jrebel会一直联网监测激活信息
2. IDEA 配置自动构建项目: Settings -> Build,Execution,Deployment -> Compiler -> 勾选 [Build project automatically]
3. IDEA 允许运行时自动编译: HELP -> FindAction -> Registry :  勾选 compiler.automake.allow.when.app.running
4. 勾选需要 Jrebel 监视的项目
5. 通过 JRebel 启动项目





#### 参考
  1. [【IDE】JRebel热部署实现](https://www.cnblogs.com/xzp-blog/p/13838855.html)
  2. [IDEA相关配置【JRebel】](https://zhuanlan.zhihu.com/p/100197952)
  3. [IntelliJ IDEA2018版热部署jrebel插件安装使用教程](https://www.cnblogs.com/liangmm/p/12909896.html)
  4. [Jrebel 热部署破解方法，长期有效](https://ld246.com/article/1579141153169)
  5. [在 IDEA 中用了热部署神器 JRebel 之后，开发效率提升10倍！](https://mp.weixin.qq.com/s/Yw3c3Q-haMYZSTAqf2ATzQ)
