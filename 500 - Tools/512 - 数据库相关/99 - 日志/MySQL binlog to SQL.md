## MySQL binlog to SQL

### 方法/步骤(使用 [binlog2sql](https://github.com/danfengcao/binlog2sql))

#### I、安装 binlog2sql 工具

```bash
git clone https://github.com/danfengcao/binlog2sql.git && cd binlog2sql
pip install -r requirements.txt
```



#### II、使用 binlog2sql 工具解析 binlog

```bash
./binlog2sql/binlog2sql.py -h127.0.0.1 -uroot -proot \
                           --start-file mysql-binlog.000187 \
                           --start-position=10731144 \
                           -d test_binlog
                           
```



### 演示

1. DML 操作
   ![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/mysql_binlog_recovery_dml_20210713181036.png)
2. mysqlbinlog
   ![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/mysql_binlog_recovery_binlog_20210713180808.png)



3. binlog2sql
   ![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/mysql_binlog_recovery_binlog2sql_20210713181324.png)





## 参考

1. [How can I parse mysql bin log file for statements (Row/Mixed Format)](https://dba.stackexchange.com/questions/105269/how-can-i-parse-mysql-bin-log-file-for-statements-row-mixed-format)
2. [binlog2sql](https://github.com/danfengcao/binlog2sql)

