## Properly set permissions for NFS folder



### 问题/背景
> When I export and mount it to my Mac using the Disk Utility it mounts, but then when I try to open the folder is says I do not have permissions. I have set rw, sync, and no_subtree_check. The user on the Mac is darren with a bunch of groups.
>
> Do I need to have the same group and user set to access the folder? ^[1]^



### 问题原因
> NFS is built on top of RPC authentication. With NFS version 3, the most common authentication mechanism is AUTH_UNIX. ==The user id and group id of the client system are sent in each RPC call, and the permissions these IDs have on the file being accessed are checked on the server.== For this to work, the UID and GIDs must be the same on the server and the clients.  ^[1]^




### 解决方法
> However, you can force all access to occur as a single user and group by combining the `all_squash`, anonuid, and anongid export options. `all_squash` will map all UIDs and GIDs to the anonymous user, and anonuid and anongid set the UID and GID of the anonymous user.

> For example, if your UID and GID on your dev server are both 1001, you could export your home directory with a line like
>
> ```
> /home/darren       192.168.1.1/24(rw,all_squash,anonuid=1001,anongid=1001)
> ```
>
> 
>
> I'm less familiar with NFS version 4, but I think you can set up `rpc.idmapd` on the clients to alter the uid and gid they send to the server. ^[1]^





## 参考

1. [How to properly set permissions for NFS folder? Permission denied on mounting end.](https://serverfault.com/questions/240897/how-to-properly-set-permissions-for-nfs-folder-permission-denied-on-mounting-en)