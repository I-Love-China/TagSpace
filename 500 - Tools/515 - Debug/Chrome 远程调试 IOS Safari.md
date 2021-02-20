## Chrome 远程调试 IOS Safari

### 前言/适用场景

Ubuntu18.04 上使用 Chrome 远程调试 Safari 手机浏览器中打开的页面



### 前置条件/依赖安装

#### libusbmuxd-2.0

**Why:** libimobiledevice-1.3 所需依赖

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/ios_webkit_debug_proxy_issue_20210220130909.png)

**How:**

```shell
sudo apt install build-essential checkinstall git autoconf automake libtool-bin libssl-dev pkg-config cython
git clone https://github.com/libimobiledevice/libplist
git clone https://github.com/libimobiledevice/libusbmuxd
git clone https://github.com/libimobiledevice/libimobiledevice
git clone https://github.com/libimobiledevice/usbmuxd
cd libplist
./autogen.sh
make && sudo make install
sudo ldconfig
cd ..
cd libusbmuxd
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./autogen.sh
make && sudo make install
sudo ldconfig
cd ..
cd libmobiledevice
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./autogen.sh --enable-debug
make && sudo make install
cd ..
cd usbmuxd
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --runstatedir=/run
make && sudo make install
sudo killall usbmuxd
```



#### libimobiledevice-1.3

**Why:** ios-webkit-debug-proxy 需要 1.3 版本的 libimobiledevice，否则可能在构建时报错: 

`Requested 'libimobiledevice-1.0 >= 1.3.0' but version of libimobiledevice is 1.2.1`   ![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/ios_webkit_debug_proxy_autogen_issue_20210209173644.png)



**How:** 手动编译安装 `libimobiledevice-1.3` ^[2][3]^

```sh
# 依赖安装
sudo apt-get install \
	build-essential \
	checkinstall \
	git \
	autoconf \
	automake \
	libtool-bin \
	libplist-dev \
	libusbmuxd-dev \
	libssl-dev \
	usbmuxd
	
# 本地构建安装
git clone https://github.com/libimobiledevice/libimobiledevice.git
cd libimobiledevice

./autogen.sh
make
sudo make install
```




#### ios-webkit-debug-proxy

```shell
sudo apt-get install autoconf automake libusb-dev libusb-1.0-0-dev libplist-dev libplist++-dev usbmuxd libtool libimobiledevice-dev libssl-dev

git clone https://github.com/google/ios-webkit-debug-proxy.git
cd ios-webkit-debug-proxy

./autogen.sh
make
sudo make install
```



#### remotedebug-ios-webkit-adapter

```shell
npm install remotedebug-ios-webkit-adapter -g
```



### 使用

1. 手机通过数据线连接 PC

2. PC 执行命令

    ```shell
    remotedebug_ios_webkit_adapter --port=9000
    ```

    

3. 手机 Safari 打开任意网页

    <img src="https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/ios_webkit_debug_proxy_demo_mobile_20210220135400.png" height="460px"/>

4. PC Chrome 打开 `chrome://inspect`

   ![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/ios_webkit_debug_proxy_demo_pc_20210220134935.png)

### 效果

![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/ios_webkit_debug_proxy_demo_pc_20210220135626.png)





### 参考

1. [How to debug remote iOS device using Chrome DevTools](https://medium.com/@nikoloza/how-to-debug-remote-ios-device-using-chrome-devtools-f44d697003a7)
2. [How to install libimobiledevice latest version on Ubuntu 18.04](https://askubuntu.com/questions/1030200/how-to-install-libimobiledevice-latest-version-on-ubuntu-18-04)
3. https://github.com/libimobiledevice/libimobiledevice/issues/1067
4. https://github.com/libimobiledevice/libimobiledevice/issues/183
5. https://github.com/RemoteDebug/remotedebug-ios-webkit-adapter
6. https://blog.idrsolutions.com/2015/02/remote-debugging-ios-safari-on-os-x-windows-and-linux/