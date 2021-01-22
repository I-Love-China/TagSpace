## Nginx 基础使用

### 配置代理服务器
#### 配置方法 A
```nginx

# /etc/nginx/nginx.conf
http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;

    upstream tomcat_test.com {
        server 192.168.1.114:8686 weight=10 max_fails=2 fail_timeout=30s;
    }

    server {
        listen 8686;

        location / {
            proxy_pass http://tomcat_test.com;
            proxy_set_header Host $host;
            proxy_set_header X-real-ip $remote_addr;
            proxy_set_header X-Forwarded-For  $proxy_add_x_forwarded_for;
        }
    }
}

```

#### 配置方法 B
```nginx
# 在 http 块中添加

server {
        listen 8686;

        location / {
            proxy_pass http://192.168.1.114:8080;
            proxy_set_header Host $host;
            proxy_set_header X-real-ip $remote_addr;
            proxy_set_header X-Forwarded-For  $proxy_add_x_forwarded_for;
        }
}
```


### 参考
