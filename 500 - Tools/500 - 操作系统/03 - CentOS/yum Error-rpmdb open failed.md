## yum Error:rpmdb open failed



### 问题表现

>I'm trying to run `yum update` and I'm running this error:
>
>```
>rpmdb: PANIC: fatal region error detected; run recovery
>error: db3 error(-30974) from dbenv->open: DB_RUNRECOVERY: Fatal error, run database recovery
>error: cannot open Packages index using db3 - (-30974)
>error: cannot open Packages database in /var/lib/rpm
>CRITICAL:yum.main:
>
>Error: rpmdb open failed
>```
>
>I checked page [like this](http://www.linuxquestions.org/questions/linux-newbie-8/error-rpmdb-open-failed-4175469229/) one but running `yum clean all` runs the same error.
>
>How can I solve this?



### 解决方法

> This is how I fixed my problem.
>
> You may fix this by cleaning out rpm database. But first, in order to minimize the risk, make sure you create a backup of files in `/var/lib/rpm/` using `cp` command:
>
> ```bash
> mkdir /root/backups.rpm.mm_dd_yyyy/
> cp -avr /var/lib/rpm/ /root/backups.rpm.mm_dd_yyyy/
> ```
>
> The try this to fix this problem:
>
> ```bash
> rm -f /var/lib/rpm/__db*
> db_verify /var/lib/rpm/Packages
> rpm --rebuilddb
> yum clean all
> ```
>
> And finally verify that error has gone with the following yum command
>
> ```bash
> yum update
> ```





## 参考

1. [yum Error:rpmdb open failed](https://unix.stackexchange.com/questions/198703/yum-errorrpmdb-open-failed)