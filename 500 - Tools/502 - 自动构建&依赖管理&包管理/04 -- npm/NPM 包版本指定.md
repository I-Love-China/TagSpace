﻿## NPM 包版本指定 ^[1]^

[**原文链接**](https://www.cnblogs.com/wshiqtb/p/6395029.html)



### 前言: 版本的格式

`major.mirror.patch`

主版本号.次版本号.修补版本号

————————————————————

patch：修复bug，兼容老版本

minor：新增功能，兼容老版本

major：新的架构调整，不兼容老版本



### 版本指定形式

#### version

  > 必须匹配某个版本
  >
  > 如：1.1.2，表示必须依赖1.1.2版

#### \>version

  > 必须大于某个版本
  >
  > 如：>1.1.2，表示必须大于1.1.2版

#### \>=version

  > 可大于或等于某个版本
  >
  > 如：>=1.1.2，表示可以等于1.1.2，也可以大于1.1.2版本

#### <version

  > 必须小于某个版本 
  >
  > 如：<1.1.2，表示必须小于1.1.2版本

#### <=version

  > 可以小于或等于某个版本
  >
  > 如：<=1.1.2，表示可以等于1.1.2，也可以小于1.1.2版本

#### ~version

  > 大概匹配某个版本   ==major 必须指定==
  >
  > 如果minor版本号指定了，那么minor版本号不变，而patch版本号任意
  >
  > 如果minor和patch版本号未指定，那么minor和patch版本号任意
  >
  > 如：~1.1.2，表示>=1.1.2 <1.2.0，可以是1.1.2，1.1.3，1.1.4，.....，1.1.n 
  >
  > 如：~1.1，表示>=1.1.0 <1.2.0，可以是同上
  >
  > 如：~1，表示>=1.0.0 <2.0.0，可以是1.0.0，1.0.1，1.0.2，.....，1.0.n，1.1.n，1.2.n，.....，1.n.n

#### ^version

  > 兼容某个版本
  >
  > 版本号中最左边的非0数字的右侧可以任意
  >
  > 如果缺少某个版本号，则这个版本号的位置可以任意
  >
  > 如：^1.1.2 ，表示>=1.1.2 <2.0.0，可以是1.1.2，1.1.3，.....，1.1.n，1.2.n，.....，1.n.n
  >
  > 如：^0.2.3 ，表示>=0.2.3 <0.3.0，可以是0.2.3，0.2.4，.....，0.2.n
  >
  > 如：^0.0，表示 >=0.0.0 <0.1.0，可以是0.0.0，0.0.1，.....，0.0.n

#### x-range

  > x的位置表示任意版本
  >
  > 如：1.2.x，表示可以1.2.0，1.2.1，.....，1.2.n

#### *-range

  > 任意版本，""也表示任意版本
  >
  > 如：*，表示>=0.0.0的任意版本

#### version1 - version2

  > 大于等于version1，小于等于version2
  >
  > 如：1.1.2 - 1.3.1，表示包括1.1.2和1.3.1以及他们件的任意版本

#### range1 || range2

  > 满足range1或者满足range2，可以多个==范围==
  >
  > 如：<1.0.0 || >=2.3.1 <2.4.5 || >=2.5.2 <3.0.0，表示满足这3个范围的版本都可以




## 参考

1. [package.json中 npm依赖包版本前的符号的意义](https://www.cnblogs.com/wshiqtb/p/6395029.html)