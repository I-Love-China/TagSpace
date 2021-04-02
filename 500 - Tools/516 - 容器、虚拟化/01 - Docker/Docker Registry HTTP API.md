## Docker Registry HTTP API

### Catalog

#### Find Repositories ^[1]^

##### 请求路径

```http
GET /v2/_catalog
```

##### 查询参数

| Name | Type    | Description                        |
| ---- | ------- | ---------------------------------- |
| n    | Integer | Maximum number of results          |
| last | string  | Last result from previous response |



### Repository

#### Find Tags ^[1]^

```http
GET /v2/{repository}/tags/list
```



## 参考

1. [Docker Registry HTTP API](https://ops4j.github.io/ramler/0.6.0/registry/#FindAPIversion)