## Use environment variables

### 问题

> I have the following scenario: I have an env variable `$SOME_IP` defined and want to use it in a nginx block. Referring to the [nginx documentation](http://wiki.nginx.org/CoreModule) I use the `env` directive in the `nginx.conf` file like the following:
>
> ```sh
> user www-data;
> worker_processes 4;
> pid /run/nginx.pid;
> 
> env SOME_IP;
> ```
>
> Now I want to use the variable for a `proxy_pass`. I tried it like the following:
>
> ```sh
> location / {
>     proxy_pass http://$SOME_IP:8000;
> }
> ```
>
> But I end up with this error message: `nginx: [emerg] unknown "some_ip" variable`



### 解决方法

> ### With NGINX Docker image
>
> Apply `envsubst` on template of the configuration file at container start. `envsubst` is included in official NGINX docker images.
>
> Environment variable is referenced in a form `$VARIABLE` or `${VARIABLE}`.
>
> **nginx.conf.template**:
>
> ```sh
> user  nginx;
> worker_processes  1;
> 
> error_log  /var/log/nginx/error.log warn;
> pid        /var/run/nginx.pid;
> 
> events {
>     worker_connections  1024;
> }
> 
> http {
>     server {
>         listen       80;
>         location / {
>             access_log off;
>             return 200 '${MESSAGE}';
>             add_header Content-Type text/plain;
>         }
>     }
> }
> ```
>
> **Dockerfile**:
>
> ```sh
> FROM nginx:1.17.8-alpine
> COPY ./nginx.conf.template /nginx.conf.template
> CMD ["/bin/sh" , "-c" , "envsubst < /nginx.conf.template > /etc/nginx/nginx.conf && exec nginx -g 'daemon off;'"]
> ```
>
> Build and run docker:
>
> ```sh
> docker build -t foo .
> docker run --rm -it --name foo -p 8080:80 -e MESSAGE="Hellou World" foo
> ```
>
> **NOTE**:==If config template contains dollar sign `$` which should not be substituted then list all used variables as parameter of `envsubst` so that only those are replaced.== E.g.:
>
> ```sh
> CMD ["/bin/sh" , "-c" , "envsubst '$USER_NAME $PASSWORD $KEY' < /nginx.conf.template > /etc/nginx/nginx.conf && exec nginx -g 'daemon off;'"]
> ```
>
> [Nginx Docker documentation](https://hub.docker.com/_/nginx) for reference. Look for **Using environment variables in nginx configuration**.
>
> > Using environment variables in nginx configuration
> >
> > ==Out-of-the-box, nginx doesn’t support environment variables inside most configuration blocks==. But envsubst may be used as a workaround if you need to generate your nginx configuration dynamically before nginx starts.
> >
> > Here is an example using docker-compose.yml:
> >
> > ```sh
> > web:
> >   image: nginx
> >   volumes:
> >     - ./mysite.template:/etc/nginx/conf.d/mysite.template
> >   ports:
> >     - "8080:80"
> >   environment:
> >     - NGINX_HOST=foobar.com
> >     - NGINX_PORT=80
> >   command: /bin/bash -c "envsubst < /etc/nginx/conf.d/mysite.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"
> > ```
> >
> > The `mysite.template` file may then contain variable references like this:
> >
> > `listen ${NGINX_PORT}`;



### Demo

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/nginx_template_envsubst_20211207105819.png)



## 参考

1. [nginx: use environment variables](https://stackoverflow.com/questions/21866477/nginx-use-environment-variables)