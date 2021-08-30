### CentOS 挂载 NTFS 硬盘
1. Enable the Epel repository
  ```shell
  sudo yum install epel-release
  ```
2. Install ntfs-3g driver
  ```shell
  sudo yum install ntfs-3g
  ```
3. 挂载
    - 临时挂载
      ```shell
      sudo mount -t ntfs-3g /dev/sdc1 /mnt/typist/Enc1
      ```
    - 永久挂载
      1. Open /etc/fstab
      2. And add the line
        ```
        /dev/sdc1 /mnt/typist/Enc1 ntfs-3g defaults 0 0
        ```
    
4. 卸载
  ```shell
  umount /mnt/typist/Enc1
  ```



### 参考
1. [How to Mount a NTFS Drive on CentOS / RHEL / Scientific Linux](https://www.howtoforge.com/tutorial/mount-ntfs-centos/?__cf_chl_captcha_tk__=6d189561766d734b114bfb0da5391f3786c1fa0d-1609821547-0-AcUgACqwJYpCHc0JmVGum6SW4iCSTox5XrpWRffzf8xyiWVIeE2Zq2-uqetBGhs3eeA_Mz3QaunO96CXU3Gev35_wRY6gpGRhDs4gbajJ4Y7DAlgbpyd4J9RlpFgDbGcYm9VgagEmpUNx76GwbS_WkcXb5olZ8NeAD6Xa0Fsl3-DGkRd_E3NPVXW-pkZIaGtQkPBHT7Xsfhf9jmoWPJv7Qdfq5qDJvi13PKP0n1PKIedVFmtUUN2hv_zqWO_w3bpIUMYkwJOcYDcnCtGyMmZrcy9rivx8siNI9FThsuA7sXdUGrbNpBq8x3ENhTnpm-8Ho-l70X1JfZ_HVhl0GCDyga_pmBovaCfsVExZ8q0c4Wa9TcUBde7H4oYflLcV_0wPHv1U4HLYbgyywPgdzN38uy5RcnOySuNqnCkOrqRx9AH0RsNXJv-3rXG1vgWmPNxItRx-7fSXWUrQDP8WD-j4eY4MQX6qMPTHe1eB2rk6c_zV0kTZ9S2TXwAbqpo5at84w7mQ6AaALKloIaw6QPXcEUxzGm6C85OMha3jZRuc3cP9FMQglwT8hRvjN1hjpH60Q)

