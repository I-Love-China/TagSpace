## 坚果 Pro 刷机教程



### Prerequisition

#### 硬件

- 9008 工程线

- Linux PC (Windows 下 QFIL 问题太多……) ^[2]^

#### 软件
- [qdl 工具](https://github.com/danielkutik/qdl)
- [TWRP 线刷包](https://blag.dsstudio.tech/?p=707#:~:text=%E7%9A%84%E8%BD%AF%E4%BB%B6%E5%9D%87%E5%9C%A8-,%E8%BF%99%E9%87%8C,-%E5%8F%AF%E4%BB%A5%E4%B8%8B%E8%BD%BD%EF%BC%8C%E6%8F%90%E5%8F%96)
- [卡刷底包](https://blag.dsstudio.tech/?p=707#:~:text=%E7%9A%84%E8%BD%AF%E4%BB%B6%E5%9D%87%E5%9C%A8-,%E8%BF%99%E9%87%8C,-%E5%8F%AF%E4%BB%A5%E4%B8%8B%E8%BD%BD%EF%BC%8C%E6%8F%90%E5%8F%96)
- [卡刷 Mokee ROM 包](https://blag.dsstudio.tech/?p=707#:~:text=%E7%9A%84%E8%BD%AF%E4%BB%B6%E5%9D%87%E5%9C%A8-,%E8%BF%99%E9%87%8C,-%E5%8F%AF%E4%BB%A5%E4%B8%8B%E8%BD%BD%EF%BC%8C%E6%8F%90%E5%8F%96)



### 步骤

1. 启动 `qdl` 工具 (图中为 坚果的线刷包，实际中请使用 TWRP 线刷包)
   ![](https://picgo-notes.oss-cn-beijing.aliyuncs.com/img/qdl_20210830130818.png)
2. 手机关机
3. 同时按住 【音量加、音量减】键，使用 9008 工程线连接电脑，待识别后松开 9008 线上的小开关
4. 等待命令执行完毕
5. 设备重启进入 Recovery 模式(同时按住【音量加、音量键、电源键、HOME 键】)
6. 双清
7. 刷入底包
8. 刷入 Mokee
9. 安装 MagiskManager、
10. 下载 Magisk APK、文件名后缀改为 `.zip`
11. Recovery 模式下刷入 Magisk
12. Done





## 参考

1. [刷机、调试、香！坚果 Pro 折腾 Magisk | Root 方案](https://blag.dsstudio.tech/?p=707)

2. [Cannot flash Qualcomm with Stock Image (Lenovo Tab M10 TB-X605L LTE, Android 8 Oreo)](https://android.stackexchange.com/questions/224369/cannot-flash-qualcomm-with-stock-image-lenovo-tab-m10-tb-x605l-lte-android-8-o)

3. [danielkutik](https://github.com/danielkutik)/[qdl](https://github.com/danielkutik/qdl)

4. [坚果手机 Pro 魔趣刷入教程](https://bbs.mokeedev.com/t/topic/14503)