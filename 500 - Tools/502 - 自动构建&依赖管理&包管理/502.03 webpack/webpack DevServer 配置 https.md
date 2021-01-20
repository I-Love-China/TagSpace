### webpack devServer 配置 https



#### I. 生成自签名 HTTPS 证书
  ```shell
  openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout private.key -out certificate.crt
  ```
  > 说明：需要依次输入国家，地区，城市，组织，组织单位，Common Name和Email。其中Common Name，可以写自己的名字或者域名，如果要支持https，Common Name应该与域名保持一致，否则会引起浏览器警告。^[1]^

#### II. 配置 devServer 使用 HTTPS
  ```javascript
  // config/plugin.config.js
  config.devServer
    .https({
      key: fs.readFileSync('/path/to/private.key'),
      cert: fs.readFileSync('/path/to/certificate.crt')
    });
  ```





### 参考

1. [如何创建一个自签名的SSL证书(X509)](https://www.jianshu.com/p/a9497de4cbff)
2. [Umijs v2 devServer 文档](https://v2.umijs.org/config/#devserver)
3. [webpack devServer 配置文档](https://webpack.js.org/configuration/dev-server/#devserverhttps)
4. [webpack chain devServer 配置 https](https://github.com/neutrinojs/webpack-chain/blob/a5e3c4d00671c95ecc2d42faea07464c14460e61/types/index.d.ts#L189)