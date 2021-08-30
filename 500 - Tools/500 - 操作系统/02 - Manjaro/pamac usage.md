## pamac usage



### 常用命令列表 ^[1]^

| 命令                         | 描述                                                         |
| ---------------------------- | ------------------------------------------------------------ |
| `pamac search <package>`     | Search for packages                                          |
| `pamac search -f <package>`  | List all files a package owns                                |
| `pamac install <package>`    | To install a package from the official repository            |
| `pamac build <package>`      | To install a package from the AUR                            |
| `pamac remove <package>`     | To remove a package                                          |
| `pamac info <package>`       | To display information about a package in the official repository |
| `pamac info --aur <package>` | To display information about a package in the AUR            |
| `pamac checkupdates`         | To see what packages are available for upgrade from the official repository |
| `pamac upgrade`              | Update the system packages from the official repository      |
| `pamac list -o`              | List orphaned packages                                       |
| `pamac clean --keep 3`       | Remove old package cache for all but the last three.         |
| `pamac clean`                | Remove the entire package cache                              |



## 参考

1. [pamac – The Manjaro Package Manager](https://pikedom.com/pamac-the-manjaro-package-manager/)