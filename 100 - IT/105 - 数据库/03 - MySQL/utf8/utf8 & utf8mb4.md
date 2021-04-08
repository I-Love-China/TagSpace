## utf8 / utf8mb4

> [原文链接](https://stackoverflow.com/questions/30074492/what-is-the-difference-between-utf8mb4-and-utf8-charsets-in-mysql)



### 简介 / 因为

> [UTF-8](https://en.wikipedia.org/wiki/UTF-8) is a ==variable-length== encoding. In the case of UTF-8, this means that storing one code point requires ==one to four bytes==. 

> However, MySQL's encoding called `utf8` (alias of `utf8mb3`) only stores a ==maximum of three bytes== per code point.



### 所以

> So the character set `utf8`/`utf8mb3` ==cannot store all Unicode code points==: it only supports the range 0x000 to 0xFFFF, which is called the "[Basic Multilingual Plane](http://en.wikipedia.org/wiki/Plane_(Unicode)#Basic_Multilingual_Plane)". See also [Comparison of Unicode encodings](http://en.wikipedia.org/wiki/Comparison_of_Unicode_encodings#In_detail).



### 更具体点

> The character set named `utf8`[/`utf8mb3`] uses a maximum of three bytes per character and contains only BMP characters. As of MySQL 5.5.3, the `utf8mb4` character set uses a maximum of four bytes per character supports supplemental characters:
>
> - For a BMP character, `utf8`[/`utf8mb3`] and `utf8mb4` have identical storage characteristics: ==same code values, same encoding, same length==.
> - For a supplementary character, **`utf8`[/`utf8mb3`] cannot store the character at all**, while `utf8mb4` requires four bytes to store it. Since `utf8`[/`utf8mb3`] cannot store the character at all, you do not have any supplementary characters in `utf8`[/`utf8mb3`] columns and you need not worry about converting characters or losing data when upgrading `utf8`[/`utf8mb3`] data from older versions of MySQL.



## 参考

1. [What is the difference between utf8mb4 and utf8 charsets in MySQL?](https://stackoverflow.com/questions/30074492/what-is-the-difference-between-utf8mb4-and-utf8-charsets-in-mysql)