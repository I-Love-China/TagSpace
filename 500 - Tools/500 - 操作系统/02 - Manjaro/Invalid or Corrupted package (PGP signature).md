## Invalid or Corrupted package (PGP signature)



## 解决方法

```bash
rm -R /etc/pacman.d/gnupg
rm -R /root/.gnupg
dirmngr </dev/null

gpg --refresh-keys

pacman-key --init
pacman-key --populate archlinux
pacman-key --refresh-keys
```





## 参考

1. [Invalid or corrupted package (PGP signature)](https://archived.forum.manjaro.org/t/invalid-or-corrupted-package-pgp-signature/324)

2. [pacman signature problems -- pacman -Syyu gives GPGME error: No data](https://bbs.archlinux.org/viewtopic.php?id=226755)

