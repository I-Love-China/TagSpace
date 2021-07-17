## docker-compose 部署 SeaFile Server

### docker-compose.yml

```yml
version: '2.0'
services:
  db:
    image: mariadb:10.5
    container_name: seafile-mysql
    environment:
      - MYSQL_ROOT_PASSWORD=db_dev  # Requested, set the root's password of MySQL service.
      - MYSQL_LOG_CONSOLE=true
    volumes:
      - /opt/seafile-mysql/db:/var/lib/mysql  # Requested, specifies the path to MySQL data persistent store.
    networks:
      - seafile-net

  memcached:
    image: memcached:1.5.6
    container_name: seafile-memcached
    entrypoint: memcached -m 256
    networks:
      - seafile-net
          
  seafile:
    image: seafileltd/seafile-mc:latest
    container_name: seafile
    ports:
      - "80:80"
#     - "443:443"  # If https is enabled, cancel the comment.
    volumes:
      - /opt/seafile-data:/shared   # Requested, specifies the path to Seafile data persistent store.
    environment:
      - DB_HOST=db
      - DB_ROOT_PASSWD=db_dev  # Requested, the value shuold be root's password of MySQL service.
      - TIME_ZONE=Etc/UTC  # Optional, default is UTC. Should be uncomment and set to your local time zone.
      - SEAFILE_ADMIN_EMAIL=me@example.com # Specifies Seafile admin user, default is 'me@example.com'.
      - SEAFILE_ADMIN_PASSWORD=asecret     # Specifies Seafile admin password, default is 'asecret'.
      - SEAFILE_SERVER_LETSENCRYPT=false   # Whether to use https or not.
      - SEAFILE_SERVER_HOSTNAME=docs.seafile.com # Specifies your host name if https is enabled.
    depends_on:
      - db
      - memcached
    networks:
      - seafile-net

networks:
  seafile-net:
```



### configurations

#### Custom admin username and password

> The default admin account is `me@example.com` and the password is `asecret`. You can use a different password  by setting the container's environment variables in the `docker-compose.yml`: e.g.
>
> ```yml
> seafile:
>     environment:
>     	...
>     	- SEAFILE_ADMIN_EMAIL=me@example.com
>     	- SEAFILE_ADMIN_PASSWORD=a_very_secret_password
>     	...
> ```





## 参考

1. [Deploy Seafile with Docker](https://download.seafile.com/published/seafile-manual/docker/deploy%20seafile%20with%20docker.md)