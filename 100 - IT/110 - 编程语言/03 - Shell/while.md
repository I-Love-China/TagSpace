### 读整行 ^[1]^
```shell
while IFS= read -r line
do
  echo $line
done < file
```


### 读 field ^[1]^
```shell
while IFS=read field1 field2
do
  echo $field1
done < file
```


### 参考
1. [While loop](https://bash.cyberciti.biz/guide/While_loop)

