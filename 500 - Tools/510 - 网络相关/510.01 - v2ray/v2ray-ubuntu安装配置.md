1. 安装  v2ray-core: https://github.com/v2fly/fhs-install-v2ray
2. 启动 v2ray-core 服务
  ```shell
    systemctl enable v2ray
    systemctl start v2ray
  ```

3. 安装  v2rayA -- [资料来源](https://v2xtls.org/v2ray-linux%e5%ae%a2%e6%88%b7%e7%ab%afv2raya%e4%b8%8b%e8%bd%bd%e5%ae%89%e8%a3%85%e5%8f%8a%e4%bd%bf%e7%94%a8%e6%95%99%e7%a8%8b-%e6%94%af%e6%8c%81vmess-vless-ss-ssr-trojan-pingtunnel/)

   ```shell
   wget -qO- http://apt.v2raya.mzz.pub/key/public-key.asc | sudo apt-key add - 
   sudo add-apt-repository 'deb http://apt.v2raya.mzz.pub/v2raya main'
   sudo apt update
   sudo apt install v2raya
   ```

4. 启动 v2rayA，添加管理员账号、添加订阅
  - https://jiang.netlify.com/



- 参考
  
  - https://tlanyan.me/v2ray-clients-download/
  
    