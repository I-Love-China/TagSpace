## Nginx underscores_in_headers



### 问题

> I have multiple apps in Google Play and App Store. These send custom request headers but these headers include an underscore e.g `api_key`. ^[1]^



### 解决方法

> You need to set `underscores_in_headers on` in [your NGINX config](http://nginx.org/en/docs/http/ngx_http_core_module.html#underscores_in_headers). ^[1]^



### 扩展

- [What precautions need to be taken when I turn underscores_in_headers on?](https://stackoverflow.com/questions/26806940/nginx-what-precautions-need-to-be-taken-when-i-turn-underscores-in-headers-on)

  > This is done in order to prevent ambiguities when mapping headers to CGI variables, as both dashes and underscores are mapped to underscores during that process. ^[2]^



## 参考

1. [Get headers with an underscore on NGINX](https://stackoverflow.com/questions/26938604/get-headers-with-an-underscore-on-nginx)

2. [Nginx - What precautions need to be taken when I turn underscores_in_headers on?](https://stackoverflow.com/questions/26806940/nginx-what-precautions-need-to-be-taken-when-i-turn-underscores-in-headers-on)