## if 常用操作

### 测试文件夹是否为空 ^[1]^

```bash
if [ -z "$(ls -A /path/to/dir)" ]; then
   echo "Empty"
else
   echo "Not Empty"
fi
```

### 测试数据库中是否存在表 ^[2]^
```bash
checkIfMySQLTableExists() {
    table=$1;
    if [ $(mysql -N -s -u root -p -e \
        "select count(*) from information_schema.tables where \
            table_schema='${table}' and table_name='${DB}';") -eq 1 ]; then
        echo "Table ${table} exists! ...";
    else
        echo "Table ${table} does not exist! ..."
        exit 1
    fi

}
```


## 参考

1. [Bash scripting: test for empty directory](https://superuser.com/questions/352289/bash-scripting-test-for-empty-directory)

2. [SpekkoRice](https://gist.github.com/SpekkoRice)/[checkiftablexists](https://gist.github.com/SpekkoRice/f88d8d7918b85dbfd85a)