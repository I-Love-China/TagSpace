## GitLab 配置 server hooks

### a. Create a server hook for a repository ^[2]^

1. Locate the repository path

   - For an installation from source, the path is usually `/home/git/repositories/<group>/<project>.git`.
   - For Omnibus GitLab installs, the path is usually `/var/opt/gitlab/git-data/repositories/<group>/<project>.git`.

2. On the file system, create a new directory in this location called `custom_hooks`.

3. Inside the new `custom_hooks` directory, create a file with a name matching the hook type. 

   > For example, for a pre-receive hook the filename should be `pre-receive` with no extension. 

4. Make the hook file executable and ensure that it’s owned by the Git user.

5. ```bash
   # gitlab-ctl restart
   gitlab-ctl reconfigure
   ```
   
   

### b. Create a global server hook for all repositories ^[2]^

1. Locate GitLab Shell directory
   - For an installation from source is usually `/home/git/gitlab-shell/hooks`.
   - For Omnibus GitLab installs is usually `/opt/gitlab/embedded/service/gitlab-shell/hooks`.

2. To use a different directory for global server hooks, set `custom_hooks_dir` in Gitaly configuration:
   - For Omnibus installations, this is set in `gitlab.rb`.
   - For source installations, the configuration location depends on the GitLab version. For:
     - GitLab 13.0 and earlier, this is set in `gitlab-shell/config.yml`.
     - GitLab 13.1 and later, this is set in `gitaly/config.toml` under the [hooks] section.




### 注意

1. 原来的 `pre-receive`、`update`、`post-receive` 需要原样保留 ^[1]^
   ![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/gitlab_hooks_20210903191727.png)





## 参考

1. [gitLab 全局hooks和custom_hooks，以及服务器端自动更新和备份（一）](https://www.cnblogs.com/hpcpp/p/7380939.html)

2. [Server hooks](https://docs.gitlab.com/ee/administration/server_hooks.html#create-a-global-server-hook-for-all-repositories)