## Jenkins 实践
### 部署带有子模块的 git 项目 ^[1]^
1. configure -> Source Code Management 

2. Additional Behaviours 块中:  Add -> Advanced sub-modules behaviours

3. 勾选 [Use credentials from default remote of parent repository]
![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/jenkins-git-submodule-20210125164433.png)

## 参考
1. [Jenkins: Deploying Projects from Git with Submodules](https://dzone.com/articles/jenkins-deploying-projects-from-git-with-submodule#:~:text=Go%20to%20%22Configure%22%20the%20Jenkins,to%20run%20the%20job%20again.)