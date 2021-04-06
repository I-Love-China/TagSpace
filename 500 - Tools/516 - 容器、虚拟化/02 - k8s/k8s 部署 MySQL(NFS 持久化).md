## k8s 部署 MySQL(NFS 持久化)

> [原文地址](https://ld246.com/article/1579415278878)



### Why 持久化

> So when I redeploy or restart my pod it won't wipe the data. ^[1]^



### 方法/步骤 ^[2]^

#### I、NFS 服务创建

#### II、PersistentVolume 创建

```yaml
kind: PersistentVolume
apiVersion: v1
metadata:
  name: mysql-pv
  namespace: database
spec:
  accessModes:
    - ReadWriteOnce      
  capacity:
    storage: 1Gi
  persistentVolumeReclaimPolicy: Retain
  storageClassName: nfs
  nfs:
    path: /data/nfs/mysql
    server: nfs服务IP
```



#### III、PersistentVolumeClaim 创建

```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: mysql-pvc
  namespace: database
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: nfs     
```



## 参考:

1. [How to persist when running a mysql on a kubernetes cluster](https://stackoverflow.com/questions/54774176/how-to-persist-when-running-a-mysql-on-a-kubernetes-cluster)
2. [K8S 部署 Mysql(NFS 持久化)](https://ld246.com/article/1579415278878)