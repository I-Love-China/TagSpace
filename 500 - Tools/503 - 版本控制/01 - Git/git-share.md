## git-share

### A. 依赖第三方 git-server

1. [aliyun](https://code.aliyun.com)
2. [github](https://github.com)



### B. 自搭建 git-server

1. [gogs](https://github.com/gogs/gogs)

2. [Share using ssh server] ^[1]^

   1. *Preparing the repository*

      ```
      # On the SSH server we assume var/git as the central repository place and will create a new project-X dir
      $ cd /var/git
      $ mkdir project-X       
      $ cd project-X
      
      # now we initialize this directory
      # but instead of using git init, we use  git --bare init
      # "A short aside about what git means by bare: A default git repository assumes that you will be using it as your working directory
      # , so git stores the actual bare repository files in a .git directory alongside all the project files. Remote repositories don't need copies of the
       files on the filesystem unlike working copies, all they need are the deltas and binary what-nots of the repository itself. This is what "bare" means to git. Just the repository itself."
      $ git --bare init
      ```

   2. *Pushing your local repository to the shared repository*

      ```
      # First go to your local repository
      $ cd $HOME/project-X
      # Then make the link to the shared repository
      $ git remote add origin ssh://user@gitserver/var/git/project-X
      
      # We push to the remote repository
      $ git push origin master
      ```

   3. *Accessing the repository*

      ```
      # Another user can now clone the repository using:
      $ git clone ssh://user@gitserver/var/git/project-X
      # Change something
      $ ....
      # Commit the changes
      $ git commit -a
      # Push the changes to the central repository
      $ git push
      ```







### 各种方法比较 ^[1]^

| Repository                                                   | Pro                                                          | Con                                                          | Controlling Access                                           | Create Repositories                            |
| :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :--------------------------------------------- |
| [File share](http://www.jedi.be/blog/2009/05/06/8-ways-to-share-your-git-repository/#fileshare) | No network access required                                   | Not internet friendly                                        | Using filepermissions                                        | Needs preparation per project on the share     |
| [Git daemon](http://www.jedi.be/blog/2009/05/06/8-ways-to-share-your-git-repository/#gitdaemon) | Fast git protocol                                            | Not internet friendly port                                   | no good permission control. Read by default, Write can be enabled , but only anonymous | per project needs to be blessed                |
| [Plain SSH server](http://www.jedi.be/blog/2009/05/06/8-ways-to-share-your-git-repository/#sshserver) | Allows good security                                         | Not internet friendly port, requires account creation per user on server | Uses filepermissions                                         | per project inited                             |
| [SSH server git-shell](http://www.jedi.be/blog/2009/05/06/8-ways-to-share-your-git-repository/#gitshell) | Enhancement of Plain SSH Server scenario                     | Not internet friendly port, requires account creation per user on server | Uses filepermissions                                         | per project inited                             |
| [Gitosis](http://www.jedi.be/blog/2009/05/06/8-ways-to-share-your-git-repository/#gitosis) | Adds good remote management of users and repositories, only requires one system account | Not internet friendly port                                   | Uses gitosis-config file                                     | No server initalisation, only config is needed |
| [Apache http](http://www.jedi.be/blog/2009/05/06/8-ways-to-share-your-git-repository/#apachehttp) | Falls back to standard apache config, only requires one system account, internet friendly | Slightly overhead                                            | Uses htpasswd                                                | per project inited                             |
| [Apache http + gitweb](http://www.jedi.be/blog/2009/05/06/8-ways-to-share-your-git-repository/#apachehttpgitweb) | Falls back to standard apache config, only requires one system account, internet friendly, adds nice view of repository | Slightly overhead, read-only access                          | Uses htpasswd                                                | per project inited                             |
| [github](http://www.github.com/)                             | Internet accessible, easy to use webinterface                | Hosted externally                                            | Managing sshkeys                                             | Web interface                                  |





## 参考

1. [8 ways to share your git repository](http://www.jedi.be/blog/2009/05/06/8-ways-to-share-your-git-repository/)